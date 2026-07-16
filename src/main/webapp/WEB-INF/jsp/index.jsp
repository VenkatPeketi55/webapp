<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Todo App</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            padding: 40px 16px;
        }

        .container {
            width: 100%;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            color: #1a202c;
            font-size: 2rem;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #718096;
            margin-bottom: 28px;
            font-size: 0.9rem;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            margin-bottom: 20px;
        }

        .add-form {
            display: flex;
            gap: 10px;
        }

        .add-form input[type="text"] {
            flex: 1;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.2s;
        }

        .add-form input[type="text"]:focus {
            border-color: #667eea;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 600;
            transition: opacity 0.2s;
        }

        .btn:hover { opacity: 0.85; }

        .btn-add    { background: #667eea; color: white; }
        .btn-done   { background: #48bb78; color: white; padding: 6px 14px; font-size: 0.8rem; }
        .btn-delete { background: #fc8181; color: white; padding: 6px 14px; font-size: 0.8rem; }

        .stats {
            display: flex;
            gap: 12px;
            margin-bottom: 20px;
        }

        .stat-box {
            flex: 1;
            background: white;
            border-radius: 10px;
            padding: 16px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

        .stat-box .num { font-size: 1.8rem; font-weight: 700; color: #667eea; }
        .stat-box .label { font-size: 0.8rem; color: #718096; margin-top: 4px; }

        .todo-list { list-style: none; }

        .todo-item {
            display: flex;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid #f0f4f8;
            gap: 12px;
        }

        .todo-item:last-child { border-bottom: none; }

        .todo-title {
            flex: 1;
            font-size: 1rem;
            color: #2d3748;
        }

        .todo-title.done {
            text-decoration: line-through;
            color: #a0aec0;
        }

        .badge {
            font-size: 0.75rem;
            padding: 3px 10px;
            border-radius: 99px;
            font-weight: 600;
        }

        .badge-pending  { background: #fef3c7; color: #d97706; }
        .badge-done     { background: #d1fae5; color: #065f46; }

        .empty {
            text-align: center;
            color: #a0aec0;
            padding: 30px 0;
            font-size: 1rem;
        }

        .actions { display: flex; gap: 6px; }
    </style>
</head>
<body>
<div class="container">

    <h1> akshara Todo App</h1>
    <p class="subtitle">Built with Java Servlets + JSP • Deployed on Tomcat</p>

    <!-- Stats -->
    <div class="stats">
        <div class="stat-box">
            <div class="num">${todos.size()}</div>
            <div class="label">Total</div>
        </div>
        <div class="stat-box">
            <div class="num">
                <c:set var="pending" value="0"/>
                <c:forEach var="t" items="${todos}">
                    <c:if test="${!t.completed}"><c:set var="pending" value="${pending + 1}"/></c:if>
                </c:forEach>
                ${pending}
            </div>
            <div class="label">Pending</div>
        </div>
        <div class="stat-box">
            <div class="num">${todos.size() - pending}</div>
            <div class="label">Done</div>
        </div>
    </div>

    <!-- Add Todo -->
    <div class="card">
        <form class="add-form" method="post" action="${pageContext.request.contextPath}/todos">
            <input type="hidden" name="action" value="add"/>
            <input type="text" name="title" placeholder="Add a new task..." required/>
            <button type="submit" class="btn btn-add">+ Add</button>
        </form>
    </div>

    <!-- Todo List -->
    <div class="card">
        <c:choose>
            <c:when test="${empty todos}">
                <div class="empty">🎉 No todos yet! Add one above.</div>
            </c:when>
            <c:otherwise>
                <ul class="todo-list">
                    <c:forEach var="todo" items="${todos}">
                        <li class="todo-item">
                            <span class="todo-title ${todo.completed ? 'done' : ''}">${todo.title}</span>
                            <span class="badge ${todo.completed ? 'badge-done' : 'badge-pending'}">
                                ${todo.completed ? 'Done' : 'Pending'}
                            </span>
                            <div class="actions">
                                <c:if test="${!todo.completed}">
                                    <form method="post" action="${pageContext.request.contextPath}/todos">
                                        <input type="hidden" name="action" value="complete"/>
                                        <input type="hidden" name="id" value="${todo.id}"/>
                                        <button type="submit" class="btn btn-done">✓ Done</button>
                                    </form>
                                </c:if>
                                <form method="post" action="${pageContext.request.contextPath}/todos">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="id" value="${todo.id}"/>
                                    <button type="submit" class="btn btn-delete">🗑 Delete</button>
                                </form>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>

</div>
</body>
</html>
