import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const HERO_FIELDS = [
  { name: "badge_text", label: "Small heading (badge)", type: "text" },
  { name: "title", label: "Main title", type: "text" },
  { name: "highlight_word", label: "Highlighted word (orange)", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "background_image", label: "Background image", type: "image" },
  { name: "primary_btn_text", label: "Primary button text", type: "text" },
  { name: "secondary_btn_text", label: "Secondary button text (optional)", type: "text" },
];

const COUNTER_FIELDS = [
  { name: "number", label: "Number (e.g. 25+)", type: "text" },
  { name: "label", label: "Label", type: "text" },
  { name: "order", label: "Order", type: "number" },
];

export default function HomePage() {
  return (
    <>
      <h3 className="mb-4">Home</h3>
      <SingleForm resource="hero" fields={HERO_FIELDS} />
      <ListManager
        resource="hero-counters"
        title="Counters"
        fields={COUNTER_FIELDS}
        columns={COUNTER_FIELDS}
        parentResource="hero"
        parentField="hero"
      />
    </>
  );
}