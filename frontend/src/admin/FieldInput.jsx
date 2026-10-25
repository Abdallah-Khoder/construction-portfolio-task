import { useMemo } from "react";

// One input for a field definition:
// { name, label, type: text | number | textarea | image | select, help? }
// For images, "value" is either the saved URL or a newly chosen File
// For selects, "options" is a list of { value, label }
export default function FieldInput({ field, value, onChange, options }) {
  // A chosen File can be previewed locally; a saved image is already a URL
  const preview = useMemo(
    () => (value instanceof File ? URL.createObjectURL(value) : value),
    [value]
  );

  return (
    <div className="mb-3">
      <label className="form-label fw-semibold">{field.label}</label>

      {field.type === "textarea" && (
        <textarea
          className="form-control"
          rows={4}
          value={value ?? ""}
          onChange={(e) => onChange(e.target.value)}
        />
      )}

      {field.type === "image" && (
        <>
          {preview && (
            <img
              src={preview}
              alt=""
              className="d-block mb-2 rounded"
              style={{ maxHeight: 120 }}
            />
          )}
          <input
            type="file"
            accept="image/*"
            className="form-control"
            onChange={(e) => onChange(e.target.files[0])}
          />
        </>
      )}

      {field.type === "select" && (
        <select
          className="form-select"
          value={value ?? ""}
          onChange={(e) => onChange(e.target.value)}
        >
          <option value="">— choose —</option>
          {(options || []).map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </select>
      )}

      {(field.type === "text" || field.type === "number") && (
        <input
          type={field.type}
          className="form-control"
          value={value ?? ""}
          onChange={(e) => onChange(e.target.value)}
        />
      )}

      {field.help && <div className="form-text">{field.help}</div>}
    </div>
  );
}