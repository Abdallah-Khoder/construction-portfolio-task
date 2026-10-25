import { API_URL } from "../config";

// fetch wrapper for protected endpoints: adds the token and parses the JSON
export async function adminFetch(path, options = {}) {
  const token = localStorage.getItem("adminToken");

  const res = await fetch(`${API_URL}/api/admin/${path}`, {
    ...options,
    headers: { Authorization: `Token ${token}`, ...options.headers },
  });

  // A successful DELETE answers 204 with no body
  const data = res.status === 204 ? null : await res.json();
  if (!res.ok) throw data;
  return data;
}

// Turn an API error like {title: ["This field is required."]} into one line
export function errorText(err) {
  if (err instanceof Error) return "Cannot reach the server";
  if (!err || typeof err !== "object") return "Something went wrong";
  return Object.entries(err)
    .map(([field, msg]) => `${field}: ${[].concat(msg).join(" ")}`)
    .join(" | ");
}

// Build the request body from form values (FormData supports image uploads)
// "extra" adds fixed values, e.g. the parent id of a new list item
export function buildFormData(fields, values, extra = {}) {
  const body = new FormData();

  fields.forEach((f) => {
    const v = values[f.name];
    if (f.type === "image") {
      if (v instanceof File) body.append(f.name, v); // only newly chosen files
    } else if (f.type === "number") {
      if (v !== "" && v != null) body.append(f.name, v); // skip empty numbers
    } else {
      body.append(f.name, v ?? "");
    }
  });

  Object.entries(extra).forEach(([key, value]) => body.append(key, value));
  return body;
}