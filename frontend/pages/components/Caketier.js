import React from "react";
import { Box, Text, Mask } from "gestalt";
import cake from "../../public/cake.png";
import cake2 from "../../public/cake2.png";
import cake3 from "../../public/cake3.png";
import cake4 from "../../public/cake4.png";
import cake5 from "../../public/cake5.png";
import Image from "next/image";
import css from "../../styles/gallerytoping.module.css";

export default class Caketier extends React.Component {
  render() {
    return (
      <div className={css.Container}>
        <div className={css.TiltWaper}>
          <Box maxWidth={250}>
            <Mask rounding={2} wash>
              <Image src={cake} alt="cake" />
              <Text>Ярус: 1</Text>
              <Text>Вес: 2–3 кг</Text>
              <Text>Гости: до 15 человек</Text>
            </Mask>
          </Box>
        </div>
        <div className="TiltWaper">
          <Box maxWidth={280}>
            <Mask rounding={2} wash>
              <Image src={cake2} alt="cake2" />
              <Text>Ярус: 2</Text>
              <Text>Вес: 5–7 кг</Text>
              <Text>Гости: до 35 человек</Text>
            </Mask>
          </Box>
        </div>
        <div className="TiltWaper">
          <Box maxWidth={280}>
            <Mask rounding={2} wash>
              <Image src={cake3} alt="cake3" />
              <Text>Ярус: 3</Text>
              <Text>Вес: 8–11 кг</Text>
              <Text>Гости: до 55 человек</Text>
            </Mask>
          </Box>
        </div>
        <div className="TiltWaper">
          <Box maxWidth={280}>
            <Mask rounding={2} wash>
              <Image src={cake4} alt="cake4" />
              <Text>Ярус: 4</Text>
              <Text>Вес: 12–15 кг</Text>
              <Text>Гости: до 75 человек</Text>
            </Mask>
          </Box>
        </div>
        <div className="TiltWaper">
          <Box maxWidth={280}>
            <Mask rounding={2} wash>
              <Image src={cake5} alt="cake5" />
              <Text color="withe">Ярус: 5</Text>
              <Text>Вес: 15–20 кг</Text>
              <Text>Гости: до 100 человек</Text>
            </Mask>
          </Box>
        </div>
      </div>
    );
  }
}
