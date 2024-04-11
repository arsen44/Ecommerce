import axios from "axios";

if (typeof window !== "undefined") {
    if (window.location.origin === "http://localhost:3000") {
      axios.defaults.baseURL = "http://127.0.0.1:8000";
    } else {
      axios.defaults.baseURL = window.location.origin;
    }
  }

export const restAuth = `/rest-auth/login/`;
export const restSignup = `/rest-auth/registration/`;
export const productListURL = `/api/products/`;
export const productDetailURL = (slug) => `/api/products/${slug}/`;
export const addToCartURL = `/add-to-cart/`;
export const orderSummaryURL = `/order-summary/`;
export const checkoutURL = `/checkout/`;
export const addCouponURL = `/add-coupon/`;
export const countryListURL = `/api/countries/`;
export const userIDURL = `/user-id/`;
export const addressListURL = `/addresses/`;
export const addressCreateURL = `/addresses/create/`;
export const addressUpdateURL = (id) => `/addresses/${id}/update/`;
export const addressDeleteURL = (id) => `/addresses/${id}/delete/`;
export const orderItemDeleteURL = (id) => `/order-items/${id}/delete/`;
export const orderItemUpdateQuantityURL = `/order-item/update-quantity/`;
export const paymentListURL = `/payments/`;
export const categoryDetailURL = (slug) => `/api/category/${slug}/`;
export const categoryListURL = `/api/category/`;
export const Carousel = `/api/carousel/`;
export const tagpromotion = (slug) => `/search/?tags=${slug}`;