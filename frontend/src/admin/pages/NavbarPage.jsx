import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const SETTINGS_FIELDS = [
  { name: "brand_name", label: "Brand name", type: "text" },
  { name: "phone", label: "Phone number", type: "text" },
  { name: "cta_button_text", label: "Navbar button text", type: "text" },
];

const NAV_FIELDS = [
  { name: "label", label: "Link text", type: "text" },
  {
    name: "anchor",
    label: "Link target",
    type: "text",
    help: "Section id starting with #, e.g. #about",
  },
  { name: "order", label: "Order", type: "number" },
];

export default function NavbarPage() {
  return (
    <>
      <h3 className="mb-4">Navbar & Settings</h3>
      <SingleForm resource="settings" fields={SETTINGS_FIELDS} />
      <ListManager
        resource="nav"
        title="Navbar links"
        fields={NAV_FIELDS}
        columns={NAV_FIELDS}
      />
    </>
  );
}