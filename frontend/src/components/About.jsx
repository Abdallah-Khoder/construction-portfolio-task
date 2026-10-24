export default function About({ about }) {
  if (!about) return null;

  return (
    <section id="about" className="about py-5">
      <div className="container">
        <div className="row align-items-center g-5">
          {/* Left column: images and the badge */}
          <div className="col-lg-6">
            <div className="about-images">
              <img src={about.image_main} alt="" className="about-img-main" />
              {about.image_secondary && (
                <img
                  src={about.image_secondary}
                  alt=""
                  className="about-img-secondary"
                />
              )}
              <div className="about-badge">
                <strong>{about.badge_number}</strong>
                <span>{about.badge_label}</span>
              </div>
            </div>
          </div>

          {/* Right column: text, features and buttons */}
          <div className="col-lg-6">
            <p className="small-heading">
              <i className="bi bi-building me-2"></i>
              {about.small_heading}
            </p>
            <h2>{about.title}</h2>
            <p>{about.description}</p>

            <div className="row g-4 my-3">
              {about.features.map((f) => (
                <div className="col-sm-6 feature" key={f.title}>
                  <span className="feature-icon">
                    <i className={`bi ${f.icon}`}></i>
                  </span>
                  <h6>{f.title}</h6>
                  <p>{f.description}</p>
                </div>
              ))}
            </div>

            <div className="d-flex gap-3 flex-wrap">
              <button className="btn btn-orange">{about.btn1_text}</button>
              <button className="btn btn-light border">{about.btn2_text}</button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
