import { useEffect, useState } from 'react'

// Returns the id of the section currently under the navbar,
// and keeps the URL hash (#home, #about...) in sync while scrolling.
export default function useScrollSpy(ids) {
  const [active, setActive] = useState('home')
  const key = ids.join(',') // a stable value to use as a dependency

  useEffect(() => {
    if (!key) return

    const onScroll = () => {
      // "Reading line": a section becomes active when its top passes
      // 40% of the screen height (not only when it reaches the navbar)
      const line = window.innerHeight * 0.25
      let current = null
      let best = -Infinity
      for (const id of ids) {
        const el = document.getElementById(id)
        if (!el) continue
        const top = el.getBoundingClientRect().top
        // keep the section that is closest to the navbar (and already passed it)
        if (top <= line && top > best) {
          best = top
          current = id
        }
      }
      setActive(current ?? ids[0])
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