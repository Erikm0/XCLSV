import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter, Routes, Route} from "react-router-dom";
import Fooldal from './oldalak/fooldal';
import Account from './oldalak/account';
import Cart from './oldalak/cart';
import DeleteAccount from './oldalak/delete';
import PasswordSetup from './oldalak/passwordSetup';
import reportWebVitals from './reportWebVitals';
import './index.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <BrowserRouter>
        <Routes>
            <Route path="/" element={<Fooldal/>}></Route>
            <Route path="/account" element={<Account/>}></Route>
            <Route path="/cart" element={<Cart/>}></Route>
            <Route path="/password-setup/:token" element={<PasswordSetup/>}/>
            <Route path="/delete/:id" element={<DeleteAccount/>}></Route>
        </Routes>
    </BrowserRouter>
);
reportWebVitals();
