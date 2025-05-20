package com.ubaid.ts.service;

import com.ubaid.ts.dto.SimpleTaskDTO;
import com.ubaid.ts.dto.TaskDTO;

import java.util.List;
import java.util.UUID;

public interface TaskService {
    List<TaskDTO> findAll();
    List<TaskDTO> findAllByStatus(String status);
    List<TaskDTO> findByUuid(UUID uuid);
    List<TaskDTO> findByUserUuid(UUID userUuid);
    TaskDTO create(SimpleTaskDTO simpleTaskDTO);
    TaskDTO update(UUID uuid, SimpleTaskDTO simpleTaskDTO);
    void assignTaskToUser(UUID taskUuid, UUID userUuid);
}
