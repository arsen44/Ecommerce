import { createRef, useState, useEffect } from "react";
import {
  Masonry,
  Image,
  Text,
  Spinner,
  Mask,
  Heading,
  Flex,
  Box,
} from "gestalt";
import axios from "axios";
import Video from "../helpers/Video";
import CarouselContent from "./components/CarouselContent";
import CategorySlider from "./components/CategorySlider";
import Link from "next/link";
import Head from "next/head";
import { productListURL } from "../helpers/constants";

export default function Index(props) {
  const [data, setData] = useState({ items: props.data });
  const [page, setPage] = useState(2);
  const [isFetching, setFetching] = useState(true);

  const currencyFormat = (num) => {
    return num.toFixed().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
  };

  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  });

  const handleScroll = () => {
    if (
      document.documentElement.scrollHeight -
        document.documentElement.scrollTop ===
      document.documentElement.clientHeight
    ) {
      fetchData();
    }
  };

  const fetchData = async () => {
    setFetching(true);
    const res = await axios(productListURL + `?page=${page}`).then((res) => {
      setData((prevData) => ({
        items: [...prevData.items, ...res.data.results],
      }));
      setPage((prevPage) => prevPage + 1);
    });
    setFetching(false);
  };

  return (
    <Flex direction="column">
      <Head>
        <meta name="description" content="Cake Nuage" />
        <meta property="og:url" content="https://www.cakenuage.com" />
        <meta
          property="og:title"
          content="Cake Nuage – Торты на заказ в Москве, купить торт на заказ, заказать торт с доставкой"
        />
        <meta
          property="og:description"
          content="Торты на заказ в Москве, купить торт на заказ, заказать торт с доставкой,магазин для кондитеров"
        />
        <title>
          Торты на заказ в Москве, купить торт на заказ, заказать торт с
          доставкой
        </title>
        <meta
          name="description"
          content="Торты на заказ в Москве, купить торт на заказ, заказать торт с доставкой, магазин для кондитеров"
        />
      </Head>
      <Box paddingY={5}>
        <CarouselContent />
      </Box>
      <Box maxHeight={250}>
        <CategorySlider />
      </Box>
      <Box paddingY={1}>
        <Masonry
          Item={({ data }) => (
            <Link href={`/products/${data.slug}`}>
              <a>
                {data.media_type === "image" && (
                  <Box>
                    <Mask shape="rounded" rounding={4} wash>
                      <Image
                        color="#404040"
                        key={data.id}
                        alt={data.title}
                        naturalHeight={data.height}
                        naturalWidth={data.width}
                        src={data.media}
                        importance="auto"
                        loading="auto"
                      >
                        <Box rounding="pill" margin={2}>
                          {data.discount_price && (
                            <Box
                              color="light"
                              rounding="pill"
                              width="27px"
                              height="27px"
                              alignItems="center"
                              display="flex"
                              dangerouslySetInlineStyle={{
                                __style: {
                                  background:
                                    "linear-gradient(90deg, #F093FB 0%, #F5576C 100%)",
                                  boxShadow: "0px 6px 4px rgba(0, 0, 0, 0.25)",
                                },
                              }}
                            >
                              <Text color="light" size="sm">
                                -
                                {100 -
                                  Math.floor(
                                    (data.discount_price * 100) / data.price
                                  )}
                                %
                              </Text>
                            </Box>
                          )}
                        </Box>
                      </Image>
                    </Mask>
                    {data.discount_price ? (
                      <Box>
                        <Heading lineClamp={2} color="light" size="300">
                          {currencyFormat(data.discount_price)} ₽{" "}
                          <del
                            style={{
                              color: "#a1a6a6",
                              margin: "10px",
                              fontSize: "16px",
                            }}
                          >
                            {currencyFormat(data.price)} ₽
                          </del>
                        </Heading>
                      </Box>
                    ) : (
                      <Heading lineClamp={2} color="light" size="300">
                        {currencyFormat(data.price)} ₽
                      </Heading>
                    )}

                    <Heading lineClamp={2} color="light" size="200">
                      {data.title}
                    </Heading>
                  </Box>
                )}

                {data.media_type === "video" && (
                  <Box width="100%">
                    <Mask Mask shape="rounded" rounding={4} wash>
                      <Video url={data.media}>
                        <Box rounding="pill" margin={2}>
                          {data.discount_price && (
                            <Box
                              color="light"
                              rounding="pill"
                              width="27px"
                              height="27px"
                              alignItems="center"
                              display="flex"
                              dangerouslySetInlineStyle={{
                                __style: {
                                  background:
                                    "linear-gradient(90deg, #F093FB 0%, #F5576C 100%)",
                                  boxShadow: "0px 6px 4px rgba(0, 0, 0, 0.25)",
                                },
                              }}
                            >
                              <Text color="light" size="sm">
                                -
                                {100 -
                                  Math.floor(
                                    (data.discount_price * 100) / data.price
                                  )}
                                %
                              </Text>
                            </Box>
                          )}
                        </Box>
                      </Video>
                    </Mask>

                    {data.discount_price ? (
                      <Box>
                        <Heading lineClamp={2} color="light" size="300">
                          {currencyFormat(data.discount_price)} ₽{" "}
                          <del style={{ color: "#a1a6a6" }}>
                            {" "}
                            {currencyFormat(data.price)} ₽
                          </del>
                        </Heading>
                      </Box>
                    ) : (
                      <Heading lineClamp={2} color="light" size="300">
                        {currencyFormat(data.price)} ₽
                      </Heading>
                    )}

                    <Heading lineClamp={2} color="light" size="200">
                      {data.title}
                    </Heading>
                  </Box>
                )}
              </a>
            </Link>
          )}
          loadItems={fetchData}
          items={data.items}
          scrollContainer={() => window}
          minCols={2}
          layout="flexible"
          gutterWidth={10}
          virtualBufferFactor={0.7}
          virtualize
        />
        <Spinner show={isFetching} accessibilityLabel="loadingPin" />
      </Box>
    </Flex>
  );
}

export async function getStaticProps() {
  const ress = await axios("http://127.0.0.1:8000/api/products/?page=1");

  const data = ress.data.results;

  return {
    props: { data },
    revalidate: 60,
  };
}
