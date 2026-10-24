import { useEffect, useState } from 'react'

// Returns the id of the section currently under the navbar,
// and keeps the URL hash (#home, #about...) in sync while scrolling.
export default function useScrollSpy(ids) {
  const [active, setActive] = useState('home')
  const key = ids.join(',') // a stable value to use as a dependency

  useEffect(() => {
    if (!key) return

    const onScroll = () => {
      const navH = document.querySelector('.navbar')?.offsetHeight ?? 80
      let current = ids[0]
      for (const id of ids) {
        const el = document.getElementById(id)
        // the last section whose top has reached the area just below the navbar
        if (el && el.getBoundingClientRect().top <= navH + 20) current = id
      }
      setActive(current)
    }

    onScroll()
    window.addEventListener('scroll', onScroll)
    return () => window.removeEventListener('scroll', onScroll)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [key])

  // Update the URL hash without jumping the page
  useEffect(() => {
    if (key) window.history.replaceState(null, '', `#${active}`)
  }, [active, key])

  return active
}