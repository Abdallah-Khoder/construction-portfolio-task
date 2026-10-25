# Construction Portfolio – Intern Web Challenge

A construction company portfolio website where **all content is loaded from a MySQL database** and managed from a custom admin panel, without touching the source code.

## Tech stack
- **Backend:** Django + Django REST Framework
- **Database:** MySQL / MariaDB
- **Frontend:** React (Vite), Bootstrap 5, Bootstrap Icons

## Features
- Sections: Home (hero + counters), About, Services (+ Track Record), Projects
- Navbar links, phone number and button texts are editable from the admin
- Projects category filter with animation and a lightbox viewer
- Scroll spy (active navbar link and URL hash) and a back-to-top button
- **Custom admin panel** (`/admin-panel`) with token login: add, edit and delete the content of every section, including image uploads
- Django admin is also available at `/admin/`
- Automated API tests

## Project structure
```
backend/    Django project (models, REST API, admin API, uploaded images in media/)
frontend/   React application (public site + admin panel)
database/   SQL dump with the demo content
```

## Requirements
- Python 3.12 or newer (developed with 3.14)
- MySQL or MariaDB 10.11 or newer
- Node.js and npm

## How to run

### 1. Database
Import the dump. It creates the `constructify_db` database with all tables and the demo content:
```
mysql -u root -p < database/constructify_db.sql
```
Then open `backend/config/settings.py` and set **your own** MySQL `USER` and `PASSWORD` in `DATABASES`. The file currently contains the author's local values: user `root`, password `1234`, host `127.0.0.1`, port `3306`.

### 2. Backend
```
python -m venv venv
venv\Scripts\activate
pip install -r backend/requirements.txt
cd backend
python manage.py runserver
```
- Public API: http://127.0.0.1:8000/api/content/
- Django admin: http://127.0.0.1:8000/admin/

### 3. Frontend (in a second terminal)
```
cd frontend
npm install
npm run dev
```
- Website: http://localhost:5173
- Admin panel: http://localhost:5173/admin-panel (the backend must be running on port 8000)

## Admin login
- Username: `admin`
- Password: `admin123`

## Tests
```
cd backend
python manage.py test
```
The tests use a temporary database, so your data is not touched.

## Notes
- All displayed text, numbers, icons (Bootstrap Icons class names), button labels and images come from the database.
- Buttons whose behavior is not shown in the reference video are intentionally not functional.
- Uploaded images are stored in `backend/media/` and committed so the demo content displays correctly.