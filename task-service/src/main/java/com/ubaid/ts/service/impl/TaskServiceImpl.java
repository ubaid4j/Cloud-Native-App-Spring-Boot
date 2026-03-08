package com.ubaid.ts.service.impl;

import com.ubaid.ts.domain.Status;
import com.ubaid.ts.domain.Task;
import com.ubaid.ts.domain.User;
import com.ubaid.ts.dto.SimpleTaskDTO;
import com.ubaid.ts.dto.TaskDTO;
import com.ubaid.ts.mapper.TaskMapper;
import com.ubaid.ts.repository.StatusRepository;
import com.ubaid.ts.repository.TaskRepository;
import com.ubaid.ts.repository.UserRepository;
import com.ubaid.ts.service.TaskService;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class TaskServiceImpl implements TaskService {
    private final TaskRepository taskRepository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final TaskMapper taskMapper;

    public TaskServiceImpl(TaskRepository taskRepository, UserRepository userRepository, StatusRepository statusRepository, TaskMapper taskMapper) {
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
        this.taskMapper = taskMapper;
    }
    
    @Override
    public List<TaskDTO> findAll() {
        User user = getCurrentUser();
        return findByUserUuid(user.getUuid());
    }

    @Override
    public List<TaskDTO> findAllByStatus(String status) {
        Status probe = new Status();
        probe.setName(status);
        
        Status _status = statusRepository.findOne(Example.of(probe))
                .orElseThrow(EntityNotFoundException::new);

        User user = getCurrentUser();
        User _user = userRepository.findByUuid(user.getUuid())
                .orElseThrow(EntityNotFoundException::new);
        
        List<Task> tasks = taskRepository.findAllByAssigneeAndStatus(_user, _status);
        return tasks.stream()
                .map(taskMapper::toDto)
                .toList();
    }

    @Override
    public List<TaskDTO> findByUuid(UUID uuid) {
        return taskRepository.findByUuid(uuid)
                .map(task -> List.of(taskMapper.toDto(task)))
                .orElse(Collections.emptyList());
    }

    @Override
    public List<TaskDTO> findByUserUuid(UUID userUuid) {
        User user = userRepository.findByUuid(userUuid)
                .orElseThrow(EntityNotFoundException::new);
        
        return taskRepository.findAllByAssignee(user)
                .stream().map(taskMapper::toDto)
                .toList();
    }

    @Override
    public TaskDTO create(SimpleTaskDTO simpleTaskDTO) {
        Task task = taskMapper.toEntity(simpleTaskDTO, getCurrentUser());
        Task savedTask = taskRepository.save(task);
        return taskMapper.toDto(savedTask);
    }

    @Override
    public TaskDTO update(UUID uuid, SimpleTaskDTO simpleTaskDTO) {
        Task task = getTaskByUuid(uuid);
        taskMapper.updateTaskFromDto(simpleTaskDTO, task, getCurrentUser());
        Task updatedTask = taskRepository.save(task);
        return taskMapper.toDto(updatedTask);
    }

    @Override
    public void assignTaskToUser(UUID taskUuid, UUID userUuid) {
        Task task = getTaskByUuid(taskUuid);
        User user = getUserByUuid(userUuid);
        task.setAssignee(user);
        taskRepository.save(task);
    }

    private Task getTaskByUuid(UUID uuid) {
        return taskRepository.findByUuid(uuid)
                .orElseThrow(() -> new EntityNotFoundException("Task not found with UUID: " + uuid));
    }

    private User getUserByUuid(UUID uuid) {
        return userRepository.findByUuid(uuid)
                .orElseThrow(() -> new EntityNotFoundException("User not found with UUID: " + uuid));
    }

    private User getCurrentUser() {
        return userRepository.findAll()
                .stream()
                .findFirst()
                .orElseThrow(() -> new EntityNotFoundException("No users found in the system"));
    }
}
