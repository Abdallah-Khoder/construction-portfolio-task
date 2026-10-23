// Home section: all text and the background image come from the database
export default function Hero({ hero }) {
  if (!hero) return null // nothing to show if the admin has not added a hero yet

  // Dark overlay on top of the background image
  const bg = `linear-gradient(rgba(15,36,56,.88), rgba(15,36,56,.88)), url(${hero.background_image})`

  return (
    <section id="home" className="hero" style={{ backgroundImage: bg }}>
      <div className="container">
        <span className="hero-badge">
          <i className="bi bi-building me-2"></i>
          {hero.badge_text}
        </span>

        {/* highlight_word is shown in orange */}
        <h1 className="hero-title">
          {hero.title}{' '}
          <span className="text-orange">{hero.highlight_word}</span>
        </h1>

        <p className="hero-desc">{hero.description}</p>

        <div className="d-flex gap-3 flex-wrap">
          <button className="btn btn-orange">{hero.primary_btn_text}</button>
          {/* Secondary button is optional */}
          {hero.secondary_btn_text && (
            <button className="btn btn-outline-light">
              {hero.secondary_btn_text} <i className="bi bi-arrow-right ms-1"></i>
            </button>
          )}
        </div>
      </div>

      {/* Counters bar: one column per HeroCounter row */}
      <div className="container">
        <div className="counters row text-center text-white">
          {hero.counters.map((c) => (
            <div className="col-6 col-md-3" key={c.label}>
              <div className="counter-number">{c.number}</div>
              <div className="counter-label">{c.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}