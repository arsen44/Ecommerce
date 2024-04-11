import React from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Scrollbar } from "swiper";
import { withRouter, useRouter } from "next/router";
import { Image, TapArea, Mask, Box } from "gestalt";
import css from "../../styles/category.module.css";
import { categoryListURL } from "../../helpers/constants";
import axios from "axios";

const CategorySlider = () => {
  const router = useRouter();
  const [data, setData] = React.useState([]);
  const [loading, serLoading] = React.useState();

  React.useEffect(() => {
    SliderMedia();
  }, []);

  const SliderMedia = () => {
    serLoading(true);
    axios
      .get(categoryListURL)
      .then((res) => {
        setData(res.data.results);
      })
      .catch((err) => {
        serLoading(false);
      });
  };

  return (
    <Swiper
      slidesPerView={4}
      spaceBetween={30}
      initialSlide={1}
      centeredSlides={true}
      modules={[Scrollbar]}
      className={css.swiper}
    >
      {data.map((item) => {
        return (
          <SwiperSlide key={item.id}>
            <TapArea
              onTap={() => router.push(`/category/${item.slug}`)}
              fullHeight
              fullWidth
            >
              <Box maxWidth={300} position="relative">
                <Mask rounding={2}>
                  <Image
                    alt={item.name}
                    src={item.mediacontent}
                    naturalHeight={1}
                    naturalWidth={1}
                  />
                </Mask>
                {/* <div className={css.textCentered}>
                  <h3 className={css.TextH3}>{item.name}</h3>
                </div> */}
              </Box>
            </TapArea>
          </SwiperSlide>
        );
      })}
    </Swiper>
  );
};

export default withRouter(CategorySlider);
