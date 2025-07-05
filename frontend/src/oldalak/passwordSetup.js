import React, { useState, useEffect } from 'react';
import Navbar from '../components/navbar';
import OffCanvas from "../components/offcanvas";
import axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';

function PasswordSetup() {
    const navigate = useNavigate();
    const { token } = useParams();
    const [password, setPassword] = useState("");
    const [passwordConfirmation, setPasswordConfirmation] = useState("");
    const [validToken, setValidToken] = useState(false);
    const [user, setUser] = useState(null);
    const API_URL = "http://127.0.0.1:8000/api";

    useEffect(() => {
        if (token) {
            axios.get(`${API_URL}/password-setup/${token}`)
                .then(response => {
                    if (response.data.success) {
                        setValidToken(true);
                        setUser(response.data.user);
                    }
                })
                .catch(error => {
                    console.error("Token validálás hiba:", error);
                    alert("Hiba történt a token validálása során!");
                    navigate("/");
                });
        }
    }, [token, navigate]);

    const handleFinalSubmit = async (e) => {
        e.preventDefault();
        if (password !== passwordConfirmation) {
            alert("A jelszavak nem egyeznek!");
            return;
        }

        if (!validToken || !token) {
            alert("Hiba történt a token ellenőrzésekor!");
            return;
        }

        try {
            await axios.post(`${API_URL}/set-password`, {
                password,
                password_confirmation: passwordConfirmation,
                token,
            });

            alert("A jelszó sikeresen beállítva!");
            navigate("/account");
        } catch (error) {
            console.error("Hiba a jelszó beállítása során:", error);
            alert("Hiba történt a jelszó beállításakor!");
        }
    };

    if (!validToken) {
        return <div>Érvénytelen token vagy nem érkezett token!</div>;
    }

    return (
        <>
            <OffCanvas />
            <Navbar />
            <div className="container-fluid">
                {/*JELSZÓ*/}
                <div className="row">
                    <div className="col-lg-6">
                        <div className="container-fluid d-flex flex-column mt-5">
                            <div className="account_option_div d-flex flex-lg-column flex-md-column flex-column justify-content-around mt-5">
                                <div className="account_option_title">
                                    <h1 className="effekt" data-text="Aktiválás">Aktiváld a tagságodat {user?.first_name}!</h1>
                                </div>
                                <form className="account_option_forms d-flex flex-column" onSubmit={handleFinalSubmit}>
                                    <input
                                        className="beiros_input"
                                        type="password"
                                        id="password"
                                        placeholder="Jelszó"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                    />
                                    <input
                                        className="beiros_input"
                                        type="password"
                                        id="password_confirmation"
                                        placeholder="Jelszó megerősítése"
                                        value={passwordConfirmation}
                                        onChange={(e) => setPasswordConfirmation(e.target.value)}
                                    />
                                    <div className="loginform_stuff d-flex flex-column-reverse justify-content-between">
                                        <input className="submitButtons w-100" type="submit" value="Aktiválás" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default PasswordSetup;
