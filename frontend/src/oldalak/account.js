import {useState, useEffect} from "react";
import axios from 'axios';
import Navbar from "../components/navbar";
import OffCanvas from "../components/offcanvas";
import "../oldalakStyle/account.css";
import login_sample from "../assets/login.mp4";
import PhoneInput from "react-phone-input-2";
import "react-phone-input-2/lib/style.css";
import {kever} from "../oldalakScript/szovegkeveres";
import { useNavigate } from 'react-router-dom';

function Account() {
    const [phone, setPhone] = useState("");
    const [loginData, setLoginData] = useState({email: "", password: ""});
    const [registerData, setRegisterData] = useState({
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        newsletter: false,
        password: "asdasd123",
        password_confirmation: "asdasd123",
        date_of_birth: "2025-12-31",
    });

    const API_URL = "http://127.0.0.1:8000";

    {/*SZÖVEG EFFECT*/
    }
    useEffect(() => {
        document.querySelectorAll('.effekt').forEach(el => {
            el.addEventListener('mouseenter', () => kever(el));
        });
    }, []);

    {/*REGISZTRÁCIÓ KEZELÉS*/}
    const handleRegisterSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post(`${API_URL}/api/register`,
                {
                    ...registerData,
                    phone,
                    newsletter: registerData.newsletter ? 1 : 0
                },
                {
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json",
                        "X-Requested-With": "XMLHttpRequest"
                    },
                    withCredentials: true
                }
            );
            alert("Regisztráció sikeres!");
            console.log(response.data);
        } catch (error) {
            console.error("Registration error:", error);
            if (error.response && error.response.data) {
                alert(`Hiba: ${JSON.stringify(error.response.data)}`);
            } else {
                alert("Hiba történt a regisztráció során!");
            }
        }
    };

    {/*LOGIN KEZELÉS*/}
    const handleLoginSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post(`${API_URL}/api/login`, loginData);
            const { access_token, user_type, user } = response.data;

            localStorage.setItem("auth_token", access_token);
            localStorage.setItem("user", JSON.stringify(user));
            localStorage.setItem("token", access_token);

            alert("Bejelentkezés sikeres!");
            navigate(0);
        } catch (error) {
            console.error("Login error:", error);
            alert("Hiba történt a bejelentkezés során!");
        }
    };


    {/*Fiók update keresése*/}
    const handleProfileUpdate = async (e) => {
        e.preventDefault();
        try {
            axios.put(`${API_URL}/api/updateProfile`, updatedUser, {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem("token")}`,
                },
            })
                .then((res) => {
                    alert("Profil frissítve!");
                    localStorage.setItem("user", JSON.stringify(res.data.user));
                })
                .catch((err) => {
                    console.error("Hiba frissítéskor:", err);
                });
        } catch (error) {
            if (error.response && error.response.data) {
                alert(`Hiba: ${JSON.stringify(error.response.data)}`);
            } else {
                alert("Hiba történt a szerkesztés során!");
            }
        }
    }

    {/*Kijelentkezés*/}
    const logoutFiokbol = async (e) => {
        e.preventDefault();
        localStorage.clear();
        window.location.reload();
    }
    {/*Fiók törlése*/}
    const deleteFiok = async (e) => {

        const response = await axios.get(`${API_URL}/api/customer`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem("token")}`
            }
        });

        const user = response.data;
        const id = user.id;

        if (window.confirm("Biztosan törlöd a fiókodat?")) {
            axios.post(`${API_URL}/api/deleteConfirmation/${id}`, {}, {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem("token")}`,
                },
            })
            alert("Elküldtük az emailedre a megerősítő emailt")
        }
    }
    const navigate = useNavigate();

    const [firstName, setFirstName] = useState(null);
    const [lastName, setLastName] = useState(null);
    const [email, setEmail] = useState(null);
    const [role, setRole] = useState(null);
    const [updatedUser, setUpdatedUser] = useState({
        first_name: ``,
        last_name: ``,
        email: ``,
        phone: ``
    });
    /*kiírajta az adatokat*/
    useEffect(() => {
        const fetchUserData = async () => {
            try {
                const response = await axios.get(`${API_URL}/api/customer`, {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`
                    }
                });

                const user = response.data;
                setFirstName(user.first_name);
                setLastName(user.last_name);
                setEmail(user.email);
                setPhone(user.phone);
                setRole(user.role);

            } catch (error) {
                console.error("Nem sikerült lekérni a felhasználó adatait:", error);
            }
        };

        fetchUserData();
    }, []);



    return (<>
            <OffCanvas/>
            <Navbar/>
            {role === "customer" ? (
                <div className="container-fluid">
                    <div className="row">
                        <div className="d-lg-flex d-md-flex mt-5 pt-5">
                            <div className={"col-6"}>
                                <h1>Fiókom</h1>
                                <div className={"d-flex flex-col"}>
                                    <div>
                                        <h4>Vezetéknév - {lastName}</h4>
                                        <h4>Keresztnév - {firstName}</h4>
                                        <h4>Email - {email}</h4>
                                        <h4>Telefonszám - +{phone}</h4>
                                    </div>
                                </div>
                            </div>

                            <div className={"col-6"}>
                                <h1>Szerkesztés:</h1>
                                <form onSubmit={handleProfileUpdate} className="d-flex flex-column">
                                    <input className="beiros_input" type="text"
                                           onChange={(e) => setUpdatedUser({
                                               ...updatedUser,
                                               last_name: e.target.value
                                           })}
                                           placeholder={lastName}/>
                                    <input className="beiros_input" type="text"
                                           onChange={(e) => setUpdatedUser({
                                               ...updatedUser,
                                               first_name: e.target.value
                                           })}
                                           placeholder={firstName}/>
                                    <input className="beiros_input" type="email"
                                           onChange={(e) => setUpdatedUser({
                                               ...updatedUser,
                                               email: e.target.value
                                           })}
                                           placeholder={email}/>
                                    <PhoneInput className="beiros_input" country="hu"
                                                onChange={(value) => setUpdatedUser({
                                                    ...updatedUser,
                                                    phone: value })}/>
                                    <button className="submitButtons w-100 mt-3" type="submit">Mentés</button>
                                </form>

                                <div className={"d-flex flex-col align-items-end justify-content-around"}>
                                    <button className="btn btn-secondary mt-3" onClick={logoutFiokbol}>
                                        Kijelentkezés
                                    </button>

                                    <button className="btn btn-danger mt-2" onClick={deleteFiok}>
                                        Fiók törlése
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            ) : (
                // Bejelentkezés & regisztráció UI
                <div className="container-fluid">
                    <div className="row">
                        {/*JÓLKINÉZŐS CUCC*/}
                        <div className="col-lg-5 col-md-6 d-none d-lg-flex d-md-flex login_video_parent">
                            <div className="video_text">
                                <h1 className="video_text_title">XCLSV életviteli tagság</h1>
                                <h4 className="video_text_content">
                                    Regisztrálj hogy te is tagja legyél az XCLSV életvitelnek, és hogy hozzáférést
                                    szerezz tagoknak exklúzív termékekhez & szolgáltatásokhoz
                                </h4>
                                <div className="video_text_features d-flex flex-column flex-lg-row flex-md-column justify-content-between">
                                    <div className="feature_divs w-100 w-lg-30 w-md-100">
                                        <p className="feature_numbers">01</p>
                                        <p className="feature_text">Kövesd le a rendelésed</p>
                                    </div>
                                    <div className="feature_divs w-100 w-lg-30 w-md-100">
                                        <p className="feature_numbers">02</p>
                                        <p className="feature_text">Legyél te aki először értesül az új termékekről</p>
                                    </div>
                                    <div className="feature_divs w-100 w-lg-30 w-md-100">
                                        <p className="feature_numbers">03</p>
                                        <p className="feature_text">Szerezz csak tagoknak szóló termékekhez hozzáférést</p>
                                    </div>
                                </div>
                            </div>
                            <video className="login_video" autoPlay muted loop>
                                <source src={login_sample} type="video/mp4"/>
                            </video>
                        </div>

                        {/*BEÍRÓS CUCC*/}
                        <div className="col-lg-7 col-md-6 col-sm-12">
                            <div className="container-fluid accountthing_parent d-flex flex-column ">

                                {/*BEJELENTKEZÉS*/}
                                <div className="account_option_div d-flex flex-lg-row flex-md-column flex-column justify-content-around mt-5">
                                    <div className={"account_option_title"}>
                                        <h1 className=" effekt" data-text="Bejelentkezés">Bejelentkezés</h1>
                                    </div>
                                    <form className="account_option_forms d-flex flex-column"
                                          onSubmit={handleLoginSubmit}>
                                        <input
                                            className="beiros_input"
                                            type="text"
                                            placeholder="Email:"
                                            value={loginData.email}
                                            onChange={(e) => setLoginData({...loginData, email: e.target.value})}
                                        />
                                        <input
                                            className="beiros_input"
                                            type="password"
                                            placeholder="Jelszó:"
                                            value={loginData.password}
                                            onChange={(e) => setLoginData({...loginData, password: e.target.value})}
                                        />
                                        <div className="loginform_stuff d-flex flex-column-reverse justify-content-between">
                                            <input className="submitButtons w-100" type="submit" value="Bejelentkezés"/>
                                            <a className={"effekt"} data-text="Elfelejtettem a jelszavam">
                                                Elfelejtettem a jelszavam
                                            </a>
                                        </div>
                                    </form>
                                </div>

                                {/*REGISZTRÁCIÓ*/}
                                <div className="account_option_div d-flex flex-lg-row flex-md-column flex-column justify-content-around">
                                    <div className={"account_option_title"}>
                                        <h1 className=" effekt" data-text="Regisztráció">Regisztráció</h1>
                                    </div>
                                    <form className="account_option_forms d-flex flex-column"
                                          onSubmit={handleRegisterSubmit}>
                                        <input className="beiros_input" type="text" id="firstname"
                                               placeholder="Keresztnév *:" required={true}
                                               onChange={(e) => setRegisterData({
                                                   ...registerData,
                                                   firstName: e.target.value
                                               })}/>
                                        <input className="beiros_input" type="text" id="lastname"
                                               placeholder="Vezetéknév *:" required={true}
                                               onChange={(e) => setRegisterData({
                                                   ...registerData,
                                                   lastName: e.target.value
                                               })}/>
                                        <input className="beiros_input" type="email" id="email"
                                               placeholder="Email *:"
                                               onChange={(e) => setRegisterData({
                                                   ...registerData,
                                                   email: e.target.value
                                               })}/>
                                        <PhoneInput className="beiros_input" country='hu'
                                                    placeholder={"+36 12 345 67 89"} value={phone}
                                                    onChange={setPhone}
                                                    autoFormat={true} required={true} defaultMask={".. ... .. .."}/>
                                        <input className="beiros_input" type="date" name="trip-start"
                                               min="1905-01-01"
                                               max="2025-12-31" required={true}
                                               onChange={(e) => setRegisterData({
                                                   ...registerData,
                                                   date_of_birth: e.target.value
                                               })}/>
                                        <div>
                                            <input type="checkbox" id="newsLetter"/>
                                            <label className="newsLetter effekt" htmlFor="newsLetter"
                                                   data-text="Feliratkozom a hírlevélre"
                                                   onChange={(e) => setRegisterData({
                                                       ...registerData,
                                                       newsletter: e.target.checked
                                                   })}>
                                                Feliratkozom a hírlevélre
                                            </label>
                                        </div>
                                        <input className="submitButtons w-100" type="submit" value="Regisztráció"/>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}

export default Account;
