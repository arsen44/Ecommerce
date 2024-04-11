import React from "react";
import css from "../styles/Signup.module.css";
import { authSignup } from "../store/actions/auth";
import { connect } from "react-redux";
import Link from "next/link";

class Signup extends React.Component {
  state = {
    username: "",
    email: "",
    password1: "",
    password2: "",
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const { username, email, password1, password2 } = this.state;
    this.props.signup(username, email, password1, password2);
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  render() {
    const { username, email, password1, password2 } = this.state;
    const { error, loading, token } = this.props;
    if (token) {
      return (window.location.pathname = "/");
    }
    return (
      <div className={css.Content}>
        <div className={css.Grid}>
          <div className={css.GridCol}>
            <h2>Регистрация</h2>
            {error && <p>{this.props.error.message}</p>}
          </div>
          <React.Fragment>
            <form className={css.StayledForm} onSubmit={this.handleSubmit}>
              <input
                className={css.Input}
                onChange={this.handleChange}
                value={username}
                name="username"
                placeholder="имя пользователя"
              />
              <input
                className={css.Input}
                onChange={this.handleChange}
                value={email}
                name="email"
                placeholder="E-mail адрес электронной почты"
              />
              <input
                className={css.Input}
                onChange={this.handleChange}
                value={password1}
                name="password1"
                placeholder="пароль"
                type="password"
              />
              <input
                className={css.Input}
                onChange={this.handleChange}
                value={password2}
                name="password2"
                placeholder="повторите пароль"
                type="password"
              />
              <button
                className={css.buttonStyled}
                loading={loading}
                disabled={loading}
              >
                Зарегистрироваться
              </button>
            </form>
            <div className={css.Message}>
              Есть аккаунт?
              <Link href="/login">
                <a>Вход </a>
              </Link>
            </div>
          </React.Fragment>
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    loading: state.auth.loading,
    error: state.auth.error,
    token: state.auth.token,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    signup: (username, email, password1, password2) =>
      dispatch(authSignup(username, email, password1, password2)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Signup);
