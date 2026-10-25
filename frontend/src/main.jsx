import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter, Navigate, Routes, Route } from "react-router-dom";

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";
import "./index.css"; // must stay after bootstrap

import App from "./App.jsx";
import Login from "./admin/Login.jsx";
import AdminLayout from "./admin/AdminLayout.jsx";
import SectionPlaceholder from "./admin/SectionPlaceholder.jsx";
import HomePage from "./admin/pages/HomePage.jsx";
import { ADMIN_SECTIONS } from "./admin/sections.js";

import AboutPage from "./admin/pages/AboutPage.jsx";
import ServicesPage from "./admin/pages/ServicesPage.jsx";
import TrackRecordPage from "./admin/pages/TrackRecordPage.jsx";
import NavbarPage from "./admin/pages/NavbarPage.jsx";
import ProjectsPage from "./admin/pages/ProjectsPage.jsx";

// Real editor pages; sections not listed here still show the placeholder
const PAGES = {
  home: <HomePage />,
  about: <AboutPage />,
  services: <ServicesPage />,
  "track-record": <TrackRecordPage />,
  navbar: <NavbarPage />,
  projects: <ProjectsPage />,
};

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route path="/admin-panel/login" element={<Login />} />

        {/* Admin pages share the sidebar layout */}
        <Route path="/admin-panel" element={<AdminLayout />}>
          <Route index element={<Navigate to="home" replace />} />
          {ADMIN_SECTIONS.map((s) => (
            <Route
              key={s.path}
              path={s.path}
              element={PAGES[s.path] ?? <SectionPlaceholder title={s.label} />}
            />
          ))}
        </Route>
      </Routes>
    </BrowserRouter>
  </StrictMode>
);