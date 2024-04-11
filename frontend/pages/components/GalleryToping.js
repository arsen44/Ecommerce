import React from "react";
import LightGallery from "lightgallery/react";
import snikers from "../../public/snikers.png";
import yogurtovaya_chernichnaya from "../../public/yogurtovaya_chernichnaya.png";
import mango_muss from "../../public/mango_muss.png";
import esterhazy from "../../public/esterhazy.png";
import napoleon from "../../public/napoleon.png";
import tiramisu from "../../public/tiramisu.png";
import cheeseberry from "../../public/cheeseberry.png";
import tri_shokolada from "../../public/tri_shokolada.png";
import praga from "../../public/praga.png";
import raduga from "../../public/raduga.png";
import redvelvet from "../../public/redvelvet.png";
import { Box, Text, Mask, TapArea } from "gestalt";
import Image from "next/image";
import css from "../../styles/gallerytoping.module.css";

import lgZoom from "lightgallery/plugins/zoom";

export default class GalleryToping extends React.Component {
  render() {
    return (
      <div className={css.Container}>
        <LightGallery
          //onInit={onInit}
          speed={500}
          plugins={[lgZoom]}
        >
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/snikers.png"
            data-sub-html="<h4>Сникерс</h4><p></p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      alt="snikers"
                      className="Image"
                      src={snikers}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Сникерс
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/yogurtovaya_chernichnaya.png"
            data-sub-html="<h4>Йогуртовая-Черничная</h4>
            <p>Ягодная с изящной кислинкой начинка. Освежающая и легкая, как утренний йогурт! Нежный, слегка влажный ванильный бисквит Буше со слоем ароматной, истекающей соком черники и воздушный йогуртово-черничный мусс создали удивительный тандем вкуса.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150} alignContent="center">
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="yogurtovaya_chernichnaya"
                      src={yogurtovaya_chernichnaya}
                      width={430}
                      layout="responsive"
                    />
                  </Mask>
                  <Box paddingY={1} maxWidth={150}>
                    <Text
                      align="center"
                      color="light"
                      lineClamp={10}
                      overflow="normal"
                    >
                      Йогуртовая-Черничная
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/mango_muss.png"
            data-sub-html="<h4>Манго-Мусс</h4>
            <p>Эта солнечная начинка создает по-настоящему летнее настроение! Она напомнит вам о жарких странах и отпуске. Незабываемый очень легкий мусс манго с кусочками манго и насыщенным кисло-сладким вкусом на сочном ванильном бисквите. Она просто тает во рту, оставляя потрясающее послевкусие. Начинка подходит для приверженцев веганского питания.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      alt="mang_muss"
                      className="Image"
                      src={mango_muss}
                      layout="responsive"
                      width={430}
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Манго Мусс
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/esterhazy.png"
            data-sub-html="<h4>Эстерхази</h4>
            <p>Тончайший нежный миндальный декуаз с изумительным ореховым вкусом, каждый корж которого прослоен сливочным кремом с добавлением фундучного пралине и сгущеного молока. Не зря этот торт называют «Кушанье венгерских богов». Эта безглютеновая начинка особенно пользуется спросом.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="esterhaz"
                      src={esterhazy}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Эстерхази
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/napoleon.png"
            data-sub-html="<h4>Наполеон</h4>
            <p>Множество невесомых слоеных коржей, пропитанных вкуснейшим французским кремом с добавлением ароматнейшей ванили бурбон. Совершенно потрясающая, хрустящая, тающая на языке, эта начинка сама по себе является праздником. В ней все идеально и ничего менять не нужно.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="napoleon"
                      src={napoleon}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Наполеон
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/tiramisu.png"
            data-sub-html="<h4>Тирамису</h4>
            <p></p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="tiramisu"
                      src={tiramisu}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Тирамису
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/cheeseberry.png"
            data-sub-html="<h4>ЧизБерри</h4>
            <p>Это воздушнаяя и легкая начинка, от которой ваши близкие будут в восторге! Сочетание нежнейшего крема на основе крем-чиза с добавлением сочных клубники и киви, влажного ванильного бисквита с нашей фирменной пропиткой — вы однозначно не сможете остановиться на одном кусочке. ыы</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="cheeseberry"
                      src={cheeseberry}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      ЧизБерри
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/tri_shokolada.png"
            data-sub-html="<h4>Три шоколада</h4>
            <p>Шоколадный бисквит и 3 муссовых слоя на основе разных видов шоколада создают вкусовую композицию, очаровывающую своей нежностью. Это тот случай, когда не чувствуется приторность белого и горечь горького, в меру сладкая, очень нежная и тающая во рту начинка.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="tri_shokolada"
                      src={tri_shokolada}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Три шоколада
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/praga.png"
            data-sub-html="<h4>Прага</h4>
            <p>Невероятно ароматные шоколадные бисквиты идеально пропитываются шоколадным кремом на основе вареного сгущенного молока и сливочного масла. По вашему желанию, в этот слаженный тандем, можно добавить прослойку  джема из абрикоса.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="praga"
                      src={praga}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Прага
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/raduga.png"
            data-sub-html="<h4>Радуга</h4>
            <p>Разноцветные коржи из кексового бисквита пропитанные нежным сливочным кремом на основе сыра Маскарпоне. Этот знаменитый десерт точно поднимет настроение и придаст ярких красок скучному дню. Для окрашивания коржей используются пищевые красители, поэтому можно смело заказывать это лакомство деткам. </p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="raduga"
                      src={raduga}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Радуга
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
          <a
            href="https://cakenuage.s3.us-east-2.amazonaws.com/redvelvet.png"
            data-sub-html="<h4>Красный Бархат</h4>
            <p>Изысканный десерт, состоящий из красных ярких бисквитов на фоне контрастного белоснежного крема. Ни с чем не сравнимый вкус воздушных, в меру упругих коржей, в сочетании с нежным кремом на основе сыра маскарпоне и крем-чиза с восхитительным шоколадным послевкусием.</p>"
          >
            <div className={css.TiltWaper}>
              <Box minWidth={150}>
                <Box color="8897a6" rounding={4} borderStyle="sm">
                  <Mask rounding={2}>
                    <Image
                      className="Image"
                      alt="redvelvet"
                      src={redvelvet}
                      layout="responsive"
                      width="430px"
                    />
                  </Mask>
                  <Box paddingY={1}>
                    <Text align="center" color="light">
                      Красный Бархат
                    </Text>
                  </Box>
                </Box>
              </Box>
            </div>
          </a>
        </LightGallery>
      </div>
    );
  }
}
