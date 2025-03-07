# 🚀 Laravel Assessment API

This is a **Laravel-based REST API** implementing authentication, CRUD operations, and filtering with an **EAV (Entity-Attribute-Value) system**.

---

## 🌟 Features

| Feature                         | Description |
|---------------------------------|-------------|
| ✅ **Authentication**           | Laravel Passport (`/api/register`, `/api/login`, `/api/logout`) |
| ✅ **User Management**          | CRUD operations on users (`/api/users`) |
| ✅ **Projects CRUD**            | Manage projects (`/api/projects`) |
| ✅ **Timesheets Management**    | Track work hours (`/api/timesheets`) |
| ✅ **EAV System**               | Dynamic project attributes (`department`, `start_date`, `end_date`) |
| ✅ **Filtering API**            | Example: `/api/projects?filters[name]=ProjectA&filters[department]=IT` |

---

## 📌 Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yogitasingla93/laravel-backend
cd laravel-backend
```

### 2️⃣ Install Dependencies
```bash
composer install
```

Copy the environment file and update credentials:
```bash
cp .env.example .env
```

Set up database credentials inside `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=astudio-assessment
DB_USERNAME=root
DB_PASSWORD=yourpassword
```

Generate the application key:
```bash
php artisan key:generate
```

### 3️⃣ Database Setup
```bash
php artisan migrate --seed
```
This will create all necessary tables and insert initial data, including an admin user.

(Optional) Dump database structure:
```bash
mysqldump -u root -p astudio-assessment > database_dump.sql
```

### 4️⃣ Authentication Setup
Install Passport:
```bash
php artisan passport:install --force
```
This generates encryption keys and personal access tokens for API authentication.

Link storage for uploaded files (if required):
```bash
php artisan storage:link
```

### 5️⃣ Running the Project
Start the Laravel development server:
```bash
php artisan serve
```
The application should be accessible at **http://127.0.0.1:8000**

---

## 🌍 API Endpoints

### 🔐 Authentication
| Method | Endpoint          | Description |
|--------|------------------|-------------|
| POST   | `/api/register`  | Register a new user |
| POST   | `/api/login`     | Login and obtain access token |
| POST   | `/api/logout`    | Logout (requires Authorization Header) |

### 👤 User Management
| Method | Endpoint           | Description |
|--------|-------------------|-------------|
| GET    | `/api/users`       | Get all users |
| GET    | `/api/users/{id}`  | Get user by ID |
| PUT    | `/api/users/{id}`  | Update user |
| DELETE | `/api/users/{id}`  | Delete user |

### 📁 Project Management
| Method | Endpoint             | Description |
|--------|---------------------|-------------|
| GET    | `/api/projects`      | Get all projects |
| POST   | `/api/projects`      | Create a project |
| GET    | `/api/projects/{id}` | Get project by ID |
| PUT    | `/api/projects/{id}` | Update project |
| DELETE | `/api/projects/{id}` | Delete project |
| GET    | `/api/projects?filters[name]=ProjectA&filters[department]=IT` | Filter projects |

### ⏳ Timesheets
| Method | Endpoint                | Description |
|--------|------------------------|-------------|
| GET    | `/api/timesheets`       | Get all timesheets |
| POST   | `/api/timesheets`       | Create a timesheet |
| GET    | `/api/timesheets/{id}`  | Get timesheet by ID |
| PUT    | `/api/timesheets/{id}`  | Update timesheet |
| DELETE | `/api/timesheets/{id}`  | Delete timesheet |

### 🔧 Dynamic Attributes (EAV System)
| Method | Endpoint                              | Description |
|--------|--------------------------------------|-------------|
| GET    | `/api/attributes`                    | Get all attributes |
| POST   | `/api/attributes`                    | Create a new attribute |
| POST   | `/api/projects/{project_id}/attributes` | Assign attributes to project |
| GET    | `/api/projects/{project_id}/attributes` | Retrieve project attributes |

---

## 🛡 Headers for API Requests
Include the following headers for authenticated API requests:
```json
{
  "Accept": "application/json",
  "Authorization": "Bearer YOUR_ACCESS_TOKEN"
}
```

---

## ⚠️ Error Handling & Validation
All API requests return structured JSON responses. Laravel’s built-in validation ensures required fields are provided.

**Example error response:**
```json
{
  "message": "The name field is required.",
  "errors": {
    "name": ["The name field is required."]
  }
}
```

---

## 🎯 Coding Standards
This project follows **PSR-4 Autoloading** and **PSR-2 Coding Standards**.
To automatically format the code, run:
```bash
./vendor/bin/php-cs-fixer fix --rules=@PSR2
```

---

## 🚀 Deployment Notes
Ensure `APP_ENV=production` in `.env` before deploying.

Use database migrations when updating schema:
```bash
php artisan migrate --force
```

Run Laravel Optimization Commands:
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

---

## 🤝 Contribution Guidelines
- Fork the repository and create a new branch.
- Follow PSR-2 standards.
- Run tests before submitting a pull request.

---

## 📞 Contact
For issues or contributions, open a GitHub issue or contact the repository owner.

---

## 📜 License
This project is licensed under the **MIT License**.
