import React, { createRef, useState, useEffect } from "react";
import {
  Box,
  Masonry,
  Image,
  Text,
  Mask,
  TapArea,
  Heading,
  Spinner,
} from "gestalt";
import { tagpromotion } from "../../helpers/constants";
import axios from "axios";
import Video from "../../helpers/Video";
import { connect } from "react-redux";
import { useRouter, withRouter } from "next/router";
import Link from "next/link";

const Promotions = (props) => {
  const router = useRouter();
  const [data, setData] = useState({ items: props.data });
  const [isFetching, setFetching] = useState(true);
  const { slug } = router.query;

  const scrollContainerRef = createRef();

  const currencyFormat = (num) => {
    return num.toFixed().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ");
  };

  return (
    <React.Fragment>
      <Box
        height={900}
        overflow="auto"
        shape="rounded"
        ref={scrollContainerRef}
      >
        {data && (
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
                                    boxShadow:
                                      "0px 6px 4px rgba(0, 0, 0, 0.25)",
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
                                    boxShadow:
                                      "0px 6px 4px rgba(0, 0, 0, 0.25)",
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
            items={data.items}
            scrollContainer={() => scrollContainerRef.current}
            minCols={2}
            layout="flexible"
            virtualize
            gutterWidth={15}
          />
        )}
        <Spinner show={isFetching} accessibilityLabel="Test" />
      </Box>
    </React.Fragment>
  );
};

const mapStateToProps = (state) => {
  return {
    result: state.search.search_results,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    refreshCart: () => dispatch(fetchCart()),
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(Promotions)
);

export async function getStaticPaths() {
  const res = await axios.get(`${process.env.BASE_FETCH_URL}/search/?tags=`);
  const data = res.data.results;
  const paths = data.map((item) => ({
    params: { slug: item.slug }, // keep in mind if post.id is a number you need to stringify post.id
  }));

  return {
    paths,
    fallback: "blocking",
  };
}

export async function getStaticProps({ params }) {
  // Fetch data from external API
  const res = await axios(
    `${process.env.BASE_FETCH_URL}/search/?tags=${params.slug}`
  );
  const data = res.data.results;

  // Pass data to the page via props
  return {
    props: { data },
    revalidate: 10,
  };
}
