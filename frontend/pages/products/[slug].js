import React from "react";
import { addToCartURL } from "../../helpers/constants";
import { connect } from "react-redux";
import { fetchCart } from "../../store/actions/cart";
import GalleryToping from "../components/GalleryToping";
import Caketier from "../components/Caketier";
import Memo from "../components/Memo";
import Select from "react-select";
import "moment/locale/ru";
import moment from "moment";
import {
  Box,
  Text,
  Flex,
  SegmentedControl,
  Mask,
  Badge,
  Heading,
  SlimBanner,
  Spinner,
  Callout,
  Toast,
  Layer,
} from "gestalt";
import Video from "../../helpers/Video";
import Slider from "react-slick";
import { authAxios } from "../../helpers/utils";
import axios from "axios";
import css from "../../styles/product.module.scss";
import Head from "next/head";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

function Segmented() {
  const [itemIndex, setItemIndex] = React.useState(0);

  const items = ["Начинки", "Ярусы и вес", "Памятка"];

  const content = [<GalleryToping />, <Caketier />, <Memo />];

  return (
    <Flex direction="column" gap={2}>
      <SegmentedControl
        items={items}
        selectedItemIndex={itemIndex}
        onChange={({ activeIndex }) => setItemIndex(activeIndex)}
      />
      <Box
        borderStyle="shadow"
        padding={6}
        rounding={2}
        dangerouslySetInlineStyle={{
          __style: {
            background: "#5C6670",
          },
        }}
      >
        <Text>{content[itemIndex]}</Text>
      </Box>
    </Flex>
  );
}

function currencyFormat(num) {
  return num.toFixed().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
}

