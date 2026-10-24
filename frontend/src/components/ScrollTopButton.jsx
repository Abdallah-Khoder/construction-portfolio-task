import { useEffect, useState } from 'react'

// Orange arrow button: appears after scrolling down, and goes back to the top on click
export default function ScrollTopButton() {
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    // Show the button only after scrolling more than 100px
    const onScroll = () => setVisible(window.scrollY > 100)
    window.addEventListener('scroll', onScroll)
    return () => window.removeEventListener('scroll', onScroll) // cleanup
  }, [])

  const goTop = () => window.scrollTo({ top: 0, behavior: 'smooth' })

  return (
    <button
      className={`scroll-top ${visible ? 'show' : ''}`}
      onClick={goTop}
      aria-label="Back to top"
    >
      <i className="bi bi-arrow-up"></i>
    </button>
  )
}