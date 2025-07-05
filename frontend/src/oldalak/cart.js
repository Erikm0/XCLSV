import Navbar from "../components/navbar";
import OffCanvas from "../components/offcanvas";
import React, {useEffect, useState} from "react";
import "../oldalakStyle/cart.css";

function Cart() {
    const [cartData, setCartData] = useState({items: [], total_price: 0});

    useEffect(() => {
        const fetchCart = async () => {
            try {
                const response = await fetch("http://127.0.0.1:8000/api/cart", {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`
                    }
                });
                const data = await response.json();
                setCartData(data);
            } catch (error) {
                console.error("Nem sikerült lekérni a kosarat:", error);
            }
        };
        fetchCart();
    }, []);

    const removeFromCart = async (productId) => {
        try {
            await fetch(`http://127.0.0.1:8000/api/cart/remove`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    Authorization: `Bearer ${localStorage.getItem("token")}`
                },
                body: JSON.stringify({product_id: productId}),
            });

            const response = await fetch("http://127.0.0.1:8000/api/cart", {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem("token")}`
                }
            });
            const updatedData = await response.json();
            setCartData(updatedData);
        } catch (error) {
            console.error("Nem sikerült eltávolítani a terméket:", error);
        }
    };

    return (<>
            <Navbar/>
            <OffCanvas/>
            <div className="container-fluid">
                <div className={"row"}>
                    <div className="d-lg-flex d-md-flex flex-column mt-5 pt-5">
                        <h1>Kosarad</h1>
                        <div className="d-lg-flex d-md-flex flex-row">
                            <div className={"col-6"}>
                                {cartData.items.length === 0 ? (
                                    <p>A kosarad üres.</p>
                                ) : (
                                    /*<div className={"d-flex flex-row justify-content-around tartalom"}>
                                        {displayedProducts.map(product => (
                                            <div className={"col-2 termekekDiv"} key={product.id}
                                                 onClick={() => setSelectedProduct(product)}>
                                                <img className={"kepek"} src={product.product_image} alt={product.name}/>
                                            </div>
                                        ))}
                                    </div>*/
                                    <div className={"d-flex flex-column justify-content-around tartalom"}>
                                        {cartData.items.map(item => (
                                            <div className={"d-flex flex-row align-items-center"} key={item.id}>
                                                <img src={item.product.product_image} alt={item.product.name}
                                                     width="100"/>
                                                <div>{item.product.name} -
                                                    darab: {item.quantity} - {item.quantity * item.price} Ft
                                                </div>
                                                <button className={"kosarButtons"}
                                                        onClick={() => removeFromCart(item.product.id)}>Eltávolítás
                                                </button>
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </div>
                            <div className={"col-6 d-flex flex-column align-items-center"}>
                                <h3>Végösszeg: {cartData.total_price} Ft</h3>
                                {cartData.items.length > 0 && (
                                    <div>
                                        <div className="d-flex flex-row  align-items-center mb-3">
                                            <label className="form-label m-0">Kuponkód:</label>
                                            <input type="text" className="form-control"
                                                   placeholder="Add meg a kuponkódot"/>
                                        </div>
                                        <button className="kosarButtons">Tovább a fizetéshez</button>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Cart;