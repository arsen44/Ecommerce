import React from "react";
import { authAxios } from "../helpers/utils";
import {
  addToCartURL,
  orderSummaryURL,
  orderItemDeleteURL,
  orderItemUpdateQuantityURL,
} from "../helpers/constants";
import {
  Box,
  Text,
  Image,
  Mask,
  Column,
  IconButton,
  Divider,
  Heading,
  Video,
  Spinner,
  Flex,
} from "gestalt";
import css from "../styles/OrderSummary.module.css";
import { connect } from "react-redux";
import Link from "next/link";

class OrderSummary extends React.Component {
  state = {
    data: null,
    error: null,
    loading: false,
  };

  componentDidMount() {
    this.handleFetchOrder();
  }

  handleFetchOrder = () => {
    this.setState({ loading: true });
    authAxios
      .get(orderSummaryURL)
      .then((res) => {
        this.setState({ data: res.data, loading: false });
      })
      .catch((err) => {
        if (err.response.status === 404) {
          this.setState({
            error: "You currently do not have an order",
            loading: false,
          });
        } else {
          this.setState({ error: err, loading: false });
        }
      });
  };

  renderVariations = (orderItem) => {
    let text = "";
    orderItem.item_variations.forEach((iv) => {
      text += `${iv.variation.name}: ${iv.value}, `;
    });
    return text;
  };

  handleFormatData = (itemVariations) => {
    // convert [{id: 1},{id: 2}] to [1,2] - they're all variations
    return Object.keys(itemVariations).map((key) => {
      return itemVariations[key].id;
    });
  };

  handleAddToCart = (slug, itemVariations) => {
    this.setState({ loading: true });
    const variations = this.handleFormatData(itemVariations);
    authAxios
      .post(addToCartURL, { slug, variations })
      .then((res) => {
        this.handleFetchOrder();
        this.setState({ loading: false });
      })
      .catch((err) => {
        this.setState({ error: err, loading: false });
      });
  };

  handleRemoveQuantityFromCart = (slug) => {
    authAxios
      .post(orderItemUpdateQuantityURL, { slug })
      .then((res) => {
        this.handleFetchOrder();
      })
      .catch((err) => {
        this.setState({ error: err });
      });
  };

  handleRemoveItem = (itemID) => {
    authAxios
      .delete(orderItemDeleteURL(itemID))
      .then((res) => {
        this.handleFetchOrder();
      })
      .catch((err) => {
        this.setState({ error: err });
      });
  };

  render() {
    const { data, error, loading } = this.state;
    const { isAuthenticated } = this.props;

    if (typeof window !== "undefined") {
      if (!isAuthenticated) {
        return (window.location.pathname = "/login");
      }
    }

    return (
      <Box>
        <Heading size="300" color="light">
          Описание Заказа
        </Heading>

        {loading && (
          <Box>
            <Spinner accessibilityLabel="loading" />
          </Box>
        )}
        {data && (
          <Box overflow="auto">
            <Box>
              {data.order_items.map((orderItem, i) => {
                return (
                  <Box
                    marginTop={2}
                    rounding={8}
                    display="flex"
                    alignItems="center"
                    paddingX={1}
                    key={orderItem.id}
                    dangerouslySetInlineStyle={{
                      __style: {
                        background: "#5C6670",
                        border: "1px solid rgba(255, 252, 252, 0.3)",
                        backdropFilter: "blur(35px)",
                        borderRadius: "8px",
                      },
                    }}
                  >
                    <Box margin={2}>
                      <Flex gap={2} alignItems="center">
                        <Flex alignItems="center">
                          <Box>
                            <Box>
                              <Flex direction="column" gap={1}>
                                <Mask rounding={2} height={100} width={100}>
                                  {orderItem.item.media_type === "image" && (
                                    <Image
                                      src={orderItem.item.media}
                                      fit="cover"
                                      alt="test"
                                      color="#000"
                                      naturalHeight={1}
                                      naturalWidth={1}
                                    />
                                  )}
                                  {orderItem.item.media_type === "video" && (
                                    <Video
                                      captions=""
                                      objectFit="cover"
                                      loop
                                      aspectRatio={100 / 100}
                                      src={orderItem.item.media}
                                    />
                                  )}
                                </Mask>
                                <Box marginStart={2}>
                                  <Text
                                    inline
                                    size="100"
                                    color="light"
                                    align="start"
                                    lineClamp={2}
                                  >
                                    {orderItem.item.title}
                                  </Text>
                                  <Heading size="100" color="light">
                                    <br />
                                    {orderItem.item_variations.map((iv) => {
                                      return (
                                        <>
                                          <b>{iv.variation.name}</b>:{iv.value}
                                          <br />
                                        </>
                                      );
                                    })}
                                  </Heading>
                                </Box>
                              </Flex>
                            </Box>
                          </Box>
                          <Box>
                            <Box
                              display="flex"
                              direction="row"
                              alignItems="center"
                            >
                              <IconButton
                                icon="dash"
                                accessibilityLabel="icon dash"
                                iconColor="red"
                                onClick={() =>
                                  this.handleRemoveQuantityFromCart(
                                    orderItem.item.slug
                                  )
                                }
                              />
                              <Text color="light">{orderItem.quantity}</Text>
                              <IconButton
                                icon="add"
                                iconColor="white"
                                accessibilityLabel="icon add"
                                onClick={() =>
                                  this.handleAddToCart(
                                    orderItem.item.slug,
                                    orderItem.item_variations
                                  )
                                }
                              />
                            </Box>
                          </Box>
                          <Box>
                            <Box marginStart={1}>
                              <Text color="light">
                                ₽{orderItem.final_price}
                              </Text>
                            </Box>
                          </Box>
                          <Box>
                            <Box marginTop={1}>
                              <IconButton
                                icon="cancel"
                                accessibilityLabel="delete"
                                iconColor="red"
                                onClick={() =>
                                  this.handleRemoveItem(orderItem.id)
                                }
                              />
                            </Box>
                          </Box>
                        </Flex>
                      </Flex>
                    </Box>
                  </Box>
                );
              })}
            </Box>
            <Box marginTop={2}>
              <Divider />
              <Box marginTop={2}>
                <Link href="/checkout" passHref>
                  <ButtonChek />
                </Link>
              </Box>
              <Box width={132}>
                <Text color="light" weight="bold">
                  Общая сумма заказа: ₽{data.total}{" "}
                </Text>
              </Box>
            </Box>
          </Box>
        )}
      </Box>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    isAuthenticated: state.auth.token !== null,
  };
};

export default connect(mapStateToProps)(OrderSummary);

const ButtonChek = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <button className={css.buttoncss}>Оформить заказ</button>
    </a>
  );
});
