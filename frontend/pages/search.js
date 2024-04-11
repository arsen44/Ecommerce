import React, { useRef, useState, useEffect } from "react";
import { Box, Masonry, Image, Text, Mask, TapArea, Heading } from "gestalt";
import Video from "../helpers/Video";
import { connect } from "react-redux";
import { updateSearchResults, updateSearchQuery } from "../store/actions/go";
import { fetchCart } from "../store/actions/cart";
import axios from "axios";
import Link from "next/link";

const Search = (props) => {
  const data = { items: props.result };
  const [page, setPage] = useState(2);
  const scrollContainerRef = useRef();
  const [isFetching, setFetching] = useState(true);

  // useEffect(() => {
  //   window.addEventListener("scroll", handleScroll);
  //   return () => {
  //     window.removeEventListener("scroll", handleScroll);
  //   };
  // });

  // const handleScroll = () => {
  //   if (
  //     document.documentElement.scrollHeight -
  //       document.documentElement.scrollTop ===
  //     document.documentElement.clientHeight
  //   ) {
  //     fetchData();
  //   }
  // };

  // const fetchData = async () => {
  //   setFetching(true);
  //   const res = await axios(
  //     `http://127.0.0.1:8000/search/?page=${page}&search=${props.search_query}`
  //   ).then((res) => {
  //     setData((prevData) => ({
  //       items: [...prevData.items, ...res.data.results],
  //     }));
  //     setPage((prevPage) => prevPage + 1);
  //   });
  //   setFetching(false);
  // };

  const currencyFormat = (num) => {
    return num.toFixed().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
  };

  return (
    <Box>
      <Masonry
        Item={({ data }) => (
          <Link href={`/products/${data.slug}`}>
          <a>
            {data.media_type === "image" && (
              <Box>
                <Mask shape="rounded" rounding={4} wash>
                  <Image
                    key={data.id}
                    alt={data.title}
                    naturalHeight={data.height}
                    naturalWidth={data.width}
                    src={data.media}
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
        //loadItems={fetchData}
        items={data.items}
        scrollContainer={() => window}
        minCols={2}
        layout="flexible"
        virtualize
        gutterWidth={15}
      />
    </Box>
  );
};

const mapStateToProps = (state) => {
  return {
    result: state.search.search_results,
    search_query: state.search.search_query,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    refreshCart: () => dispatch(fetchCart()),
    updateSearchQuery: () => dispatch(updateSearchQuery()),
    updateSearchResults: (search_results) =>
      dispatch(updateSearchResults(search_results)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Search);
