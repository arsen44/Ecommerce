const constantsSeacrhapi = {
  api: {
    searchRoute: "/search", // Search route
    searchRouteParams:
      "facet=category" + // Default search params
      "&facet=price",
    rangeFilters: ["price"],
    searchPageSize: 10,
    suggestionsRoute: "/search/suggest/", // Suggestions route
    suggester: "name_suggest__completion",
    showZeroCountFacets: true,
  },
};

export default constantsSeacrhapi;
