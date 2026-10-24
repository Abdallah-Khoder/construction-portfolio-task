// "Our Track Record" block: text on the left, statistic cards on the right
export default function TrackRecord({ data }) {
  if (!data) return null

  return (
    <section id="track-record" className="track-record">
      <div className="container">
        <div className="row align-items-center g-5">

          {/* Left: text */}
          <div className="col-lg-5">
            <p className="small-heading">{data.small_heading}</p>
            <h2>{data.title}</h2>
            <p className="track-desc">{data.description}</p>
            {/* Not clickable (unclear button in the reference) */}
            <span className="track-link">
              {data.link_text} <i className="bi bi-arrow-right"></i>
            </span>
          </div>

          {/* Right: one card per TrackRecordStat row */}
          <div className="col-lg-7">
            <div className="row g-3">
              {data.stats.map((s) => (
                <div className="col-sm-6" key={s.label}>
                  <div className="stat-card">
                    <span className="feature-icon">
                      <i className={`bi ${s.icon}`}></i>
                    </span>
                    <div>
                      <div className="stat-number">{s.number}</div>
                      <div className="stat-label">{s.label}</div>
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