package com.ubaid.ts.service.impl;

import com.ubaid.ts.domain.Status;
import com.ubaid.ts.repository.StatusRepository;
import com.ubaid.ts.service.TaskStatusService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskStatusServiceImpl implements TaskStatusService {

    private final StatusRepository statusRepository;

    public TaskStatusServiceImpl(StatusRepository statusRepository) {
        this.statusRepository = statusRepository;
    }

    @Override
    public List<String> getAllTaskStatus() {
        return statusRepository
                .findAll()
                .stream().map(Status::getName)
                .toList();
    }
}
