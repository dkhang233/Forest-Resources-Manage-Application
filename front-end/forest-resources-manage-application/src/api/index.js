import axios from "axios";

export const baseURL = 'https://suitably-welcomed-tick.ngrok-free.app/api/v1/'

export const apiClient = axios.create(
    {
        // baseURL: 'http://localhost:8088/api/v1',
        baseURL: 'https://suitably-welcomed-tick.ngrok-free.app/api/v1',
        headers: {
            "ngrok-skip-browser-warning": "69420",
        },
        timeout: 0
    }
);

export const apiMap = axios.create(
    {
        baseURL: 'https://api.openstreetmap.org/api/0.6',
        timeout: 0
    }
);