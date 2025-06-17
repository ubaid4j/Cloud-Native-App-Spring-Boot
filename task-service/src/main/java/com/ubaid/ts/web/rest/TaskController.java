package com.ubaid.ts.web.rest;

import com.ubaid.ts.dto.SimpleTaskDTO;
import com.ubaid.ts.dto.TaskDTO;
import com.ubaid.ts.service.TaskService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    private final Logger log = LoggerFactory.getLogger(TaskController.class);
    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    /**
     * GET /api/tasks/status/{status}: Get all tasks for a user
     *
     * @return the ResponseEntity with status 200 (OK) and the list of tasks,
     */
    @GetMapping
    public ResponseEntity<List<TaskDTO>> getAllTasks(@RequestParam(required = false) Optional<String> status) {
        log.debug("REST request to get all tasks");
        return status
                .map(s -> ResponseEntity.ok(taskService.findAllByStatus(s)))
                .orElseGet(() -> ResponseEntity.ok(taskService.findAll()));
    }
    
    /**
     * GET /api/tasks/{uuid} : Get a task by its UUID
     *
     * @param uuid the UUID of the task to retrieve
     * @return the ResponseEntity with status 200 (OK) and the task, or status 404 (NOT FOUND)
     */
    @GetMapping("/{uuid}")
    public ResponseEntity<List<TaskDTO>> getTaskByUuid(@PathVariable UUID uuid) {
        log.debug("REST request to get task by UUID: {}", uuid);
        List<TaskDTO> tasks = taskService.findByUuid(uuid);
        return tasks.isEmpty() ?
                ResponseEntity.notFound().build() :
                ResponseEntity.ok(tasks);
    }

    /**
     * GET /api/tasks/user/{userUuid} : Get all tasks assigned to a specific user
     *
     * @param userUuid the UUID of the user to find tasks for
     * @return the ResponseEntity with status 200 (OK) and the list of tasks, or status 204 (NO CONTENT) if empty
     */
    @GetMapping("/user/{userUuid}")
    public ResponseEntity<List<TaskDTO>> getTasksByUserUuid(@PathVariable UUID userUuid) {
        log.debug("REST request to get tasks by user UUID: {}", userUuid);
        List<TaskDTO> tasks = taskService.findByUserUuid(userUuid);
        return tasks.isEmpty() ?
                ResponseEntity.noContent().build() :
                ResponseEntity.ok(tasks);
    }

    /**
     * POST /api/tasks : Create a new task
     *
     * @param simpleTaskDTO the task to create
     * @return the ResponseEntity with status 201 (CREATED) and with body the new task
     */
    @PostMapping
    public ResponseEntity<TaskDTO> createTask(@Valid @RequestBody SimpleTaskDTO simpleTaskDTO) {
        log.debug("REST request to create task: {}", simpleTaskDTO);
        TaskDTO result = taskService.create(simpleTaskDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    /**
     * PUT /api/tasks/{uuid} : Update an existing task
     *
     * @param uuid the UUID of the task to update
     * @param simpleTaskDTO the task to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated task
     */
    @PutMapping("/{uuid}")
    public ResponseEntity<TaskDTO> updateTask(
            @PathVariable UUID uuid,
            @Valid @RequestBody SimpleTaskDTO simpleTaskDTO) {
        log.debug("REST request to update task: {}", simpleTaskDTO);
        TaskDTO result = taskService.update(uuid, simpleTaskDTO);
        return ResponseEntity.ok(result);
    }

    /**
     * POST /api/tasks/{taskUuid}/assign/{userUuid} : Assign a task to a user
     *
     * @param taskUuid the UUID of the task to assign
     * @param userUuid the UUID of the user to assign the task to
     * @return the ResponseEntity with status 200 (OK)
     */
    @PostMapping("/{taskUuid}/assign/{userUuid}")
    public ResponseEntity<Void> assignTaskToUser(
            @PathVariable UUID taskUuid,
            @PathVariable UUID userUuid) {
        log.debug("REST request to assign task {} to user {}", taskUuid, userUuid);
        taskService.assignTaskToUser(taskUuid, userUuid);
        return ResponseEntity.ok().build();
    }

    /**
     * POST /api/tasks/{taskUuid}/unassign : Unassign a task from its current user
     *
     * @param taskUuid the UUID of the task to unassign
     * @return the ResponseEntity with status 200 (OK)
     */
    @PostMapping("/{taskUuid}/unassign")
    public ResponseEntity<Void> unassignTask(@PathVariable UUID taskUuid) {
        log.debug("REST request to unassign task {}", taskUuid);
        taskService.assignTaskToUser(taskUuid, null);
        return ResponseEntity.ok().build();
    }
    
    
}