package com.ubaid.ts.repository;

import com.ubaid.ts.domain.Status;
import com.ubaid.ts.domain.Task;
import com.ubaid.ts.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    Optional<Task> findByUuid(UUID uuid);
    List<Task> findAllByAssigneeAndStatus(User user, Status status);
    List<Task> findAllByStatus(Status status);
    List<Task> findAllByAssignee(User user);
}