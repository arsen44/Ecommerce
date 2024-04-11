import axios from 'axios';

const getToken = () => {
    if (typeof window !== 'undefined') {
        let token = localStorage.getItem('token');
        return token;
    }
};

export const authAxios = axios.create({
    baseURL: 'http://127.0.0.1:8000/api',
    headers: {
        Authorization: `Token ${getToken()}`,
    },
});
