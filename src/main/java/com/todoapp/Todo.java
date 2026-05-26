package com.todoapp;

import java.io.Serializable;

public class Todo implements Serializable {
    private static int idCounter = 1;

    private int id;
    private String title;
    private boolean completed;

    public Todo(String title) {
        this.id = idCounter++;
        this.title = title;
        this.completed = false;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }
}
