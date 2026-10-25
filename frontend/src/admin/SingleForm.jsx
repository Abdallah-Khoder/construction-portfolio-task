import { useEffect, useState } from "react";
import { adminFetch, buildFormData, errorText } from "./api";
import FieldInput from "./FieldInput";

// Edits a section that has exactly one row (hero, about, ...)
export default function SingleForm({ resource, fields }) {
  const [record, setRecord] = useState(null); // the row loaded from the API
  const [values, setValues] = useState({}); // current values of all inputs
  const [status, setStatus] = useState(null); // { type, text } message
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  // Load the single row when the page opens
  useEffect(() => {
    adminFetch(`${resource}/`)
      .then((rows) => {
        const row = rows[0] || null;
        setRecord(row);
        setValues(row || {});
      })
      .catch((err) => setStatus({ type: "danger", text: errorText(err) }))
      .finally(() => setLoading(false));
  }, [resource]);

  async function handleSubmit(e) {
    e.preventDefault();
    setStatus(null);
    setSaving(true);

    try {
      // Row exists -> update it (PATCH), otherwise create it (POST)
      const saved = await adminFetch(
        record ? `${resource}/${record.id}/` : `${resource}/`,
        { method: record ? "PATCH" : "POST", body: buildFormData(fields, values) }
      );
      setRecord(saved);
      setValues(saved);
      setStatus({ type: "success", text: "Saved successfully" });
      setTimeout(() => setStatus(null), 3000); // hide the message after 3s
    } catch (err) {
      setStatus({ type: "danger", text: errorText(err) });
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <p>Loading...</p>;

  return (
    <form onSubmit={handleSubmit} className="card p-4" style={{ maxWidth: 760 }}>
      {fields.map((f) => (
        <FieldInput
          key={f.name}
          field={f}
          value={values[f.name]}
          onChange={(v) => setValues({ ...values, [f.name]: v })}
        />
      ))}

      {/* Button and its feedback message stay together at the bottom */}
      <div className="d-flex align-items-center flex-wrap gap-3">
        <button className="btn btn-orange" disabled={saving}>
          {saving ? "Saving..." : "Save changes"}
        </button>

        {status && (
          <span className={`text-${status.type} fw-semibold`}>
            <i
              className={`bi ${
                status.type === "success" ? "bi-check-circle" : "bi-exclamation-circle"
              } me-1`}
            ></i>
            {status.text}
          </span>
        )}
      </div>
    </form>
  );
}