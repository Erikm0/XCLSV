import "../componentsStyle/offcanvas.css"

function OffCanvas() {
    return (

        <div className="offcanvas offcanvas-start" tabIndex="-1" id="offcanvasExample"
             aria-labelledby="offcanvasExampleLabel">
            <div className="offcanvas-header">
                <h2 className="offcanvas-title" id="offcanvasExampleLabel">XCLSV</h2>
                <button type="button" className="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div className="offcanvas-body">
                <form role="search">
                    <input className="form-control me-2" id="searcher" type="search" placeholder="Search"
                           aria-label="Search"/>
                </form>
                <div className={"offcanvas-elemek container"}>
                    <div className={"row"}>
                        <div className={"offcanvas-elemek-neve col-6"}>
                            <ul className="menu-cucc">
                                <li>
                                    <a href="" data-preview-link="" data-handle="uj-termékek">
                                        <span className="">Új termékek</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="" data-preview-link="" data-handle="felsok">
                                        <span className="">Felsők</span>
                                    </a>
                                    <ul>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="jackets">
                                                <span className="">Dzsekik</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="shirts">
                                                <span className="">Ingek</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="sweaters">
                                                <span className="">Pulóverek</span>
                                            </a>
                                        </li>

                                    </ul>

                                </li>
                                <li>
                                    <a href="" data-preview-link="" data-handle="Alsok">
                                        <span className="">Alsók</span>
                                    </a>

                                    <ul>
                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Nadragok">
                                                <span className="">Nadrágok</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Rovidnadragok">
                                                <span className="">Rövidnadrágok</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Farmer">
                                                <span className="">Farmer</span>
                                            </a>
                                        </li>

                                    </ul>

                                </li>
                                <li>
                                    <a href="" data-preview-link="" data-handle="Melegitofelsok">
                                        <span className="">Melegítőfelsők</span>
                                    </a>

                                    <ul>
                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Kapucnis-puloverek">
                                                <span className="">Kapucnis pulóverek</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Kornyaku-puloverek">
                                                <span className="">Környakú pulóverek</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="" data-preview-link="" data-handle="Sapkak">
                                        <span className="">Sapkák</span>
                                    </a>

                                </li>
                                <li>
                                    <a href="" data-preview-link="" data-handle="Polok">
                                        <span className="">Pólók</span>
                                    </a>

                                    <ul>
                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Rovid-ujju-polok">
                                                <span className="">Rövid ujjú pólók</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Hosszu-ujju-polok">
                                                <span className="">Hosszú ujjú pólók</span>
                                            </a>
                                        </li>
                                    </ul>

                                </li>
                                <li>
                                    <a href="" data-preview-link="" data-handle="Kiegeszitok">
                                        <span className="">Kiegészítők</span>
                                    </a>

                                    <ul>
                                        <li>
                                            <a className={"offcanvas-termek-vonal"} href="" data-preview-link="" data-handle="Cipok">
                                                <span className="">Cipők</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div className={"offcanvas-elemek-kepe col-6"}>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default OffCanvas;