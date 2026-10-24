// Services section: title, side image with a call-to-action card, and service cards
export default function Services({ services }) {
  if (!services) return null

  return (
    <section id="services" className="services">
      <div className="container">

        {/* Section title with the small orange line */}
        <div className="section-title text-center">
          <h2>{services.title}</h2>
          <span className="title-line"></span>
          <p>{services.subtitle}</p>
        </div>

        <div className="row g-4">
          {/* Left: side image with the call-to-action card on top of it */}
          <div className="col-lg-4">
            <div
              className="services-side"
              style={{ backgroundImage: `url(${services.side_image})` }}
            >
              <div className="services-cta">
                <h5>{services.cta_title}</h5>
                {/* Not clickable: the task says not to implement unclear buttons */}
                <span className="services-link">
                  {services.cta_link_text} <i className="bi bi-arrow-right"></i>
                </span>
              </div>
            </div>
          </div>

          {/* Right: one card per Service row in the database */}
          <div className="col-lg-8">
            <div className="row g-3">
              {services.services.map((s) => (
                <div className="col-md-6" key={s.title}>
                  <div className="service-card">
                    <span className="feature-icon">
                      <i className={`bi ${s.icon}`}></i>
                    </span>
                    <div>
                      <h6>{s.title}</h6>
                      <p>{s.description}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

      </div>
    </section>
  )
}