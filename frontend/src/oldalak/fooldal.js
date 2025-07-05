import Navbar from '../components/navbar';
import OffCanvas from "../components/offcanvas";
import ItemPrev from "../components/ItemPrev";
import sample from "../assets/XCLSV.gif";
import '../oldalakStyle/fooldal.css'
import test from "../assets/No-Image-Placeholder.svg.png"
import React, {useEffect, useState} from 'react';
import { useNavigate } from 'react-router-dom';


function Fooldal() {
    const navigate = useNavigate();
    const [products, setProducts] = useState([]);
    const [selectedProduct, setSelectedProduct] = useState(null);
    const [currentPage, setCurrentPage] = useState(0);
    const itemsPerPage = 5;

    useEffect(() => {
        fetch('http://127.0.0.1:8000/api/productsIndex')
            .then(response => response.json())
            .then(data => setProducts(data));
    }, []);

    const startIndex = currentPage * itemsPerPage;
    const displayedProducts = products.slice(startIndex, startIndex + itemsPerPage);

    const handleNext = () => {
        if ((currentPage + 1) * itemsPerPage < products.length) {
            setCurrentPage(prev => prev + 1);
        }
    };

    const handlePrev = () => {
        if (currentPage > 0) {
            setCurrentPage(prev => prev - 1);
        }
    };

    const handleAddToCart = async (product) => {
        try {
            const token = localStorage.getItem("token");
            if (!token) {
                alert("Kérlek jelentkezz be!");
                navigate("/account");
                return;
            }

            await fetch("http://127.0.0.1:8000/api/cart/add", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`
                },
                body: JSON.stringify({
                    product_id: product.id,
                    quantity: 1
                })
            });

        } catch (error) {
            console.error("Nem sikerült hozzáadni a kosárhoz:", error);
        }
    };


    return (
        <>
            {selectedProduct && (
                <div className="selected-product-overlay">
                    <div className="selected-product-container">
                        <button className="close-button" onClick={() => setSelectedProduct(null)}>X</button>
                        <ItemPrev
                            image={selectedProduct.product_image || test}
                            name={selectedProduct.name}
                            description={selectedProduct.description || "Nincs leírás"}
                            price={selectedProduct.price}>
                        </ItemPrev>
                        <button className="kosarba-button mt-2"
                                onClick={() => handleAddToCart(selectedProduct)}>Kosárba
                        </button>
                    </div>
                </div>
            )}

            <OffCanvas/>
            <div id={"felso_resz"}>
                <Navbar/>
                <div className={"col-12"}>
                    <img id={"xclsv_gif"} alt={"X C L S V"} src={sample}/>
                </div>
            </div>
            <div className="marquee">
                <div className="marquee_elem cimke">
                    <div>Breaking:</div>
                </div>
                <div className="marquee_elem">
                    <div className="marquee_vizszintes">
                        <div className="csik">
                            {[...Array(16)].map((_, i) => (
                                <div className="marquee_tartalom" key={i}>LÉGY TE IS XCLSV TAG</div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>
            <div id="ruhak">
                <h1>Ruhák</h1>
                <div className={"d-flex flex-row ruhaRow"}>
                    <button className={"nyilak"} onClick={handlePrev} disabled={currentPage === 0}>←</button>
                    <div className={"d-flex flex-row justify-content-around tartalom"}>
                        {displayedProducts.map(product => (
                            <div className={"col-2 termekekDiv"} key={product.id}
                                onClick={() => setSelectedProduct(product)}>
                                <img className={"kepek"} src={product.product_image} alt={product.name}/>
                            </div>
                        ))}
                    </div>
                    <button className={"nyilak"} onClick={handleNext}
                            disabled={(currentPage + 1) * itemsPerPage >= products.length}>→
                    </button>
                </div>
            </div>
        </>
    )
}

export default Fooldal;
