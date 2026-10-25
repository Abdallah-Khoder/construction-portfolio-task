import { useEffect, useState } from "react";
import { Navigate, NavLink, Outlet, useNavigate } from "react-router-dom";
import { API_URL } from "../config";
import { ADMIN_SECTIONS } from "./sections";
import "./admin.css";

export default function AdminLayout() {
  const navigate = useNavigate();
  const token = localStorage.getItem("adminToken");
  const [username, setUsername] = useState("");

  // Ask the protected endpoint who we are; a bad token sends us back to login
  useEffect(() => {
    if (!token) return;

    fetch(`${API_URL}/api/admin/ping/`, {
      headers: { Authorization: `Token ${token}` },
    })
      .then((res) => {
        if (!res.ok) throw new Error("Invalid token");
        return res.json();
      })
      .then((data) => setUsername(data.username))
      .catch(() => {
        localStorage.removeItem("adminToken");
        navigate("/admin-panel/login");
      });
  }, [token, navigate]);

  function logout() {
    localStorage.removeItem("adminToken");
    navigate("/admin-panel/login");
  }

  // No token at all -> go to the login page
  if (!token) return <Navigate to="/admin-panel/login" replace />;

  return (
    <div className="d-flex min-vh-100">
      <aside className="admin-sidebar bg-white border-end p-3">
        <h5 className="mb-4">Constructify Admin</h5>

        <div className="list-group">
          {ADMIN_SECTIONS.map((s) => (
            <NavLink
              key={s.path}
              to={`/admin-panel/${s.path}`}
              className={({ isActive }) =>
                "list-group-item list-group-item-action" +
                (isActive ? " active" : "")
              }
            >
              <i className={`bi ${s.icon} me-2`}></i>
              {s.label}
            </NavLink>
          ))}
        </div>

        <a href="/" target="_blank" className="d-block mt-3 small">
          <i className="bi bi-box-arrow-up-right me-1"></i>View website
        </a>

        <div className="mt-4 small text-muted">Logged in as {username || "..."}</div>
        <button className="btn btn-outline-secondary btn-sm mt-2" onClick={logout}>
          Log out
        </button>
      </aside>

      {/* The selected section page is rendered here */}
      <main className="flex-grow-1 bg-light p-4">
        <Outlet />
      </main>
    </div>
  );
}