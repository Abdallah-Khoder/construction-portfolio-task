import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const SECTION_FIELDS = [
  { name: "small_heading", label: "Small heading", type: "text" },
  { name: "title", label: "Title", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "link_text", label: "Link text", type: "text" },
];

const STAT_FIELDS = [
  {
    name: "icon",
    label: "Icon",
    type: "text",
    help: "Bootstrap Icons class, e.g. bi-trophy (browse them at icons.getbootstrap.com)",
  },
  { name: "number", label: "Number (e.g. 850+)", type: "text" },
  { name: "label", label: "Label", type: "text" },
  { name: "order", label: "Order", type: "number" },
];

export default function TrackRecordPage() {
  return (
    <>
      <h3 className="mb-4">Track Record</h3>
      <SingleForm resource="track-record" fields={SECTION_FIELDS} />
      <ListManager
        resource="track-record-stats"
        title="Statistics"
        fields={STAT_FIELDS}
        columns={STAT_FIELDS}
        parentResource="track-record"
        parentField="section"
      />
    </>
  );
}