import Navbar from '../components/navbar';
import OffCanvas from "../components/offcanvas";
import {useEffect} from 'react';
import { useNavigate } from 'react-router-dom';

function AdminPanel() {
    const navigate = useNavigate(); // Itt hívjuk meg a useNavigate-et

    useEffect(() => {
        const user = JSON.parse(localStorage.getItem('user'));
        if (!user || user.user_type !== 'admin') {
            navigate('/');
        }
    }, [navigate]);

    return (<>


        <OffCanvas/>
        <Navbar/>
    </>)
}

export default AdminPanel
