import { UPDATE_SEARCH_QUERY, UPDATE_SEARCH_RESULTS } from "./actionTypes";

export const updateSearchQuery = (search_query) => {
  return {
    type: UPDATE_SEARCH_QUERY,
    payload: {
      search_query: search_query,
    },
  };
};

export const updateSearchResults = (search_results) => {
  return {
    type: UPDATE_SEARCH_RESULTS,
    payload: {
      search_results: search_results,
    },
  };
};

export const addTodoSuccess = (search_results) => ({
  type: UPDATE_SEARCH_RESULTS,
  payload: { search_results: search_results },
});
