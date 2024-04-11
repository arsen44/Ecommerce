import axios from "axios";
import constantsSeacrhapi from "./constantsSeacrh";

if (typeof window !== "undefined") {
  if (window.location.origin === "http://localhost:3000") {
    axios.defaults.baseURL = "http://localhost:8000";
  } else {
    axios.defaults.baseURL = window.location.origin;
  }
}
const client = axios.create({
  baseURL: constantsSeacrhapi.api.url,
  validateStatus: function (status) {
    return status >= 200 && status < 300;
  },
});

export default class api {
  static buildSearchUrl(query, filters = {}) {
    let queryList = [];
    queryList.push(`/?search=${query}`);
    for (var filterName in filters) {
      // Apply additional suffixes for range filters
      let filterSuffix =
        constantsSeacrhapi.api.rangeFilters.indexOf(filterName) > -1
          ? "__range"
          : "";
      for (var filterValue in filters[filterName]) {
        queryList.push(`${filterName}${filterSuffix}=${filterValue}`);
      }
    }
    return queryList.join("&");
  }

  static search = (query, filters) => {
    const params = api.buildSearchUrl(query, filters);
    return client({
      method: "get",
      url: `${constantsSeacrhapi.api.searchRoute}` + `${params}`,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      credentials: "same-origin",
    });
  };

  static detail = (slug) => {
    return client({
      method: "get",
      url: `${constantsSeacrhapi.api.searchRoute}${slug}/`,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      credentials: "same-origin",
    });
  };

  static suggest = (value, field = constantsSeacrhapi.api.suggester) => {
    return client({
      method: "get",
      url: `${constantsSeacrhapi.api.suggestionsRoute}?${field}=${value}`,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      credentials: "same-origin",
    });
  };
}
