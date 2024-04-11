import React, { useEffect, useState, useCallback } from "react";
import { withRouter } from "next/router";
import Link from "next/link";
import { authAxios } from "../helpers/utils";
import {
  checkoutURL,
  orderSummaryURL,
  addCouponURL,
  addressListURL,
} from "../helpers/constants";
import "moment/locale/ru";
import {
  Video,
  Box,
  Image,
  Mask,
  Text,
  Flex,
  Divider,
  Button,
  SelectList,
  ComboBox,
  TextField,
  ActivationCard,
} from "gestalt";
import Logo_Pikup from "../public/pickup.svg";
import Logo_Delivery from "../public/delivery.svg";
import DatePicker from "gestalt-datepicker";
import { ru } from "date-fns/locale";
import css from "../styles/checkout.module.css";
import Head from "next/head";

const OrderPreview = (props) => {
  const { data } = props;
  function currencyFormat(num) {
    return num.toFixed().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
  }

  return (
    <React.Fragment>
      <Box>
        {data && (
          <React.Fragment>
            {data.order_items.map((orderItem, i) => {
              return (
                <Box display="flex" direction="row" padding={2}>
                  <Box ket={i}>
                    <Mask rounding={2} wash width={62} height={71}>
                      {orderItem.item.media_type === "image" && (
                        <Image
                          src={orderItem.item.media}
                          alt={orderItem.item.title}
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
                  </Box>
                  <Box marginStart={3}>
                    <Flex alignItems="start" direction="column" gap={1}>
                      <Text color="light" lineClamp={1}>
                        Товар: {orderItem.item.title}
                      </Text>
                      <Text color="light">
                        Количества (шт/кг): {orderItem.quantity}
                      </Text>
                      <Text color="light">
                        Цена: {currencyFormat(orderItem.final_price)}₽
                      </Text>
                      {orderItem.item.discount_price && (
                        <Text color="light">
                          Скидка: -
                          <b color="error">
                            {currencyFormat(
                              (orderItem.item.price -
                                orderItem.item.discount_price) *
                                orderItem.quantity
                            )}
                            ₽
                          </b>
                        </Text>
                      )}
                    </Flex>
                  </Box>
                </Box>
              );
            })}
            <Divider />
            <Box marginEnd={2} marginStart={2}>
              <Text color="light" weight="bold">
                Ваш заказ
              </Text>
              <Flex justifyContent="between">
                <Flex direction="column">
                  <Text color="light">Тавары({data.order_items.length})</Text>
                  <Text color="light">Скидка</Text>
                  <Text color="light">Стоимость доставки</Text>
                </Flex>
                <Flex direction="column">
                  <Text color="light">
                    {currencyFormat(data.not_discount_amount)} ₽
                  </Text>
                  <Text color="error">
                    {currencyFormat(data.total_amount_discounts)} ₽
                  </Text>
                  {data.total >= 7000 && <Text color="light">Бесплатно</Text>}
                  {data.total < 7000 && <Text color="light">450</Text>}
                </Flex>
              </Flex>
              <Divider />
              <Flex justifyContent="between">
                <Text color="light" weight="bold">
                  Итого
                </Text>
                <Text color="light" weight="bold">
                  {currencyFormat(data.total)} ₽
                </Text>
              </Flex>
            </Box>
            {data.coupon && (
              <ActivationCard
                status="complete"
                title={`скидка по купону ${data.coupon.code} -${data.coupon.amount}₽`}
              />
            )}
          </React.Fragment>
        )}
      </Box>
    </React.Fragment>
  );
};

function CouponForm(props) {
  const [code, setCode] = useState("");

  const handleSubmit = (e) => {
    props.handleAddCoupon(e, code);
    setCoade({ code: "" });
  };

  return (
    <React.Fragment>
      <Box margin={2}>
        <form onSubmit={handleSubmit}>
          <Flex alignItems="end" gap={2}>
            <Flex gap={2} direction="column" justifyContent="around">
              <Text weight="bold" size="300" color="light">
                Промо код на скидку
              </Text>
              <TextField
                placeholder="Вводите поромокод.."
                value={code}
                onChange={({ value }) => setCode(value)}
                size="lg"
              />
            </Flex>
            <Button type="submit" size="lg" text="Применить" />
          </Flex>
        </form>
      </Box>
    </React.Fragment>
  );
}

function CheckoutForm(props) {
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState(null);
  const [delivery_time, setDelivery_time] = useState("");
  const [delivery_date, setDelivery_date] = useState(undefined);
  const [shippingAddresses, setShippingAddresses] = useState([]);
  const [open, setOpen] = React.useState(false);
  const [delivery, setDelivery] = React.useState(false);
  const anchorDeliveryRef = React.useRef();
  const anchorPickupRef = React.useRef();

  useEffect(() => {
    handleFetchOrder();
    handleFetchShippingAddresses();
  }, []);

  const handleGetDefaultAddress = (addresses) => {
    const filteredAddresses = addresses.filter((el) => el.default === true);
    if (filteredAddresses.length > 0) {
      return filteredAddresses[0].id;
    }
    return "";
  };

  const handleFetchShippingAddresses = useCallback(() => {
    setLoading(true);
    authAxios
      .get(addressListURL)
      .then((res) => {
        const adresGet = res.data.results;
        setShippingAddresses(
          adresGet.map((a, index) => {
            return {
              label: `${a.street_address}`,
              value: a.id,
            };
          })
        );

        setSelected(handleGetDefaultAddress(res.data));
        setLoading(false);
      })
      .catch((err) => {
        setError(err);
        setLoading(false);
      });
  });

  const handleFetchOrder = () => {
    setLoading(true);
    authAxios
      .get(orderSummaryURL)
      .then((res) => {
        setData(res.data);
        setLoading(false);
      })
      .catch((err) => {
        if (err.response.status === 404) {
          props.router.push("/");
        } else {
          setError(err);
        }
      });
  };

  const [suggestedOptions, setSuggestedOptions] = useState(shippingAddresses);
  const [inputValue, setInputValue] = useState(shippingAddresses);
  const [selected, setSelected] = useState("");

  const handleOnChange = ({ value }) => {
    setSelected();
    if (value) {
      setInputValue(value);
      const filteredOptions = shippingAddresses.filter((item) =>
        item.label.toLowerCase().includes(value.toLowerCase())
      );
      setSuggestedOptions(filteredOptions);
    } else {
      setInputValue(value);
      setSuggestedOptions(shippingAddresses);
    }
  };

  const handleSelect = ({ item }) => {
    setInputValue(item.label);
    setSuggestedOptions(shippingAddresses);
    setSelected(item.value);
  };

  const PickupAdress = ["пр-д Черепановых,52"];

  const usStatesPickup = PickupAdress.map((pronoun, index) => ({
    label: pronoun,
    value: "value" + index,
  }));

  const [suggestedPickup, setSuggestedPickup] = useState(usStatesPickup);
  const [inputValuePickup, setInputValuepickup] = useState(
    usStatesPickup[0].label
  );
  const [selectedPickup, setSelectedPickup] = useState(usStatesPickup[0]);

  const handleOnChangePickup = ({ value }) => {
    setSelectedPickup();
    if (value) {
      setInputValuepickup(value);
      const filteredPickup = usStatesPickup.filter((item) =>
        item.label.toLowerCase().includes(value.toLowerCase())
      );
      setSuggestedPickup(filteredPickup);
    } else {
      setInputValue(value);
      setSuggestedPickup(usStatesPickup);
    }
  };

  const handleSelectPickup = ({ item }) => {
    setInputValuepickup(item.label);
    setSuggestedPickup(usStatesPickup);
    setSelectedPickup(item);
  };

  const submit = (ev) => {
    ev.preventDefault();
    authAxios
      .post(checkoutURL, {
        delivery,
        selected,
        formData: {
          delivery_date,
          delivery_time,
        },
      })
      .then((res) => {
        const paying = window.location.assign(res.data).focus();
      });
  };

  const handleAddCoupon = (e, code) => {
    e.preventDefault();
    setLoading(true);
    authAxios
      .post(addCouponURL, { code })
      .then((res) => {
        setLoading(false);
        handleFetchOrder();
      })
      .catch((err) => {
        setLoading(false);
        setError(err);
      });
  };

  return (
    <Box
      dangerouslySetInlineStyle={{
        __style: {
          height: "100vh",
        },
      }}
    >
      <div className={css.OrderWindow}>
        <Box>
          <OrderPreview data={data} />
        </Box>
        <Box
          dangerouslySetInlineStyle={{
            __style: {
              height: "100vh",
            },
          }}
        >
          <Box marginBottom={3}>
            <CouponForm
              handleAddCoupon={(e, code) => handleAddCoupon(e, code)}
            />
          </Box>

          <Flex
            alignItems="start"
            direction="row"
            gap={3}
            justifyContent="between"
          >
            <Box display="inlineBlock" ref={anchorDeliveryRef} marginStart={3}>
              <input
                className={css.customradiocontrol}
                type="radio"
                id="type2"
                checked={delivery === "Доставка"}
                onChange={() => {
                  setOpen(true);
                  setDelivery("Доставка");
                }}
                value="Доставка"
              />
              <label htmlFor="type2" className={css.customcontrollabel}>
                <Logo_Delivery />
                <strong className={css.strong}>Доставка</strong>
              </label>
            </Box>
            <Box display="inlineBlock" ref={anchorPickupRef} marginEnd={3}>
              <input
                className={css.customradiocontrol}
                type="radio"
                id="type"
                checked={delivery === "Самовывоз"}
                onChange={() => {
                  setOpen(true);
                  setDelivery("Самовывоз");
                }}
                value="Самовывоз"
              />
              <label htmlFor="type" className={css.customcontrollabel}>
                <Logo_Pikup />
                <strong className={css.strong}>Самовывоз</strong>
              </label>
            </Box>
          </Flex>

          {open && (
            <Box>
              <Box
                anchor={
                  delivery === "Доставка"
                    ? anchorDeliveryRef.current
                    : anchorPickupRef.current
                }
              >
                <Box maxWidth={390}>
                  {delivery === "Доставка" ? (
                    <Flex direction="column" alignItems="center">
                      <Flex gap={2} direction="column">
                        <Text weight="bold" size="300" color="light">
                          Выберите адрес доставки
                        </Text>
                        <Box width={350}>
                          {shippingAddresses.length > 0 ? (
                            <Box>
                              <ComboBox
                                size="lg"
                                accessibilityClearButtonLabel="Clear the current value"
                                id="shippingAddresses"
                                inputValue={inputValue}
                                noResultText="Нет результатов по вашему выбору"
                                options={suggestedOptions}
                                onBlur={() => {
                                  if (!selected) setInputValue("");
                                  setSuggestedOptions(shippingAddresses);
                                }}
                                onClear={() => {
                                  setInputValue("");
                                  setSelected();
                                  setSuggestedOptions(shippingAddresses);
                                }}
                                selectedOption={selected}
                                placeholder="Выберите адрес доставки"
                                onChange={({ value }) => {
                                  setShippingAddresses(value);
                                  handleOnChange();
                                }}
                                onSelect={handleSelect}
                              />
                              {selected && selected.label ? (
                                <Text weight="bold" size="300" color="light">
                                  {selected && selected.label}
                                </Text>
                              ) : null}
                            </Box>
                          ) : (
                            <Text color="light">
                              Вам необходимо
                              <Link href="/profile">
                                <a className={css.getAdress}>
                                  добавить адрес доставки
                                </a>
                              </Link>
                            </Text>
                          )}

                          <Text weight="bold" size="300" color="light">
                            Выберите желаемую дату
                          </Text>
                        </Box>

                        {data && (
                          <DatePicker
                            maxDate={
                              new Date(
                                new Date().setDate(
                                  new Date().getDate() + 10 * `${data.date}`
                                )
                              )
                            }
                            minDate={
                              new Date(
                                new Date().setDate(
                                  new Date().getDate() + 1 * `${data.date}`
                                )
                              )
                            }
                            idealDirection="down"
                            onChange={({ value }) => setDelivery_date(value)}
                            value={delivery_date}
                            localeData={ru}
                            placeholder="Дата"
                          />
                        )}
                        <Text weight="bold" size="300" color="light">
                          Выберите время
                        </Text>
                        <Box>
                          <SelectList
                            size="lg"
                            id="selectlist1"
                            name="delivery_time"
                            onChange={({ value }) => setDelivery_time(value)}
                            placeholder="Время"
                            value={delivery_time}
                          >
                            {[
                              {
                                label: "10:00-13:00",
                                value: "10:00-13:00",
                              },
                              {
                                label: "13:00-16:00",
                                value: "13:00-16:00",
                              },
                              {
                                label: "16:00-19:00",
                                value: "16:00-19:00",
                              },
                            ].map(({ label, value }) => (
                              <SelectList.Option
                                key={label}
                                label={label}
                                value={value}
                              />
                            ))}
                          </SelectList>
                        </Box>

                        <button
                          className={css.buttonsyled}
                          loading={loading}
                          disabled={loading}
                          onClick={submit}
                        >
                          Оплатить
                        </button>
                      </Flex>
                    </Flex>
                  ) : (
                    <Flex direction="column" alignItems="center">
                      <Flex gap={2} direction="column">
                        <Text weight="bold" size="300" color="light">
                          Адрес откуда можно забрать товар
                        </Text>
                        <Box width={350}>
                          <ComboBox
                            size="lg"
                            accessibilityClearButtonLabel="Clear the current value"
                            id="controlled2"
                            inputValue={inputValuePickup}
                            noResultText="Нет результатов по вашему выбору"
                            options={suggestedPickup}
                            onBlur={() => {
                              if (!selectedPickup) setInputValuepickup("");
                              setSuggestedPickup(usStatesPickup);
                            }}
                            onClear={() => {
                              setInputValuepickup("");
                              setSelectedPickup();
                              setSuggestedPickup(usStatesPickup);
                            }}
                            selectedOption={selectedPickup}
                            placeholder="Выберите адрес доставки"
                            onChange={handleOnChangePickup}
                            onSelect={handleSelectPickup}
                          />
                          {selectedPickup && selectedPickup.label ? (
                            <Text weight="bold" size="300" color="light">
                              МЦК ​Коптево г.Москва{" "}
                              {selectedPickup && selectedPickup.label}
                            </Text>
                          ) : null}
                        </Box>

                        <Text weight="bold" size="300" color="light">
                          Выберите желаемую дату
                        </Text>
                        {data && (
                          <DatePicker
                            maxDate={
                              new Date(
                                new Date().setDate(
                                  new Date().getDate() + 10 * `${data.date}`
                                )
                              )
                            }
                            minDate={
                              new Date(
                                new Date().setDate(
                                  new Date().getDate() + 1 * `${data.date}`
                                )
                              )
                            }
                            idealDirection="down"
                            onChange={({ value }) => setDelivery_date(value)}
                            value={delivery_date}
                            localeData={ru}
                            placeholder="Дата"
                          />
                        )}
                        <Text weight="bold" size="300" color="light">
                          Выберите время
                        </Text>
                        <SelectList
                          size="lg"
                          id="selectlist1"
                          name="delivery_time"
                          onChange={({ value }) => setDelivery_time(value)}
                          placeholder="Время"
                          value={delivery_time}
                        >
                          {[
                            {
                              label: "10:00-13:00",
                              value: "10:00-13:00",
                            },
                            {
                              label: "13:00-16:00",
                              value: "13:00-16:00",
                            },
                            {
                              label: "16:00-19:00",
                              value: "16:00-19:00",
                            },
                          ].map(({ label, value }) => (
                            <SelectList.Option
                              key={label}
                              label={label}
                              value={value}
                            />
                          ))}
                        </SelectList>

                        <button
                          className={css.buttonsyled}
                          loading={loading}
                          disabled={loading}
                          onClick={submit}
                        >
                          Оплатить
                        </button>
                      </Flex>
                    </Flex>
                  )}
                </Box>
              </Box>
            </Box>
          )}
        </Box>
      </div>
    </Box>
  );
}

const InjectedForm = withRouter(CheckoutForm);

const WrappedForm = () => (
  <Box>
    <Head>
      <title>
        Торты на заказ в Москве, купить торт на заказ, заказать торт с доставкой
      </title>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      <script src="https://static.yoomoney.ru/checkout-js/v1/checkout.js"></script>
    </Head>
    <InjectedForm />
  </Box>
);
export default WrappedForm;
