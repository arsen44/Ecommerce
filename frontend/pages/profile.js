import React from "react";
import { connect } from "react-redux";
import {
  addressListURL,
  addressCreateURL,
  addressUpdateURL,
  addressDeleteURL,
  userIDURL,
  paymentListURL,
} from "../helpers/constants";
import { authAxios } from "../helpers/utils";
import {
  Table,
  TextField,
  Box,
  Button,
  Upsell,
  Checkbox,
  Badge,
  Flex,
  Text,
  Spinner,
  SlimBanner,
  Divider,
  Sticky,
  Icon,
} from "gestalt";
import { withRouter } from "next/router";

const UPDATE_FORM = "UPDATE_FORM";
const CREATE_FORM = "CREATE_FORM";

class PaymentHistory extends React.Component {
  state = {
    payments: [],
  };

  componentDidMount() {
    this.handleFetchPayments();
  }

  handleFetchPayments = () => {
    this.setState({ loading: true });
    authAxios
      .get(paymentListURL)
      .then((res) => {
        this.setState({
          loading: false,
          payments: res.data.results,
        });
      })
      .catch((err) => {
        this.setState({ error: err, loading: false });
      });
  };

  render() {
    const { payments } = this.state;
    return (
      <Table celled>
        <Table.Header>
          <Table.Row>
            <Table.HeaderCell>
              <Text>ID</Text>
            </Table.HeaderCell>
            <Table.HeaderCell>
              <Text>Сумма</Text>
            </Table.HeaderCell>
            <Table.HeaderCell>
              <Text>Дата</Text>
            </Table.HeaderCell>
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {payments.map((p) => {
            return (
              <Table.Row key={p.id}>
                <Table.Cell>
                  <Text>{p.id}</Text>
                </Table.Cell>
                <Table.Cell>
                  <Text>₽ {p.amount}</Text>
                </Table.Cell>
                <Table.Cell>
                  <Text>{new Date(p.timestamp).toLocaleString("ru-RU")}</Text>
                </Table.Cell>
              </Table.Row>
            );
          })}
        </Table.Body>
      </Table>
    );
  }
}

const initialValues = {
  apartment_address: "",
  apartment_floor: "",
  apartment_entrance: "",
  apartment_intercom: "",
  phone: "",
  id: "",
  street_address: "",
  user: "",
  default: false,
};

function AddressForm(props) {
  const [state, setState] = React.useState({
    error: null,
    loading: false,
    saving: false,
    success: false,
  });

  const [formData, setFormData] = React.useState(initialValues);

  React.useEffect(() => {
    const { address, formType } = props;
    if (formType === UPDATE_FORM) {
      setFormData(address);
    }
  });

  const handleSubmit = (e) => {
    setState({ saving: true });
    e.preventDefault();
    const { formType } = props;
    if (formType === UPDATE_FORM) {
      handleUpdateAddress();
    } else {
      handleCreateAddress();
    }
  };

  const handleCreateAddress = () => {
    const { userID, activeItem } = props;
    authAxios
      .post(addressCreateURL, {
        ...formData,
        user: userID,
      })
      .then((res) => {
        setState({
          saving: false,
          success: true,
        });
        setFormData({ default: false });
        props.callback();
      })
      .catch((err) => {
        setState({ error: err });
      });
  };

  const handleUpdateAddress = () => {
    const { userID, activeItem } = props;
    authAxios
      .put(addressUpdateURL(formData.id), { ...formData, user: userID })
      .then((res) => {
        setState({
          saving: false,
          success: true,
        });
        setFormData({ default: false });
        props.callback();
      })
      .catch((err) => {
        setState({ error: err });
      });
  };

  return (
    <form onSubmit={handleSubmit}>
      <Flex direction="column" gap={2}>
        <TextField
          id="street_address"
          placeholder="Адрес"
          value={formData.street_address}
          onChange={({ value }) =>
            setFormData({ ...formData, street_address: value })
          }
        />
        <TextField
          id="apartment_address"
          placeholder="Квартира"
          value={formData.apartment_address}
          onChange={({ value }) =>
            setFormData({ ...formData, apartment_address: value })
          }
        />
        <TextField
          id="apartment_floor"
          placeholder="Этаж"
          value={formData.apartment_floor}
          onChange={({ value }) =>
            setFormData({ ...formData, apartment_floor: value })
          }
        />
        <TextField
          id="apartment_entrance"
          placeholder="Подъезд"
          value={formData.apartment_entrance}
          onChange={({ value }) =>
            setFormData({ ...formData, apartment_entrance: value })
          }
        />
        <TextField
          id="apartment_intercom"
          placeholder="Домофон"
          value={formData.apartment_intercom}
          onChange={({ value }) =>
            setFormData({ ...formData, apartment_intercom: value })
          }
        />
        <TextField
          id="phone"
          type="tel"
          placeholder="7(ххх)хххххх"
          value={formData.phone}
          onChange={({ value }) => setFormData({ ...formData, phone: value })}
        />
        <Checkbox
          id="default"
          label="Сделать этот адресом по умолчанию?"
          onChange={({ checked }) => {
            setFormData({ ...formData, default: checked });
          }}
          checked={formData.default}
        />

        <Button type="submit" size="lg" text="Применить" />
      </Flex>
    </form>
  );
}

