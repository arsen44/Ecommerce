import React from "react";
import { YMaps, Map, Placemark } from "react-yandex-maps";
import Company from "../public/company.svg";
import Phone from "../public/phone.svg";
import Email from "../public/email.svg";
import css from "../styles/contact.module.css";

const style = {
  position: "absolute",
  left: 0,
  top: 0,
  width: "100%",
  height: "100%",
};

export default class Contacts extends React.Component {
  render() {
    return (
      <div className={css.Content}>
        <div className={css.Grid}>
          <div className={css.GridItem}>
            <div className={css.Card}>
              <div className={css.GardText}>
                <h1 className={css.CardHeader}>Партнерам</h1>
                <p className={css.Paragraf}>
                  Если у Вас возник вопрос – <br />
                  напишите нам
                </p>
                <p className={css.Paragraf}>@info@cakenuage.ru</p>
              </div>
            </div>
            <div className={css.CardWith}>
              <div className={css.ItemContent}>
                <div className={css.Item}>
                  <div className={css.ItemDes}>
                    <div className={css.Svgg}>
                      <Company />
                    </div>
                    <div className={css.ItemHeader}>
                      <h1 className={css.Header}>
                        Адрес: 125183, г. Москва Проезд Черепановых, 52
                      </h1>
                    </div>
                  </div>
                  <div className={css.ItemDes}>
                    <div className={css.Svgg}>
                      <Phone />
                    </div>
                    <div className={css.ItemHeader}>
                      <h1 className={css.Header}>+7 (499) 154-45-11</h1>
                    </div>
                  </div>
                  <div className={css.ItemDes}>
                    <div className={css.Svgg}>
                      <Email />
                    </div>
                    <div className={css.ItemHeader}>
                      <h1 className={css.Header}>info@cakenuage.ru</h1>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className={css.CardWith}>
              <div className={css.GardText}>
                <div className={css.Rekvesit}>
                  <h1>Реквизиты</h1>
                  <p className={css.RekvesitiParagraf}>ООО "КЕЙК НУАЖ"</p>
                  <p className={css.RekvesitiParagraf}>
                    ИНН 7733330108 / КПП773301001
                  </p>
                  <p className={css.RekvesitiParagraf}>ОГРН 1187746771002</p>
                  <p className={css.RekvesitiParagraf}>
                    ЮР.АДРЕС 125481,г.Москва , ул. Фомичевой д.16 кр.3 эт. 1
                    пом. 252 оф. 4л
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div className={css.GridItem}>
            <div className={css.CardMap}>
              <YMaps>
                <Map
                 defaultState={{ center: [55.84304, 37.536535], zoom: 18 }}
                  style={style}
                >
                  <Placemark
                    geometry={[55.84304, 37.536535]}
                    properties={{
                      hintContent: "asd",
                      balloonContent: "Это красивая метка",
                      iconCaption: "CakeNuage",
                      iconColor: "#ff0000",
                    }}
                  />
                </Map>
              </YMaps>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
