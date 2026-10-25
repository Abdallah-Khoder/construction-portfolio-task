import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const SECTION_FIELDS = [
  { name: "title", label: "Title", type: "text" },
  { name: "subtitle", label: "Subtitle", type: "textarea" },
  { name: "side_image", label: "Side image", type: "image" },
  { name: "cta_title", label: "Card title (on the image)", type: "text" },
  { name: "cta_link_text", label: "Card link text", type: "text" },
];

const SERVICE_FIELDS = [
  {
    name: "icon",
    label: "Icon",
    type: "text",
    help: "Bootstrap Icons class, e.g. bi-house (browse them at icons.getbootstrap.com)",
  },
  { name: "title", label: "Title", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "order", label: "Order", type: "number" },
];

export default function ServicesPage() {
  return (
    <>
      <h3 className="mb-4">Services</h3>
      <SingleForm resource="services-section" fields={SECTION_FIELDS} />
      <ListManager
        resource="services"
        title="Services"
        fields={SERVICE_FIELDS}
        columns={SERVICE_FIELDS}
        parentResource="services-section"
        parentField="section"
      />
    </>
  );
}