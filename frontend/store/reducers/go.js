import {
  UPDATE_SEARCH_QUERY,
  UPDATE_SEARCH_RESULTS,
  ADD_TODO_STARTED,
  ADD_TODO_SUCCESS,
  ADD_TODO_FAILURE,
} from "../actions/actionTypes";

const initialState = {
  search_query: "",
  search_results: [],
};

const searchReducer = (state = initialState, actions) => {
  switch (actions.type) {
    case UPDATE_SEARCH_QUERY:
      return { ...state, search_query: actions.payload.search_query };
    case UPDATE_SEARCH_RESULTS:
      return { ...state, search_results: actions.payload.search_results };
    case ADD_TODO_STARTED:
      return {
        ...state,
        loading: true,
      };
    case ADD_TODO_SUCCESS:
      return {
        ...state,
        loading: false,
        error: null,
        search_results: actions.payload,
      };
    case ADD_TODO_FAILURE:
      return {
        ...state,
        loading: false,
        error: actions.payload.error,
      };
    default:
      return state;
  }
};

export default searchReducer;
