# ☑️ Todo Web App — Java Servlet + JSP

A simple To-Do web application built with **Java Servlets**, **JSP**, and **JSTL** — deployable on Apache Tomcat.

## 📦 Project Structure

```
todo-webapp/
├── src/main/
│   ├── java/com/todoapp/
│   │   ├── Todo.java          # Model
│   │   ├── TodoManager.java   # Business logic
│   │   └── TodoServlet.java   # HTTP Servlet (GET + POST)
│   └── webapp/
│       ├── index.jsp          # Redirects to /todos
│       └── WEB-INF/
│           ├── web.xml        # Deployment descriptor
│           └── jsp/
│               └── index.jsp  # Main UI (JSTL)
└── pom.xml
```

## 🛠️ Tech Stack

- Java 11
- Maven (WAR packaging)
- Java Servlet API 4.0
- JSP + JSTL
- Apache Tomcat 9/10

---

## 🚀 Build & Deploy on Tomcat

### Prerequisites
- Java 11+
- Maven 3.6+
- Apache Tomcat 9 ([download](https://tomcat.apache.org/download-90.cgi))

### Step 1 — Build WAR file

```bash
mvn clean package
```

This creates: `target/todo-webapp.war`

### Step 2 — Deploy to Tomcat

**Option A — Copy WAR manually:**
```bash
cp target/todo-webapp.war /path/to/tomcat/webapps/
```

**Option B — Tomcat Manager (GUI):**
1. Start Tomcat: `bin/startup.sh` (Linux/Mac) or `bin/startup.bat` (Windows)
2. Open: http://localhost:8080/manager/html
3. Scroll to **"WAR file to deploy"** → Choose file → Select `todo-webapp.war` → Deploy

### Step 3 — Open in browser

```
http://localhost:8080/todo-webapp/todos
```

---

## ✅ Features

- Add new tasks
- Mark tasks as complete
- Delete tasks
- Live stats (Total / Pending / Done)
- Clean responsive UI
