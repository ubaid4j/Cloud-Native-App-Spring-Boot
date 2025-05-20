package com.ubaid.ts.mapper;

import com.ubaid.ts.domain.Task;
import com.ubaid.ts.domain.User;
import com.ubaid.ts.dto.SimpleTaskDTO;
import com.ubaid.ts.dto.TaskDTO;
import com.ubaid.ts.dto.SimpleTaskDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.ReportingPolicy;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

@Mapper(componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface TaskMapper {

    @Mapping(target = "assigneeUuid", source = "assignee.uuid")
    @Mapping(target = "createdByUuid", source = "createdBy.uuid")
    @Mapping(target = "lastModifiedByUuid", source = "lastModifiedBy.uuid")
    TaskDTO toDto(Task task);

    List<TaskDTO> toDto(List<Task> tasks);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "uuid", expression = "java(UUID.randomUUID())")
    @Mapping(target = "createdBy", source = "currentUser")
    @Mapping(target = "createdDate", expression = "java(Instant.now())")
    @Mapping(target = "lastModifiedBy", source = "currentUser")
    @Mapping(target = "lastModifiedDate", expression = "java(Instant.now())")
    Task toEntity(SimpleTaskDTO simpleTaskDTO, User currentUser);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "uuid", ignore = true)
    @Mapping(target = "createdBy", ignore = true)
    @Mapping(target = "createdDate", ignore = true)
    @Mapping(target = "lastModifiedBy", source = "currentUser")
    @Mapping(target = "lastModifiedDate", expression = "java(Instant.now())")
    void updateTaskFromDto(SimpleTaskDTO taskUpdateDTO, @MappingTarget Task task, User currentUser);
}