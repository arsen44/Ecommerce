import * as React from "react";
import {
  Box,
  Flex,
  Dropdown,
  Button,
  IconButton,
  Text,
  Icon,
  FixedZIndex,
} from "gestalt";
import api from "../helpers/api";
import constantsSeacrhapi from "../helpers/constantsSeacrh";
import { debounce } from "throttle-debounce";
import Autosuggest from "react-autosuggest";
import { getQueryStringParams } from "../helpers/helpers";
import PropTypes from "prop-types";
import Link from "next/link";
import { connect } from "react-redux";
import { withRouter } from "next/router";
import { logout } from "../store/actions/auth";
import { fetchCart } from "../store/actions/cart";
import { updateSearchQuery, updateSearchResults } from "../store/actions/go";
import css from "../styles/layout.module.css";

import Logosmall from "../public/logosmall.svg";
import Logo from "../public/logo.svg";
import ShoppingCart from "./components/ShoppingCart";

const HEADER_ZINDEX = new FixedZIndex(5);
const DROP_MENU_ZINDEX = new FixedZIndex(10);

function TruncationDropdownExample() {
  const [open, setOpen] = React.useState(false);
  const [selected, setSelected] = React.useState(null);
  const anchorRef = React.useRef(null);
  const onSelect = ({ item }) =>
    setSelected(item.value === (selected || {}).value ? null : item);

  return (
    <Flex justifyContent="center">
      <IconButton
        accessibilityControls="sections-dropdown"
        accessibilityExpanded={open}
        accessibilityHaspopup
        icon="text-align-center"
        onClick={() => setOpen((prevVal) => !prevVal)}
        ref={anchorRef}
        selected={open}
        size="sm"
        inconColor="lightGray"
        role="button"
      />
      {open && (
        <Dropdown
          anchor={anchorRef.current}
          id="truncation-dropdown-menu"
          onDismiss={() => setOpen(false)}
          zIndex={DROP_MENU_ZINDEX}
        >
          <Dropdown.Item
            option={{ value: "О Нас", label: "О Нас" }}
            onSelect={onSelect}
          >
            <Link href="/about">
              <a>
                <Text weight="bold">О Нас</Text>
              </a>
            </Link>
          </Dropdown.Item>
          <Dropdown.Link option={{ value: "Контакты", label: "Контакты" }}>
            <Link href="/contacts">
              <a>
                <Text weight="bold">Контакты</Text>
              </a>
            </Link>
          </Dropdown.Link>
          <Dropdown.Link option={{ value: "Доставка", label: "Доставка" }}>
            <Link href="/delivery">
              <a>
                <Text weight="bold">Доставка</Text>
              </a>
            </Link>
          </Dropdown.Link>
        </Dropdown>
      )}
    </Flex>
  );
}

class Layout extends React.Component {
  static propTypes = {
    history: PropTypes.object,
  };
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    this.handleDismiss = this.handleDismiss.bind(this);
    this.doSearch = this.doSearch.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.onButtonClick = this.onButtonClick.bind(this);
    this.updateFilters = this.updateFilters.bind(this);
    this.anchorRef = React.createRef();

