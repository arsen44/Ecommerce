import { useState, useEffect } from 'react';
import { productListURL } from './constants';
import axios from 'axios';

const usePaginatedFetch = (props) => {
    const [data, setData] = useState({ items: [] });
    const [page, setPage] = useState(1);
    const [isFetching, setFetching] = useState(true);

    const fetchMore = () => {
        if (!isFetching) {
            setPage((prevPage) => prevPage + 1);
        }
    };

    useEffect(() => {
        const fetchData = async () => {
            setFetching(true);
            const res = await axios(productListURL + `?page=${page}`);
            setData((prevData) => ({ items: [...prevData.items, ...res.data.results] }));
            setFetching(false);
        };

        fetchData();
    }, [page]);

    return [{ data, isFetching }, fetchMore];
};

export { usePaginatedFetch };

