import React from "react";
import css from "../styles/Login.module.css";
import { connect } from "react-redux";
import { authLogin } from "../store/actions/auth";
import Link from "next/link";
import { Text, Heading } from "gestalt";

class Login extends React.Component {
  state = {
    username: "",
    password: "",
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const { username, password } = this.state;
    this.props.login(username, password);
  };

  render() {
    const { error, loading, token } = this.props;
    const { username, password } = this.state;
    if (token) {
      return (window.location.pathname = "/");
    }

    return (
      <div className={css.Content}>
        <div className={css.Grid}>
          <div className={css.GridCol}>
            <Heading color="light" size={400}>Вход в свой аккаунт </Heading>
          </div>
          {error && <p>{this.props.error.message}</p>}
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
                value={password}
                name="password"
                placeholder="пароль"
                type="password"
              />

              <button className={css.buttonStyled} loading={loading}>
                Войти
              </button>
            </form>
            <div className={css.Message}>
              Впервые у нас ?
              <Link href="/signup">
                <a className={css.Paragraf}>Регистрация</a>
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
    login: (username, password) => dispatch(authLogin(username, password)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Login);