    this.state = {
      loading: false,
      value: "",
      data: [],
      query: "",
      facets: {},
      filters: {},
      next: null,
      previous: null,
      results: [],
      page: 1,
      count: 0,
      suggestions: [],
      open: false,
    };
  }

  componentDidMount() {
    this.props.fetchCart();
    const queryParams = getQueryStringParams(router.query);
    if (queryParams.query) {
      this.setState({ query: queryParams.query });
    }

    this.onSuggestionsFetchRequested = debounce(
      500,
      this.onSuggestionsFetchRequested
    );
  }

  renderSuggestion = (suggestion, { query }) => {
    const hasValue = query || query.length < 0;

    return (
      <Box>
        {hasValue ? (
          <Box paddingY={2}>
            <Icon icon="search" size={12} />
            <Text>{suggestion}</Text>
          </Box>
        ) : (
          <Box paddingY={2}>
            <Text> {suggestion}</Text>
          </Box>
        )}
      </Box>
    );
  };

  suggestOnChange = (event, { newValue }) => {
    this.setState({ query: newValue });
  };

  onSuggestionsFetchRequested = ({ value }) => {
    if (value.length > 0) {
      api.suggest(value).then((res) => {
        let results = [];
        res.data[constantsSeacrhapi.api.suggester].map((s) => {
          s.options.map((h) => {
            results.push(h.text);
          });
        });
        this.setState({ suggestions: results });
      });
    } else {
      let results = [
        "готовые торты",
        "детские",
        "свадебные",
        "candybar",
        "ягодные",
        "Супер VIP",
        "фотопечать",
        "все для кондитеров",
      ];

      this.setState({ suggestions: results });
    }
  };

  onSuggestionsClearRequested = () => {
    this.setState({ suggestions: [] });
  };

  getSuggestionValue = (suggestion) => {
    return suggestion;
  };

  doSearch() {
    const filters = this.updateFilters();
    api.search(this.state.query, filters).then((result) => {
      this.setState({
        facets: result.data.facets,
        next: result.data.next,
        previous: result.data.previous,
        results: result.data.results,
        count: result.data.count,
      });
      this.props.updateSearchResults(this.state.results);
    });
  }

  onButtonClick() {
    this.props.router.push(`/search/?search=${this.state.query}`);
    this.props.updateSearchQuery(this.state.query);
    this.props.updateSearchResults(this.state.results);
    this.doSearch();
  }

  onSubmit(event) {
    event.preventDefault();
    this.props.updateSearchQuery(this.state.query);
    this.props.updateSearchResults(this.state.results);
    this.doSearch();
  }

  componentDidMount() {
    const { query, results } = this.state;
    if (query && this.state.results.length === 0) {
      this.doSearch();
    }
  }

  updateFilters() {
    let filters = {};
    const formFilters = [].filter
      .call(document.getElementsByTagName("input"), (c) => c.checked)
      .map((c) => [c.name, c.value]);
    formFilters.map((f) => {
      let filterName = f[0];
      let filterValue = f[1];
      if (filterName in filters) {
        if (filterValue in filters[filterName]) {
        } else {
          filters[filterName][filterValue] = true;
        }
      } else {
        filters[filterName] = { [filterValue]: true };
      }
    });
    this.setState({
      filters: filters,
    });
    return filters;
  }

  handleClick() {
    this.setState(() => ({ open: !this.state.open }));
  }
  handleDismiss() {
    this.setState(() => ({ open: false }));
  }

  render() {
    const { authenticated, cart, loading } = this.props;
    const { open, query, suggestions } = this.state;

    const inputProps = {
      placeholder: "Поиск",
      value: query,
      onChange: this.suggestOnChange,
    };

    return (
      <Box>
        <Box role="banner">
          <Box
            id="HeaderContent"
            paddingY={2}
            paddingX={2}
            width="100%"
            zIndex={HEADER_ZINDEX}
            color="elevationAccent"
            display="none"
            smDisplay="block"
            position="fixed"
          >
            <Box display="none" smDisplay="flex" marginTop={3}>
              <Flex
                alignItems="center"
                flex="grow"
                gap={1}
                direction="row"
                height={50}
              >
                <Box>
                  <Link href="/">
                    <a>
                      <Logo className="Logo" />
                    </a>
                  </Link>

                  <Link href="/">
                    <a>
                      <Logosmall className="Logosmall" />
                    </a>
                  </Link>
                </Box>
                <TruncationDropdownExample />
                <Flex.Item flex="grow" direction="coulmn">
                  <Flex justifyContent="between">
                    <form onSubmit={this.onSubmit}>
                      <Autosuggest
                        suggestions={suggestions}
                        onSuggestionsFetchRequested={
                          this.onSuggestionsFetchRequested
                        }
                        onSuggestionsClearRequested={
                          this.onSuggestionsClearRequested
                        }
                        getSuggestionValue={this.getSuggestionValue}
                        renderSuggestion={this.renderSuggestion}
                        inputProps={inputProps}
                        alwaysRenderSuggestions={true}
                      />

                      <button
                        type="submit"
                        className="button"
                        onClick={this.onButtonClick}
                      />
                    </form>
                  </Flex>
                </Flex.Item>

                {authenticated ? (
                  <React.Fragment>
                    <Flex>
                      <IconButton
                        accessibilityControls="accessibility-example"
                        accessibilityExpanded={open}
                        accessibilityHaspopup
                        accessibilityLabel="Profile"
                        icon="person"
                        inconColor="lightGray"
                        onClick={() => this.handleClick()}
                        ref={this.anchorRef}
                        selected={open}
                        size="md"
                      />

                      {open && (
                        <Dropdown
                          anchor={this.anchorRef.current}
                          id="accessibility-example"
                          onDismiss={this.handleDismiss}
                          zIndex={DROP_MENU_ZINDEX}
                        >
                          <Dropdown.Section>
                            <Dropdown.Item
                              option={{
                                value: "Профиль",
                                label: "Профиль",
                              }}
                            >
                              <Link href="/profile">
                                <a>Профиль </a>
                              </Link>
                            </Dropdown.Item>
                            <Box margin={2}>
                              <Button
                                color="blue"
                                size="sm"
                                accesibilityLabel="Logout"
                                inline
                                text="Выход"
                                onClick={() => {
                                  this.props.logout();
                                }}
                              />
                            </Box>
                          </Dropdown.Section>
                        </Dropdown>
                      )}
                      <ShoppingCart />
                    </Flex>
                  </React.Fragment>
                ) : (
                  <Link href="/login" passHref>
                    <Login />
                  </Link>
                )}
              </Flex>
            </Box>
          </Box>
        </Box>
        <Box display="block" smDisplay="none">
          <Box
            position="fixed"
            zIndex={HEADER_ZINDEX}
            marginEnd="auto"
            marginStart="auto"
            left={true}
            right={true}
            top={false}
            bottom={true}
            dangerouslySetInlineStyle={{
              __style: {
                transition:
                  "transform 300ms ease-in-out 0s, opacity 300ms ease-in-out 0s",
                marginBottom: "16px",
              },
            }}
          >
            <Box
              display="flex"
              position="relative"
              marginEnd="auto"
              marginStart="auto"
              rounding="pill"
              width={264}
              dangerouslySetInlineStyle={{
                __style: {
                  backgroundColor: "rgba(22, 22, 22, 0.72);",
                  height: "60px",
                  backdropFilter: "blur(54px)",
                  webkitBackdropFilter: "blur(54px)",
                },
              }}
              justifyContent="around"
              alignItems="center"
            >
              {authenticated ? (
                <React.Fragment>
                  <Box opacity={0.6}>
                    <Link href="/" passHref>
                      <IconHomeModile />
                    </Link>
                  </Box>
                  <Box opacity={0.6}>
                    <Link href="/mobileseacrh" passHref>
                      <Modileserch />
                    </Link>
                  </Box>
                  <Box opacity={0.6}>
                    <Link href="/profile" passHref>
                      <ProfileMobile />
                    </Link>
                  </Box>
                  <Box opacity={0.6}>
                    <Box
                      dangerouslySetInlineStyle={{
                        __style: {
                          height: "20px",
                          width: "20px",
                          left: "234px",
                          top: "14px",
                          position: "absolute",
                          background: "#0A84FF",
                          borderRadius: "100%",
                          textAlign: "center",
                        },
                      }}
                    >
                      <span style={{ color: "white" }}>
                        {`${cart != null ? cart.order_items.length : 0}`}
                      </span>
                    </Box>
                    <Link href="/ordersummary" passHref>
                      <Ordersummary />
                    </Link>
                  </Box>
                </React.Fragment>
              ) : (
                <React.Fragment>
                  <Box>
                    <Link href="/" passHref>
                      <IconHomeModile />
                    </Link>
                  </Box>
                  <Box>
                    <Link href="/mobileseacrh" passHref>
                      <Modileserch />
                    </Link>
                  </Box>
                  <Box>
                    <Link href="/login" passHref>
                      <LoginMobile />
                    </Link>
                  </Box>
                </React.Fragment>
              )}
            </Box>
          </Box>
        </Box>
        <div className={css.children_content}>{this.props.children}</div>
      </Box>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    authenticated: state.auth.token !== null,
    cart: state.cart.shoppingCart,
    loading: state.cart.loading,
    search_query: state.search_query,
    search_results: state.search_results,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    logout: () => dispatch(logout()),
    fetchCart: () => dispatch(fetchCart()),
    updateSearchQuery: (search_query) =>
      dispatch(updateSearchQuery(search_query)),
    updateSearchResults: (search_results) =>
      dispatch(updateSearchResults(search_results)),
  };
};
export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Layout));

