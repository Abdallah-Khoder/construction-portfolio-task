import { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import Hero from './components/Hero'
import About from './components/About'
import ScrollTopButton from './components/ScrollTopButton'
import useScrollSpy from './hooks/useScrollSpy'

const API = 'http://127.0.0.1:8000' // Django backend URL

export default function App() {
  const [data, setData] = useState(null) // all website content

  // Fetch the content once, when the page loads
  useEffect(() => {
    fetch(`${API}/api/content/`)
      .then((r) => r.json())
      .then(setData)
  }, [])

  // Section ids taken from the nav links ("#about" -> "about")
  const ids = data ? data.nav.map((n) => n.anchor.replace('#', '')) : []
  const active = useScrollSpy(ids)

  if (!data) return <p className="p-5">Loading...</p>

  return (
    <>
      <Navbar site={data.settings} nav={data.nav} active={active} />
      <Hero hero={data.hero} />
      <About about={data.about} />
      <ScrollTopButton />
    </>
  )
}