import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const ABOUT_FIELDS = [
  { name: "small_heading", label: "Small heading", type: "text" },
  { name: "title", label: "Title", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "image_main", label: "Main image", type: "image" },
  { name: "image_secondary", label: "Secondary image (optional)", type: "image" },
  { name: "badge_number", label: "Badge number (e.g. 25+)", type: "text" },
  { name: "badge_label", label: "Badge label", type: "text" },
  { name: "btn1_text", label: "First button text", type: "text" },
  { name: "btn2_text", label: "Second button text", type: "text" },
];

const FEATURE_FIELDS = [
  {
    name: "icon",
    label: "Icon",
    type: "text",
    help: "Bootstrap Icons class, e.g. bi-shield-check (browse them at icons.getbootstrap.com)",
  },
  { name: "title", label: "Title", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "order", label: "Order", type: "number" },
];

export default function AboutPage() {
  return (
    <>
      <h3 className="mb-4">About</h3>
      <SingleForm resource="about" fields={ABOUT_FIELDS} />
      <ListManager
        resource="about-features"
        title="Features"
        fields={FEATURE_FIELDS}
        columns={FEATURE_FIELDS}
        parentResource="about"
        parentField="about"
      />
    </>
  );
}