const Ordersummary = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <Icon accessibilityLabel="" icon="shopping-bag" size={24} color="light" />
    </a>
  );
});

const IconHomeModile = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <Icon
        dangerouslySetSvgPath={{
          __path:
            "M13.0305 1.89298C12.752 1.62968 12.3833 1.48297 12 1.48297C11.6167 1.48297 11.248 1.62968 10.9695 1.89298L3.7035 8.75998C3.48102 8.97051 3.30387 9.22425 3.1829 9.50565C3.06194 9.78705 2.9997 10.0902 3 10.3965V18.7515C3.0004 19.348 3.23763 19.9199 3.65954 20.3415C4.08145 20.7631 4.65352 21 5.25 21H7.5C8.09674 21 8.66903 20.7629 9.09099 20.341C9.51295 19.919 9.75 19.3467 9.75 18.75V15C9.75 14.8011 9.82902 14.6103 9.96967 14.4697C10.1103 14.329 10.3011 14.25 10.5 14.25H13.5C13.6989 14.25 13.8897 14.329 14.0303 14.4697C14.171 14.6103 14.25 14.8011 14.25 15V18.75C14.25 19.3467 14.4871 19.919 14.909 20.341C15.331 20.7629 15.9033 21 16.5 21H18.75C19.3467 21 19.919 20.7629 20.341 20.341C20.7629 19.919 21 19.3467 21 18.75V10.395C20.9999 10.0888 20.9373 9.78591 20.8161 9.50478C20.6949 9.22365 20.5176 8.97021 20.295 8.75998L13.0305 1.88999V1.89298Z",
        }}
        accessibilityLabel="Главная"
        color="light"
        size={24}
      />
    </a>
  );
});

const Modileserch = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <Icon accessibilityLabel="" icon="search" size={24} color="light" />
    </a>
  );
});

const LoginMobile = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <Icon accessibilityLabel="" icon="person" size={24} color="light" />
    </a>
  );
});

const ProfileMobile = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <Icon accessibilityLabel="" icon="person" size={24} color="light" />
    </a>
  );
});

const Login = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <IconButton
        accessibilityLabel="Profile"
        icon="person"
        size="md"
        inconColor="lightGray"
        href="/login"
      />
    </a>
  );
});
