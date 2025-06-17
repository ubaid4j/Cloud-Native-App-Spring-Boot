package com.ubaid.ts.web.rest;

import com.ubaid.ts.service.TaskStatusService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/task-statuses")
public class TaskStatusController {
    
    private final TaskStatusService taskStatusService;

    public TaskStatusController(TaskStatusService taskStatusService) {
        this.taskStatusService = taskStatusService;
    }

    @GetMapping
    public ResponseEntity<List<String>> getAllTaskStatus() {
        return ResponseEntity.ok(taskStatusService.getAllTaskStatus());
    }
}
