import React from "react";
import Logo from "../public/logo.svg";
import miratorg from "../public/miratorg.png";
import newpack from "../public/newpack.png";
import css from "../styles/about.module.css";
import Image from "next/image";

export default class About extends React.Component {
  render() {
    return (
      <div className={css.Content}>
        <h1 className={css.H1style}>Наша история</h1>
        <div className={css.TextItem}>
          <h1 className={css.Text}>
            Компания Cake Nuage основана 2018 г ., по двум направлениям -
            широкое регулярное производство и индивидуальный заказ.Собственная
            пекарня, оснащенная многопрофильным высокотехнологичным
            оборудованием, способна справиться с рекордными объемами заказов
            любой сложности. Мы серьезно относимся к контролю качества на всех
            этапах производства, поэтому нам удается создавать не только
            вкусные, но и полезные десерты. Мы знаем свою продукцию и
            возможности, поэтому можем предложить то, что полностью удовлетворит
            запросы любого клиента. Мы выполняем нашу миссию каждый день -
            помогать людям праздновать, отмечать, ценить и передавать послание
            любви через радость от торта.
          </h1>
          <div className={css.Feat}>
            <div className={css.FeatItem}>
              <div className={css.FeatImage}>
                <Image
                  className={css.Image}
                  src={newpack}
                  alt="новый дизайн"
                  width="171px"
                  height="113px"
                />
              </div>
              <div className={css.FeatDescription}>
                <h1 className={css.AvatarTetx}>
                  2019 Разработка брендированной упаковки для продукции товаров,
                  которые поставляются для розничных магазинов.
                </h1>
              </div>
            </div>
            <div className={css.FeatItem}>
              <div className={css.FeatImage}>
                <Image
                  className={css.Image}
                  src={miratorg}
                  alt="Сеть Мираторг"
                  width="171px"
                  height="113px"
                />
              </div>
              <div className={css.FeatDescription}>
                <h1 className={css.AvatarTetx}>
                  2020. заключение контрактов на поставку нашей продукции с
                  компанией Мираторг сетю суперкакетов розничных магазинов.
                </h1>
              </div>
            </div>
            <div className={css.FeatItem}>
              <div className={css.FeatImage}>
                <Logo className={css.Logo} />
              </div>
              <div className={css.FeatDescription}>
                <h1 className={css.AvatarTetx}>
                  2021. Ребрендинг сайта который стал более удобным для
                  оформления заказов . Cake Nuage делает все возможное, чтобы
                  наши десерты, заказанные на сайте или же купленный в магазине
                  у дома , доставили вам удовольствие, которое заставит вас
                  гордиться тем, что вы выбрали нас для создания подарка, о
                  котором люди будут говорить еще долго после окончания
                  празднования.
                </h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
