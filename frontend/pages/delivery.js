import React from "react";
import Logo from "../public/delivery-info.svg";
import payment from "../public/payment.png";
import Image from "next/image";
import css from "../styles/delivery.module.css";

export default class Delivery extends React.Component {
  render() {
    return (
      <div className={css.Content}>
        <div className={css.Grid}>
          <div className={css.GridCol}>
            <div className={css.Header}>
              <h1 className={css.H1}>Доставка</h1>
            </div>
            <div className={css.Paragraf}>
              <h2 className={css.H2}>
                Доставка тортов из интернет-магазина на дом, в офис, на дачу или
                в любое другое удобное для вас место в Москве и Московской
                области. Выбирайте подходящее для вас время и оформляйте заказ .
              </h2>
            </div>
          </div>
          <div className={css.GridCol}>
            <Logo className={css.Logo} />
          </div>
        </div>
        <div className={css.CardContent} CardContent>
          <div className={css.Card}>
            <h1 className={css.CardHeader}>В пределах МКАД</h1>
            <div className={css.CardFooter}>
              <h3 className={css.H3}>
                Минимальная сумма —3 000 Рублей Бесплатная доставка — от 7 000
                Рублей 500 Рублей — при заказе от 3 000 до 7 000 Рублей
              </h3>
            </div>
          </div>
          <div className={css.Card}>
            <h1 className={css.CardHeader}>от МКАД до ММК</h1>
            <div className={css.CardFooter}>
              <h3 className={css.H3}>
                Минимальная сумма — 4 000 Рублей Бесплатная доставка — от 7 000
                Рублей 800 Рублей — при заказе от 4 000 до 7 000 Рублей
              </h3>
            </div>
          </div>
        </div>
        <div className={css.Footer}>
          <div className={css.FooterContent}>
            <div className={css.FooterHeader}>Оплата</div>
            <div className={css.FooterPar}>
              Банковской картой при оформлении заказа в интернет-магазине
            </div>
          </div>
          <div>
            <Image className="Image" src={payment} alt="Payment" />
          </div>
        </div>
      </div>
    );
  }
}
