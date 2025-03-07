# Laravel Assessment API

This is a **Laravel-based REST API** implementing authentication, CRUD operations, and filtering with **EAV (Entity-Attribute-Value) system**.

## Features
- ✅ **Authentication** using Laravel Passport (`/api/register`, `/api/login`, `/api/logout`).
- ✅ **User Management** (`/api/users` - view, update, delete users).
- ✅ **Projects CRUD** (`/api/projects` - create, update, delete projects).
- ✅ **Timesheets Management** (`/api/timesheets` - track work hours per user and project).
- ✅ **EAV System for Project Attributes** (Dynamic fields like `department`, `start_date`, `end_date`).
- ✅ **Filtering API** (`/api/projects?filters[name]=ProjectA&filters[department]=IT`).

---

## **📌 Installation**
### **1️⃣ Clone the repository**
```sh
git clone https://github.com/yogitasingla93/laravel-backend
cd laravel-backend

2️⃣ Install Dependencies
sh
Copy
Edit
composer install
3️⃣ Set Up Environment Variables
Copy the .env.example file:
sh
Copy
Edit
cp .env.example .env
Update database credentials in .env:
ini
Copy
Edit
DB_DATABASE=astudio_assessment
DB_USERNAME=root
DB_PASSWORD=your_password
📌 Database Setup
1️⃣ Import SQL Dump
Run the following command to import the database:

sh
Copy
Edit
mysql -u root -p astudio_assessment < database_dump.sql
2️⃣ Run Migrations & Seeders
sh
Copy
Edit
php artisan migrate --seed
📌 Running the Project
1️⃣ Generate App Key
sh
Copy
Edit
php artisan key:generate
2️⃣ Install Laravel Passport
sh
Copy
Edit
php artisan passport:install
3️⃣ Start the Server
sh
Copy
Edit
php artisan serve
Now, you can test the APIs using Postman.

📌 API Endpoints
🟢 Authentication
Method	Endpoint	Description
POST	/api/register	Register a new user
POST	/api/login	Log in and get a token
POST	/api/logout	Logout and invalidate token
📌 Example Register Request
URL: http://127.0.0.1:8000/api/register
Headers:

pgsql
Copy
Edit
Content-Type: application/json
Accept: application/json
Body (JSON):

json
Copy
Edit
{
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@example.com",
    "password": "password123",
    "password_confirmation": "password123"
}
Response:

json
Copy
Edit
{
    "user": {
        "id": 1,
        "first_name": "John",
        "last_name": "Doe",
        "email": "johndoe@example.com",
        "created_at": "2025-03-07T12:10:57.000000Z"
    },
    "token": "some_long_access_token_here"
}
🟢 Projects API
Method	Endpoint	Description
GET	/api/projects	List all projects
POST	/api/projects	Create a new project
GET	/api/projects/{id}	Get a project by ID
PUT	/api/projects/{id}	Update a project
DELETE	/api/projects/{id}	Delete a project
📌 Example Create Project Request
URL: http://127.0.0.1:8000/api/projects
Headers:

pgsql
Copy
Edit
Content-Type: application/json
Authorization: Bearer YOUR_ACCESS_TOKEN
Body (JSON):

json
Copy
Edit
{
    "name": "Project X",
    "status": "active"
}
Response:

json
Copy
Edit
{
    "id": 1,
    "name": "Project X",
    "status": "active",
    "created_at": "2025-03-07T12:15:57.000000Z"
}
🟢 Filtering
Method	Endpoint	Description
GET	/api/projects?filters[name]=ProjectA&filters[department]=IT	Filter projects by attributes
📌 Example Request:

sh
Copy
Edit
GET http://127.0.0.1:8000/api/projects?filters[name]=ProjectA&filters[department]=IT
Response Example:

json
Copy
Edit
[
    {
        "id": 1,
        "name": "Project A",
        "department": "IT",
        "status": "active"
    }
]
📌 Test Credentials
You can use these test credentials:

Admin User
makefile
Copy
Edit
Email: admin@example.com
Password: password123