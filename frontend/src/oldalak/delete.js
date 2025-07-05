import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import { useEffect } from 'react';

function DeleteAccount() {
    const { id } = useParams();
    const navigate = useNavigate();
    const API_URL = "http://127.0.0.1:8000";

    useEffect(() => {
        const handleDelete = async () => {
            try {
                await axios.post(`${API_URL}/api/delete/${id}`);
                navigate("/");
            } catch (err) {
                alert("Hiba történt: " + (err.response?.data?.message || "Ismeretlen hiba"));
            }
        };

        handleDelete();

    }, [id, navigate]);
}

export default DeleteAccount;
