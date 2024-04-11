import React, { useEffect } from "react";
import { connect } from "react-redux";
import {
  Box,
  Flex,
  IconButton,
  Layer,
  Popover,
  Mask,
  Image,
  Text,
  FixedZIndex,
} from "gestalt";
import { fetchCart } from "../../store/actions/cart";
import css from "../../styles/OrderSummary.module.css";
import Link from "next/link";

const DROP_MENU_ZINDEX = new FixedZIndex(10);

class ShoppingCart extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
    this.handleDismiss = this.handleDismiss.bind(this);
    this.anchorRef = React.createRef();

    this.state = {
      loading: false,
      open: false,
    };
  }

  componentDidMount() {
    this.props.fetchCart();
  }

  handleClick() {
    this.setState(() => ({ open: !this.state.open }));
  }
  handleDismiss() {
    this.setState(() => ({ open: false }));
  }

  render() {
    const { loading, cart } = this.props;
    const { open } = this.state;
    return (
      <React.Fragment>
        <Flex alignItems="center" gap={2}>
          <IconButton
            accessibilityHaspopup={true}
            accessibilityExpanded={open}
            accessibilityControls="example-a11y"
            icon="shopping-bag"
            inconColor="lightGray"
            onClick={() => this.handleClick()}
            ref={this.anchorRef}
            size="md"
            selected={open}
            loading={loading}
          />
        </Flex>
        {open && (
          <Layer zIndex={DROP_MENU_ZINDEX}>
            <Popover
              anchor={this.anchorRef.current}
              id="example-a11y"
              idealDirection="down"
              onDismiss={this.handleDismiss}
              positionRelativeToAnchor={false}
            >
              <Box width={300}>
                <Box
                  flex="grow"
                  marginEnd={4}
                  marginStart={4}
                  marginTop={6}
                  marginBottom={8}
                >
                  <Flex direction="column">
                    <Flex direction="column">
                      {cart !== null ? (
                        <React.Fragment>
                          <Flex alignItems="start" direction="column">
                            {cart.order_items.map((order_item) => {
                              return (
                                <Flex width={150} gap={1} key={order_item.id}>
                                  <Box
                                    paddingX={2}
                                    paddingY={1}
                                    width={80}
                                    overflow="hidden"
                                    rounding={2}
                                  >
                                    <Mask rounding={2} key={order_item.id}>
                                      <Image
                                        alt={order_item.item.title}
                                        color="rgb(231, 186, 176)"
                                        naturalHeight={50}
                                        naturalWidth={50}
                                        src={order_item.item.media}
                                      />
                                    </Mask>
                                  </Box>
                                  <Text
                                    lineClamp={2}
                                    color="dark"
                                    weight="bold"
                                    size="sm"
                                  >
                                    {order_item.quantity} x
                                    {order_item.item.title}
                                  </Text>
                                </Flex>
                              );
                            })}
                            {cart.order_items.length < 1 ? (
                              <Text color="dark" size="sm" align="center">
                                Нет товаров в корзине
                              </Text>
                            ) : null}
                            <Link href="/ordersummary">
                              <ButtonChek />
                            </Link>
                          </Flex>
                        </React.Fragment>
                      ) : (
                        <Text color="darkGray" size="md">
                          Нет товаров в корзине
                        </Text>
                      )}
                    </Flex>
                  </Flex>
                </Box>
              </Box>
            </Popover>
          </Layer>
        )}
      </React.Fragment>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    cart: state.cart.shoppingCart,
    loading: state.cart.loading,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchCart: () => dispatch(fetchCart()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ShoppingCart);

const ButtonChek = React.forwardRef(({ onClick, href }, ref) => {
  return (
    <a href={href} onClick={onClick} ref={ref}>
      <button className={css.buttoncss}>Оформить заказ</button>
    </a>
  );
});
