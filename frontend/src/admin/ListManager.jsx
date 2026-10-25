import { useEffect, useState } from "react";
import { adminFetch, buildFormData, errorText } from "./api";
import FieldInput from "./FieldInput";

// Table with Add / Edit / Delete for a repeating list (counters, services, ...)
//   fields:  inputs of the add/edit form
//   columns: what the table shows: { name, label, type? }
//   parentResource / parentField: link new items to their section row (e.g. "hero")
export default function ListManager({
  resource,
  title,
  fields,
  columns,
  parentResource,
  parentField,
}) {
  const [rows, setRows] = useState([]);
  const [parentId, setParentId] = useState(null);
  const [options, setOptions] = useState({}); // choices for select fields
  const [editing, setEditing] = useState(null); // null = form closed
  const [message, setMessage] = useState(null); // result of delete / save
  const [formError, setFormError] = useState(""); // error shown inside the form
  const [saving, setSaving] = useState(false);
  const [reload, setReload] = useState(0); // change it to reload the table

  // Load the list (again whenever "reload" changes)
  useEffect(() => {
    adminFetch(`${resource}/`)
      .then(setRows)
      .catch((err) => setMessage({ type: "danger", text: errorText(err) }));
  }, [resource, reload]);

  // Load the parent row so new items can be linked to it
  useEffect(() => {
    if (!parentResource) return;
    adminFetch(`${parentResource}/`)
      .then((list) => setParentId(list[0]?.id ?? null))
      .catch((err) => setMessage({ type: "danger", text: errorText(err) }));
  }, [parentResource]);

  // Load the choices of every select field (e.g. project categories)
  useEffect(() => {
    fields
      .filter((f) => f.type === "select")
      .forEach((f) => {
        adminFetch(`${f.optionsResource}/`).then((list) =>
          setOptions((prev) => ({
            ...prev,
            [f.name]: list.map((item) => ({
              value: item.id,
              label: item[f.optionLabel],
            })),
          })),
        );
      });
  }, [fields]);

  function flash(type, text) {
    setMessage({ type, text });
    setTimeout(() => setMessage(null), 3000);
  }

  function startAdd() {
    setFormError("");
    setEditing({ order: rows.length + 1 }); // new item goes to the end
  }

  function startEdit(row) {
    setFormError("");
    setEditing({ ...row });
  }

  async function handleSave(e) {
    e.preventDefault();
    setFormError("");
    setSaving(true);

    const isNew = !editing.id;
    const extra = isNew && parentField ? { [parentField]: parentId } : {};

    try {
      await adminFetch(isNew ? `${resource}/` : `${resource}/${editing.id}/`, {
        method: isNew ? "POST" : "PATCH",
        body: buildFormData(fields, editing, extra),
      });
      setEditing(null);
      setReload((n) => n + 1);
      flash("success", "Saved");
    } catch (err) {
      setFormError(errorText(err));
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete(row) {
    if (!window.confirm("Delete this item?")) return;

    try {
      await adminFetch(`${resource}/${row.id}/`, { method: "DELETE" });
      setReload((n) => n + 1);
      flash("success", "Deleted");
    } catch (err) {
      flash("danger", errorText(err));
    }
  }

  // What a table cell shows: thumbnail for images, name for selects, text otherwise
  function renderCell(column, row) {
    const value = row[column.name];

    if (column.type === "image") {
      return (
        <img src={value} alt="" className="rounded" style={{ height: 40 }} />
      );
    }
    if (column.type === "select") {
      return (
        options[column.name]?.find((o) => o.value === value)?.label ?? value
      );
    }
    return value;
  }

  return (
    <div className="card p-4 mt-4" style={{ maxWidth: 760 }}>
      {/* Header: title, last message, Add button */}
      <div className="d-flex align-items-center justify-content-between mb-3">
        <h5 className="mb-0">{title}</h5>
        <div className="d-flex align-items-center gap-3">
          {message && (
            <span className={`small text-${message.type} fw-semibold`}>
              {message.text}
            </span>
          )}
          <button
            className="btn btn-sm btn-orange"
            onClick={startAdd}
            disabled={!!editing || (parentField && !parentId)}
          >
            <i className="bi bi-plus-lg me-1"></i>Add
          </button>
        </div>
      </div>

      {/* Add / Edit form */}
      {editing && (
        <form
          onSubmit={handleSave}
          className="border rounded p-3 mb-3 bg-light"
        >
          <h6 className="mb-3">{editing.id ? "Edit item" : "New item"}</h6>

          {fields.map((f) => (
            <FieldInput
              key={f.name}
              field={f}
              value={editing[f.name]}
              options={options[f.name]}
              onChange={(v) => setEditing({ ...editing, [f.name]: v })}
            />
          ))}

          <div className="d-flex align-items-center flex-wrap gap-3">
            <button className="btn btn-orange btn-sm" disabled={saving}>
              {saving ? "Saving..." : "Save"}
            </button>
            <button
              type="button"
              className="btn btn-outline-secondary btn-sm"
              onClick={() => setEditing(null)}
            >
              Cancel
            </button>
            {formError && (
              <span className="small text-danger fw-semibold">{formError}</span>
            )}
          </div>
        </form>
      )}

      {/* The list (table-responsive keeps it inside the card) */}
      <div className="table-responsive">
        <table className="table align-middle mb-0">
          <thead>
            <tr>
              {columns.map((c) => (
                <th key={c.name}>{c.label}</th>
              ))}
              <th></th>
            </tr>
          </thead>
          <tbody>
            {rows.map((row) => (
              <tr key={row.id}>
                {columns.map((c) => (
                  <td
                    key={c.name}
                    className="text-truncate"
                    style={{ maxWidth: 200 }}
                  >
                    {renderCell(c, row)}
                  </td>
                ))}
                <td className="text-end text-nowrap">
                  <button
                    className="btn btn-sm btn-outline-secondary me-2"
                    onClick={() => startEdit(row)}
                  >
                    <i className="bi bi-pencil"></i>
                  </button>
                  <button
                    className="btn btn-sm btn-outline-danger"
                    onClick={() => handleDelete(row)}
                  >
                    <i className="bi bi-trash"></i>
                  </button>
                </td>
              </tr>
            ))}

            {rows.length === 0 && (
              <tr>
                <td colSpan={columns.length + 1} className="text-muted">
                  No items yet
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
