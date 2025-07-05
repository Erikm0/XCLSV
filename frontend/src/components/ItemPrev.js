import "../componentsStyle/ItemPrev.css";

function ItemPrev({image, name, description, price}) {
    return (
        <div className="product-card d-flex flex-row align-items-center">
            <div className={"col-6 h-80"}>
                <img className="product-image" src={image} alt="Termék kép"/>
            </div>
            <div className="product-details col-6">
                <h2 className="product-name">{name}</h2>
                <p className="product-description">{description}</p>
                <p className="product-price">{price} Ft</p>
            </div>
        </div>
    );
}

export default ItemPrev;
