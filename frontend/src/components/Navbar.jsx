// Receives site settings (brand, phone, button) and nav links from the API
export default function Navbar({ site, nav }) {
  return (
    <nav className="navbar navbar-expand-lg fixed-top bg-white shadow-sm">
      <div className="container">
        <a className="navbar-brand fw-bold d-flex align-items-center gap-2" href="#home">
          <span className="logo-box">
            <i className="bi bi-bar-chart-fill text-orange"></i>
          </span>
          {site?.brand_name}
        </a>

        {/* Hamburger button for small screens */}
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mainNav"
        >
          <span className="navbar-toggler-icon"></span>
        </button>

        <div className="collapse navbar-collapse" id="mainNav">
          <ul className="navbar-nav mx-auto gap-lg-2">
            {/* One link per NavItem row in the database */}
            {nav.map((item) => (
              <li className="nav-item" key={item.anchor}>
                <a className="nav-link" href={item.anchor}>{item.label}</a>
              </li>
            ))}
          </ul>

          <span className="me-3 small">
            <i className="bi bi-telephone text-orange me-1"></i>
            {site?.phone}
          </span>
          <button className="btn btn-orange rounded-pill">
            {site?.cta_button_text}
          </button>
        </div>
      </div>
    </nav>
  )
}