class Profile extends React.Component {
  state = {
    activeItem: "shippingAddresses",
    addresses: [],
    userID: null,
    selectedAddress: null,
  };

  componentDidMount() {
    this.handleFetchAddresses();
    this.handleFetchUserID();
  }

  handleItemClick = (name) => {
    this.setState({ activeItem: name }, () => {
      this.handleFetchAddresses();
    });
  };

  handleGetActiveItem = () => {
    const { activeItem } = this.state;
    if (activeItem === "shippingAddress") {
      return "Адрес Доставки";
    }
    return "История Покупок";
  };

  handleDeleteAddress = (addressID) => {
    authAxios
      .delete(addressDeleteURL(addressID))
      .then((res) => {
        this.handleCallback();
      })
      .catch((err) => {
        this.setState({ error: err });
      });
  };

  handleSelectAddress = (address) => {
    this.setState({ selectedAddress: address });
  };

  handleFetchUserID = () => {
    authAxios
      .get(userIDURL)
      .then((res) => {
        this.setState({ userID: res.data.userID });
      })
      .catch((err) => {
        this.setState({ error: err });
      });
  };

  handleFetchAddresses = () => {
    this.setState({ loading: true });
    const { userID } = this.state;
    authAxios
      .get(addressListURL)
      .then((res) => {
        this.setState({ addresses: res.data.results, loading: false });
      })
      .catch((err) => {
        this.setState({ error: err });
      });
  };

  handleCallback = () => {
    this.handleFetchAddresses();
    this.setState({ selectedAddress: null });
  };

  renderAddresses = () => {
    const { activeItem, addresses, selectedAddress, userID } = this.state;

    return (
      <React.Fragment>
        <Flex gap={2} direction="column">
          {addresses.map((a) => {
            return (
              <Box key={a.id} position="static">
                <Upsell
                  imageData={{
                    component: <Icon icon="location" color="error" size={32} />,
                  }}
                  dismissButton={{
                    accessibilityLabel: "Detele adress",
                    onDismiss: () => {
                      this.handleDeleteAddress(a.id);
                    },
                  }}
                  message={a.default ? <Badge text="Основной" /> : null}
                  primaryAction={{
                    onClick: () => {
                      this.handleSelectAddress(a);
                    },
                    label: "Изменить",
                    accessibilityLabel: "change",
                  }}
                  title={a.street_address}
                />
              </Box>
            );
          })}

          {addresses.length > 0 ? <Divider /> : null}
          <Box>
            <Box height="100vh">
              {selectedAddress === null ? (
                <AddressForm
                  activeItem={activeItem}
                  formType={CREATE_FORM}
                  userID={userID}
                  callback={this.handleCallback}
                />
              ) : null}
              {selectedAddress && (
                <AddressForm
                  activeItem={activeItem}
                  userID={userID}
                  address={selectedAddress}
                  formType={UPDATE_FORM}
                  callback={this.handleCallback}
                />
              )}
            </Box>
          </Box>
        </Flex>
      </React.Fragment>
    );
  };

  render() {
    const { activeItem, error, loading } = this.state;
    const { isAuthenticated } = this.props;
    if (!isAuthenticated) {
      return (this.props.router.pathname = "/login");
    }
    return (
      <Box
        dangerouslySetInlineStyle={{
          __style: {
            width: "100%",
          },
        }}
      >
        {error && <SlimBanner message={JSON.stringify(error)} />}
        {loading && <Spinner accessibilityLabel="Spinner" />}
        <Box lgDirection="row" gap={8} lgDisplay="flex" tabIndex={0}>
          <Sticky top={0}>
            <Box lgDirection="column" lgDisplay="flex" color="elevationAccent">
              <Box marginStart={6} lgDirection="column" lgDisplay="flex">
                <Button
                  onClick={() => this.handleItemClick("shippingAddress")}
                  role="button"
                  text="Адрес доставки"
                  color={
                    activeItem === "shippingAddress" ? "blue" : "transparent"
                  }
                />
                <Button
                  onClick={() => this.handleItemClick("paymentHistory")}
                  role="button"
                  text="История пакупок"
                  color={
                    activeItem === "paymentHistory" ? "blue" : "transparent"
                  }
                />
              </Box>
            </Box>
          </Sticky>
          <Box>
            <Box smMarginTop={5} paddingY={5} paddingX={5}>
              <Text>{this.handleGetActiveItem()}</Text>
            </Box>

            {activeItem === "paymentHistory" ? (
              <PaymentHistory />
            ) : (
              this.renderAddresses()
            )}
          </Box>
        </Box>
      </Box>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    isAuthenticated: state.auth.token !== null,
  };
};

export default withRouter(connect(mapStateToProps)(Profile));
