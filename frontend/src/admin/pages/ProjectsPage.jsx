import SingleForm from "../SingleForm";
import ListManager from "../ListManager";

const SECTION_FIELDS = [
  { name: "title", label: "Title", type: "text" },
  { name: "subtitle", label: "Subtitle", type: "textarea" },
];

const CATEGORY_FIELDS = [
  { name: "name", label: "Name", type: "text" },
  {
    name: "slug",
    label: "Slug",
    type: "text",
    help: "Lowercase, no spaces, e.g. residential. Used by the filter buttons.",
  },
];

const PROJECT_FIELDS = [
  {
    name: "category",
    label: "Category",
    type: "select",
    optionsResource: "categories", // where the choices come from
    optionLabel: "name", // which field is shown in the list
  },
  { name: "title", label: "Title", type: "text" },
  { name: "description", label: "Description", type: "textarea" },
  { name: "image", label: "Image", type: "image" },
  { name: "order", label: "Order", type: "number" },
];

// The table shows fewer columns than the form
const PROJECT_COLUMNS = [
  { name: "image", label: "Image", type: "image" },
  { name: "title", label: "Title", type: "text" },
  { name: "category", label: "Category", type: "select" },
];

export default function ProjectsPage() {
  return (
    <>
      <h3 className="mb-4">Projects</h3>
      <SingleForm resource="projects-section" fields={SECTION_FIELDS} />
      <ListManager
        resource="categories"
        title="Filter categories"
        fields={CATEGORY_FIELDS}
        columns={CATEGORY_FIELDS}
      />
      <ListManager
        resource="projects"
        title="Projects"
        fields={PROJECT_FIELDS}
        columns={PROJECT_COLUMNS}
      />
    </>
  );
}