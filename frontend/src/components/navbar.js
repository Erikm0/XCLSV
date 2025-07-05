import '../componentsStyle/navbar.css';
import {Link} from 'react-router-dom';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {faUser, faShoppingCart} from '@fortawesome/free-solid-svg-icons';

function Navbar() {
    return (
        <nav className={"navbar navbar-expand-lg"}>
            <div className={"container-fluid"}>
                <div id={"gomb"}>
                    <button type="button" className={"gombKinezet"} data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                        <div className="gombContainer">
                            <div className="bar1"></div>
                            <div className="bar2"></div>
                            <div className="bar3"></div>
                        </div>
                    </button>
                </div>

                <h1><b><Link className={"navbar-brand header-text"} id="xclsv" to="/" data-text={"XCLSV"}>XCLSV</Link></b></h1>
                <div id={"jobbszel"}>
                    <form className={"eltun"} role="search">
                        <input className="form-control me-2" id={"searchbox"} type="search" placeholder="Search"
                               aria-label="Search"/>
                    </form>

                    <Link className={"eltun header-text d-none d-sm-flex"} to="/account" data-text={"ACCOUNT"}>ACCOUNT</Link>

                    <Link className={"eltun header-text d-none d-sm-flex"} to="/cart" data-text={"CART"}>CART</Link>
                    <a className={"d-block d-sm-none ikon"}>
                        <FontAwesomeIcon icon={faUser}/>
                    </a>
                    <a className={"d-block d-sm-none ikon"}>
                        <FontAwesomeIcon icon={faShoppingCart}/>
                    </a>
                </div>
            </div>
        </nav>
    );
}

export default Navbar;
