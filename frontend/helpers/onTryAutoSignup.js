import { connect } from "react-redux";
import React, { useEffect } from "react";
import * as actions from "../store/actions/auth";

function onTryAutoSignup(props) {
  useEffect(() => {
    props.onTryAutoSignup();
  });
}

const mapStateToProps = (state) => {
  return {
    isAuthenticated: state.auth.token !== null,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    onTryAutoSignup: () => dispatch(actions.authCheckState()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(onTryAutoSignup);
