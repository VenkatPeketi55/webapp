package com.todoapp;

import java.util.ArrayList;
import java.util.List;

public class TodoManager {
    private final List<Todo> todos = new ArrayList<>();

    public TodoManager() {
        // Seed sample data
        todos.add(new Todo("Learn Java Servlets"));
        todos.add(new Todo("Deploy on Tomcat"));
        todos.add(new Todo("Build a web project"));
    }

    public void addTodo(String title) {
        if (title != null && !title.trim().isEmpty()) {
            todos.add(new Todo(title.trim()));
        }
    }

    public void completeTodo(int id) {
        todos.stream()
             .filter(t -> t.getId() == id)
             .findFirst()
             .ifPresent(t -> t.setCompleted(true));
    }

    public void deleteTodo(int id) {
        todos.removeIf(t -> t.getId() == id);
    }

    public List<Todo> getAllTodos() {
        return new ArrayList<>(todos);
    }
}
