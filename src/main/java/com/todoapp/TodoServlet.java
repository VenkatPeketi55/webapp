package com.todoapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/todos")
public class TodoServlet extends HttpServlet {

    private TodoManager todoManager;

    @Override
    public void init() {
        // Store TodoManager in application scope (shared across requests)
        todoManager = new TodoManager();
        getServletContext().setAttribute("todoManager", todoManager);
    }

    // GET /todos → show all todos
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("todos", todoManager.getAllTodos());
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    // POST /todos → add, complete, or delete a todo
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String title = req.getParameter("title");
            todoManager.addTodo(title);

        } else if ("complete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            todoManager.completeTodo(id);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            todoManager.deleteTodo(id);
        }

        // Redirect back to GET (PRG pattern prevents resubmit on refresh)
        resp.sendRedirect(req.getContextPath() + "/todos");
    }
}
