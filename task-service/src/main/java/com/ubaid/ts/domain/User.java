package com.ubaid.ts.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.Objects;

@Entity
@Table(name = "user")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(nullable = false, unique = true)
    private UUID uuid;

    @OneToMany(mappedBy = "assignee")
    private Set<Task> assignedTasks = new HashSet<>();

    @OneToMany(mappedBy = "createdBy")
    private Set<Task> createdTasks = new HashSet<>();

    @OneToMany(mappedBy = "lastModifiedBy")
    private Set<Task> lastModifiedTasks = new HashSet<>();
    
    public User() {
    }

    public User(Long id, UUID uuid) {
        this.id = id;
        this.uuid = uuid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UUID getUuid() {
        return uuid;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }

    public Set<Task> getAssignedTasks() {
        return assignedTasks;
    }

    public Set<Task> getCreatedTasks() {
        return createdTasks;
    }

    public Set<Task> getLastModifiedTasks() {
        return lastModifiedTasks;
    }

    public void addAssignedTask(Task task) {
        assignedTasks.add(task);
        task.setAssignee(this);
    }

    public void removeAssignedTask(Task task) {
        assignedTasks.remove(task);
        task.setAssignee(null);
    }

    public void addCreatedTask(Task task) {
        createdTasks.add(task);
        task.setCreatedBy(this);
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(uuid, user.uuid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uuid);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uuid=" + uuid +
                '}';
    }
}