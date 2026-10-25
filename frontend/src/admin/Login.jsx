import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { API_URL } from "../config";

export default function Login() {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault(); // stop the browser from reloading the page
    setError("");
    setLoading(true);

    try {
      const res = await fetch(`${API_URL}/api/admin/login/`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
      });
      const data = await res.json();

      if (!res.ok) {
        setError(data.detail || "Login failed");
        return;
      }

      // Keep the token so the next requests can prove who we are
      localStorage.setItem("adminToken", data.token);
      navigate("/admin-panel");
    } catch {
      setError("Cannot reach the server");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="min-vh-100 d-flex align-items-center justify-content-center bg-light">
      <form
        onSubmit={handleSubmit}
        className="card shadow-sm p-4"
        style={{ width: 360 }}
      >
        <h4 className="mb-3 text-center">Admin Login</h4>

        {error && <div className="alert alert-danger py-2">{error}</div>}

        <label className="form-label">Username</label>
        <input
          className="form-control mb-3"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          required
        />

        <label className="form-label">Password</label>
        <input
          type="password"
          className="form-control mb-4"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />

        <button className="btn btn-orange" disabled={loading}>
          {loading ? "Signing in..." : "Sign in"}
        </button>
      </form>
    </div>
  );
}