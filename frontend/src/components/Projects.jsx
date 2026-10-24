import { useEffect, useState } from 'react'

// Projects section: category filter, project cards and a lightbox viewer
export default function Projects({ section, categories, projects }) {
  // "all" means no filter; otherwise it holds a category slug (e.g. "residential")
  const [filter, setFilter] = useState('all')
  // Index (inside the visible list) of the project shown in the lightbox, or null if closed
  const [lightbox, setLightbox] = useState(null)

  // Keep only the projects that match the selected filter
  const visible =
    filter === 'all' ? projects : projects.filter((p) => p.category === filter)

  const close = () => setLightbox(null)
  const prev = () => setLightbox((i) => (i - 1 + visible.length) % visible.length)
  const next = () => setLightbox((i) => (i + 1) % visible.length)

  // Keyboard support while the lightbox is open: Esc closes, arrows navigate
  useEffect(() => {
    if (lightbox === null) return
    const onKey = (e) => {
      if (e.key === 'Escape') close()
      if (e.key === 'ArrowLeft') prev()
      if (e.key === 'ArrowRight') next()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [lightbox, visible.length])

  if (!section) return null

  return (
    <section id="projects" className="projects">
      <div className="container">

        {/* Section title (same style as Services) */}
        <div className="section-title text-center">
          <h2>{section.title}</h2>
          <span className="title-line"></span>
          <p>{section.subtitle}</p>
        </div>

        {/* Filter buttons: "All Projects" + one per category from the database */}
        <div className="filter-bar">
          <button
            className={`filter-btn ${filter === 'all' ? 'active' : ''}`}
            onClick={() => setFilter('all')}
          >
            All Projects
          </button>
          {categories.map((c) => (
            <button
              key={c.slug}
              className={`filter-btn ${filter === c.slug ? 'active' : ''}`}
              onClick={() => setFilter(c.slug)}
            >
              {c.name}
            </button>
          ))}
        </div>

        {/* key={filter} re-creates the grid on every filter change, so the cards animate in */}
        <div className="row g-4" key={filter}>
          {visible.map((p, i) => (
            <div
              className="col-md-6 col-lg-4 project-item"
              key={p.title}
              style={{ animationDelay: `${i * 70}ms` }} // small delay between cards
            >
              <div
                className="project-card"
                style={{ backgroundImage: `url(${p.image})` }}
              >
                <div className="project-info">
                  <span className="project-tag">{p.category_name}</span>
                  <h5>{p.title}</h5>
                  <p>{p.description}</p>
                </div>

                {/* Hover icons: the first one opens the lightbox, the second does nothing */}
                <div className="project-actions">
                  <span onClick={() => setLightbox(i)}>
                    <i className="bi bi-arrows-angle-expand"></i>
                  </span>
                  <span>
                    <i className="bi bi-arrow-right"></i>
                  </span>
                </div>
              </div>
            </div>
          ))}
        </div>

      </div>

      {/* Lightbox: dark overlay with the big image, arrows and a close button */}
      {lightbox !== null && visible[lightbox] && (
        <div className="lightbox" onClick={close}>
          <button className="lb-btn lb-close" onClick={close} aria-label="Close">
            <i className="bi bi-x-lg"></i>
          </button>
          <button
            className="lb-btn lb-prev"
            onClick={(e) => { e.stopPropagation(); prev() }}
            aria-label="Previous"
          >
            <i className="bi bi-chevron-left"></i>
          </button>
          <button
            className="lb-btn lb-next"
            onClick={(e) => { e.stopPropagation(); next() }}
            aria-label="Next"
          >
            <i className="bi bi-chevron-right"></i>
          </button>

          {/* stopPropagation: clicking the image itself must not close the lightbox */}
          <figure className="lb-figure" onClick={(e) => e.stopPropagation()}>
            <img src={visible[lightbox].image} alt={visible[lightbox].title} />
            <figcaption>
              <strong>{visible[lightbox].title}</strong>
              <span>{visible[lightbox].description}</span>
            </figcaption>
          </figure>
        </div>
      )}
    </section>
  )
}