class Products extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      error: null,
      formVisible: false,
      formData: {},
      showToast: false,
      order: null,
    };
  }

  closeError() {
    this.setState({ error: false });
  }

  handleToggleForm = () => {
    const { formVisible } = this.state;
    this.setState({
      formVisible: !formVisible,
    });
  };

  handleShowToast = () => {
    const { showToast } = this.state;
    this.setState({
      showToast: !showToast,
    });
  };

  handleAddToCart = (slug) => {
    this.setState({ loading: true });
    const { formData } = this.state;
    const variations = this.handleFormatData(formData);
    authAxios
      .post(addToCartURL, { slug, variations })
      .then((res) => {
        this.props.refreshCart();
        this.setState({ loading: false });
      })
      .catch((err) => {
        this.setState({ error: err, loading: false });
      });
  };

  handleFormatData = (formData) => {
    // convert {colour: 1, size: 2} to [1,2] - they're all variations
    return Object.keys(formData).map((key) => {
      return formData[key];
    });
  };

  handleChange = (e, { name, value }) => {
    const { formData } = this.state;
    const updatedFormData = {
      ...formData,
      [name]: e.value,
    };
    this.setState({ formData: updatedFormData });
  };

  render() {
    const { error, formData, loading, showToast, order, authenticated } =
      this.state;
    const data = this.props.data;
    const item = data;

    const settings = {
      dots: true,
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
    };
    return (
      <Box>
        <Head>
          <title>{item.title} - заказать в кондитерской Cake Nuage </title>
          <meta
            name="description"
            content={`${item.title} заказать в интернет-магазине Cake Nuage. С доставкой  и постоянные скидки! промокоды! `}
          ></meta>
        </Head>

        {loading && (
          <Box>
            <Spinner accessibilityLabel="loading" />
          </Box>
        )}

        <Box
          justifyContent="center"
          display="flex"
          direction="column"
          smDirection="row"
          lgDirection="column"
        >
          <Box smDisplay="flex" smDirection="column" justifyContent="center">
            <Box smDisplay="flex" smDirection="row" justifyContent="center">
              <Box maxWidth="100%" smColumn={4}>
                {item.mediacontent && (
                  <Slider {...settings} className={css.slider}>
                    {item.media_type === "image" ? (
                      <Mask rounding={3} wash>
                        <Box rounding="pill" margin={2} position="absolute">
                          {item.discount_price && (
                            <Box
                              color="light"
                              rounding="pill"
                              width="35px"
                              height="35px"
                              alignItems="center"
                              display="flex"
                              dangerouslySetInlineStyle={{
                                __style: {
                                  background:
                                    "linear-gradient(90deg, #F093FB 0%, #F5576C 100%)",
                                  boxShadow: "0px 6px 4px rgba(0, 0, 0, 0.25)",
                                },
                              }}
                            >
                              <Text color="light" size="sm">
                                -
                                {100 -
                                  Math.floor(
                                    (item.discount_price * 100) / item.price
                                  )}
                                %
                              </Text>
                            </Box>
                          )}
                        </Box>
                        <img
                          alt={item.title}
                          src={item.media}
                          style={{ maxWidth: "100%", display: "block" }}
                        />
                      </Mask>
                    ) : (
                      <Mask rounding={2} wash>
                        <Video url={item.media} />
                      </Mask>
                    )}
                    {data.mediacontent.map((v) => {
                      return (
                        <Mask rounding={2} wash key={v.id}>
                          {v.media_content_type === "image" && (
                            <img
                              alt={v.title}
                              src={v.media_content}
                              style={{ maxWidth: "100%", display: "block" }}
                            />
                          )}
                          {v.media_content_type === "video" && (
                            <Video url={v.media_content} />
                          )}
                        </Mask>
                      );
                    })}
                  </Slider>
                )}
              </Box>

              {data.variations && (
                <Box smColumn={5}>
                  <Box>
                    <Box margin={2}>
                      <Text color="light">
                        <Heading size="400" color="light" overflow="breakWord">
                          {item.title}
                        </Heading>
                      </Text>
                    </Box>
                    <Box margin={2}>
                      {item.dateOfreadiness > 0 ? (
                        <Box display="flex">
                          <Box marginEnd={5}>
                            <p style={{ color: "#C2C2C2" }}>
                              дата доставки и самовывоза
                            </p>
                          </Box>

                          <Box
                            rounding={2}
                            width={55}
                            height={40}
                            display="flex"
                            dangerouslySetInlineStyle={{
                              __style: {
                                background: "#003BD2",
                                alignItems: "center",
                                justifyContent: "center",
                              },
                            }}
                          >
                            <Box width={50}>
                              <Text
                                align="center"
                                size="100"
                                overflow="breakWord"
                                color="light"
                              >
                                {moment(
                                  new Date().setDate(
                                    new Date().getDate() +
                                      1 * `${item.dateOfreadiness}`
                                  )
                                ).format("D MMM ddd")}
                              </Text>
                            </Box>
                          </Box>
                        </Box>
                      ) : (
                        <Badge text="Express-доставка за 1-3 часа" />
                      )}
                    </Box>
                    <Box margin={2}>
                      <p className={css.description}>{item.description}</p>
                    </Box>
                    <Box margin={2} marginTop={3}>
                      {item.discount_price ? (
                        <Text>
                          <p className={css.description}>
                            {currencyFormat(item.discount_price)} ₽{" "}
                            <del
                              style={{
                                color: "#a1a6a6",
                                margin: "10px",
                                fontSize: "16px",
                              }}
                            >
                              {currencyFormat(item.price)} ₽
                            </del>
                          </p>
                        </Text>
                      ) : (
                        <p className={css.description}>
                          {currencyFormat(item.price)} ₽
                        </p>
                      )}
                    </Box>
                  </Box>
                  <div className={css.topping}>
                    <Box marginStart={4} marginEnd={4}>
                      <React.Fragment>
                        <form
                          onSubmit={(e) => {
                            e.preventDefault(), this.handleAddToCart(item.slug);
                          }}
                        >
                          {data.variations.map((v) => {
                            const name = v.name.toLowerCase();
                            return (
                              <div className={css.toppinglabel}>
                                <Text color="light" weight="bold" size="400">
                                  Выбор {name}
                                </Text>
                                <Select
                                  classNamePrefix="select"
                                  //menuPortalTarget={document.body}
                                  className={css.select}
                                  isSearchable={false}
                                  key={v.id}
                                  name={name}
                                  value={formData[v.name]}
                                  onChange={this.handleChange}
                                  placeholder={`нажмите чтоб выбрать ${name}`}
                                  options={v.item_variations.map((item) => {
                                    return {
                                      value: item.id,
                                      label: (
                                        <div className={css.IconBox}>
                                          <img
                                            alt="name"
                                            className={css.IconImage}
                                            src={item.attachment}
                                          />
                                          <span className={css.IconText}>
                                            {item.value}
                                          </span>
                                        </div>
                                      ),
                                    };
                                  })}
                                />
                              </div>
                            );
                          })}
                          <input
                            type="submit"
                            value="Добавить в корзину"
                            className={css.InputButton}
                            onClick={this.handleShowToast}
                          />
                        </form>
                      </React.Fragment>

                      {error && (
                        <Callout
                          dismissButton={{
                            accessibilityLabel: "Dismiss this banner",
                            onDismiss: () => {
                              this.closeError();
                            },
                          }}
                          iconAccessibilityLabel="Info"
                          primaryAction={{
                            accessibilityLabel: "registartinon",
                            href: "/signup",
                            label: "Регистрация",
                            target: null,
                          }}
                          title="Авторизуйтесь для совершения заказа"
                          type="recommendation"
                        />
                      )}

                      <WarningBanner authenticated={this.state.showToast} />
                    </Box>
                  </div>
                  <SlimBanner
                    type="info"
                    message="Помощь в выборе:"
                    iconAccessibilityLabel="Information"
                    helperLink={{
                      text: "+7 (499) 154-45-11",
                      accessibilityLabel:
                        "Learn more about campaign budget optimization",
                      href: "tel:+7 (499) 154-45-11",
                      onClick: () => {},
                    }}
                  />
                </Box>
              )}
            </Box>
            <Box marginTop={2}>
              <Segmented />
            </Box>
          </Box>
        </Box>
      </Box>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    authenticated: state.auth.token !== null,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    refreshCart: () => dispatch(fetchCart()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Products);

export async function getStaticPaths() {
  const res = await axios.get(`http://127.0.0.1:8000/api/products/`);
  const data = res.data.results;
  const paths = data.map((item) => ({
    params: { slug: item.slug }, // keep in mind if post.id is a number you need to stringify post.id
  }));

  return {
    paths,
    fallback: "blocking",
  };
}

export async function getStaticProps({ params }) {
  // Fetch data from external API
  const res = await axios(`http://127.0.0.1:8000/api/products/${params.slug}/`);
  const data = res.data;

  // Pass data to the page via props
  return {
    props: { data },
    revalidate: 10,
  };
}

function WarningBanner(props) {
  if (!props.authenticated) {
    return null;
  }

  return (
    <React.Fragment>
      <Layer>
        <Box
          dangerouslySetInlineStyle={{
            __style: {
              bottom: 50,
              left: "50%",
              transform: "translateX(-50%)",
            },
          }}
          fit
          paddingX={1}
          position="fixed"
        >
          <Toast text="  В корзине" />
        </Box>
      </Layer>
    </React.Fragment>
  );
}
