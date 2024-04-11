import { useEffect } from "react";
import "../styles/globals.css";
import { Provider } from "react-redux";
import { useStore } from "../store/creatReducer";
import "../styles/gestalt.css";
import "gestalt-datepicker/dist/gestalt-datepicker.css";
import Layout from "./layout";
import AutoSignup from "../helpers/onTryAutoSignup";
import HOC from "../helpers/hoc";
import Head from "next/head";
import Favicon from "./components/Favicon";
import { useRouter } from "next/router";
import "lightgallery/css/lightgallery.css";
import "lightgallery/css/lg-zoom.css";

function MyApp({ Component, pageProps }) {
  const store = useStore(pageProps.initialReduxState);

  const router = useRouter();

  // useEffect(() => {
  //   const handleRouteChange = (url) => {
  //     ga.pageview(url);
  //   };

  //   //When the component is mounted, subscribe to router changes
  //   //and log those page views
  //   router.events.on("routeChangeComplete", handleRouteChange);

  //   // If the component is unmounted, unsubscribe
  //   // from the event with the `off` method
  //   return () => {
  //     router.events.off("routeChangeComplete", handleRouteChange);
  //   };
  // }, [router.events]);

  return (
    <Provider store={store}>
      <HOC>
        <AutoSignup />
        <Layout>
          <Head>
            <meta charSet="utf-8" />
            <meta name="yandex-verification" content="b1176776519717b3" />
            <meta
              name="google-site-verification"
              content="xC_g6bE9UP9nseVNd_3HURcWHXLCh6nWWnGpw634zT4"
            />
            <Favicon />
          </Head>
          <Component {...pageProps} />
        </Layout>
      </HOC>
    </Provider>
  );
}

export default MyApp;
