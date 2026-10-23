import { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import Hero from './components/Hero'

const API = 'http://127.0.0.1:8000' // Django backend URL

export default function App() {
  const [data, setData] = useState(null) // all website content

  // Fetch the content once, when the page loads
  useEffect(() => {
    fetch(`${API}/api/content/`)
      .then((r) => r.json())
      .then(setData)
  }, [])

  if (!data) return <p className="p-5">Loading...</p>

  return (
    <>
      <Navbar site={data.settings} nav={data.nav} />
      <Hero hero={data.hero} />
    </>
  )
}