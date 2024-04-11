import React from "react";
import { connect } from "react-redux";
import { logout } from "../store/actions/auth";
import { fetchCart } from "../store/actions/cart";
import { Box, Flex, Icon, FixedZIndex } from "gestalt";
import api from "../helpers/api";
import constantsSeacrhapi from "../helpers/constantsSeacrh";
import { debounce } from "throttle-debounce";
import Autosuggest from "react-autosuggest";
import { getQueryStringParams } from "../helpers/helpers";
import PropTypes from "prop-types";
import {
  updateSearchQuery,
  updateSearchResults,
  addTodoSuccess,
} from "../store/actions/go";
import Serach from "./search";
import CategorySlider from "../../frontend/pages/components/CategorySlider";
import { withRouter } from "next/router";
import Head from "next/head";

class Mobileseacrh extends React.Component {
  static propTypes = {
    history: PropTypes.object,
  };
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      value: "",
      data: [],
      query: "",
      facets: {},
      filters: {},
      results: [],
      suggestions: [],
      open: true,
    };
    this.doSearch = this.doSearch.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.onButtonClick = this.onButtonClick.bind(this);
    this.anchorRef = React.createRef();
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState({ open: false });
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

  renderSuggestion = (suggestion) => {
    return (
      <Box>
        <Box paddingY={2} overflow="scrollY">
          <Box marginStart={2}>
            <Icon icon="search" size={12}></Icon>
            <p className="sugesst_text">{suggestion}</p>
          </Box>
        </Box>
      </Box>
    );
  };

  suggestOnChange = (event, { newValue, click }) => {
    this.setState({ query: newValue });
  };

  onSuggestionsFetchRequested = ({ value }) => {
    api.suggest(value).then((res) => {
      let results = [];
      res.data[constantsSeacrhapi.api.suggester].map((s) => {
        s.options.map((h) => {
          results.push(h.text);
        });
      });
      this.setState({ suggestions: results });
    });
  };

  onSuggestionsClearRequested = () => {
    this.setState({ suggestions: [] });
  };

  getSuggestionValue = (suggestion) => {
    return suggestion;
  };

  doSearch() {
    api.search(this.state.query).then((result) => {
      this.setState({
        facets: result.data.facets,
        results: result.data.results,
      });
      this.props.updateSearchResults(this.state.results);
    });
  }

  onButtonClick() {
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

  render() {
    const { authenticated, cart, loading } = this.props;
    const { query, suggestions } = this.state;

    const inputProps = {
      placeholder: "Поиск",
      value: query,
      onChange: this.suggestOnChange,
      type: "search",
    };
    const HEADER_ZINDEX = new FixedZIndex(100);

    return (
      <Box paddingY={1} paddingX={1} width="100%">
        <Head>
          <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
          />
        </Head>
        <Flex.Item flex="grow" direction="coulmn">
          <Flex justifyContent="between">
            <form onSubmit={this.onSubmit} className="formseacrh">
              <Autosuggest
                suggestions={suggestions}
                onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
                onSuggestionsClearRequested={this.onSuggestionsClearRequested}
                getSuggestionValue={this.getSuggestionValue}
                renderSuggestion={this.renderSuggestion}
                inputProps={inputProps}
              />
              <button
                type="submit"
                className="button"
                onClick={this.onButtonClick}
              ></button>
            </form>
          </Flex>
          <Box marginTop={2}>
            <CategorySlider />
          </Box>
        </Flex.Item>
        <Box marginTop={2}>
          <Serach history={this.props.history} />
        </Box>
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
    addTodoSuccess: (search_results) =>
      dispatch(addTodoSuccess(search_results)),
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(Mobileseacrh)
);
