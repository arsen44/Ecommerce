import React, { useState, useEffect } from "react";
import { Carousel } from "../../helpers/constants";
import axios from "axios";
import { Box, Image, Mask, TapArea } from "gestalt";
import { EffectCoverflow, Pagination } from "swiper";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/effect-coverflow";
import css from "../../styles/carousel.module.css";
import { useRouter } from "next/router";

export default function CarouselContent() {
  const router = useRouter();
  const [data, setData] = useState([]);
  const [loading, serLoading] = useState();

  useEffect(() => {
    carouselMedia();
  }, []);

  const carouselMedia = () => {
    serLoading(true);
    axios
      .get(Carousel)
      .then((res) => {
        setData(res.data.results);
      })
      .catch((err) => {
        serLoading(false);
      });
  };

  return (
    <Swiper
      effect={"coverflow"}
      grabCursor={true}
      centeredSlides={true}
      slidesPerView={3}
      initialSlide={2}
      loop={true}
      coverflowEffect={{
        rotate: 0,
        stretch: 50,
        depth: 100,
        modifier: 5,
        slideShadows: false,
      }}
      pagination={true}
      modules={[EffectCoverflow, Pagination]}
      className={css.swiper}
    >
      {data.map((carousel) => (
        <SwiperSlide key={carousel.id}>
          <TapArea onTap={() => router.push(`/promotions/${carousel.slug}`)}>
            <Box column={12}>
              <Image
                src={carousel.mediacarousel}
                naturalHeight={300}
                naturalWidth={300}
              />
            </Box>
          </TapArea>
        </SwiperSlide>
      ))}
    </Swiper>
  );
}
