package com.ubaid.ts.mapper;

import com.ubaid.ts.domain.Status;
import com.ubaid.ts.dto.StatusDTO;
import com.ubaid.ts.repository.StatusRepository;
import jakarta.persistence.EntityNotFoundException;
import org.mapstruct.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper(componentModel = "spring")
public abstract class StatusMapper {
    
    @Autowired
    protected StatusRepository statusRepository;

    public Status toEntity(StatusDTO statusDTO) {
        final String statusName = normalizeStatus(statusDTO == null ? null : statusDTO.name());
        return statusRepository.findByNameIgnoreCase(statusName)
                .orElseThrow(() -> new EntityNotFoundException("Status not found: " + statusName));
    }

    public String toDto(Status status) {
        return status == null ? null : status.getName();
    }

    private String normalizeStatus(String statusName) {
        if (statusName == null) {
            return null;
        }
        String normalized = statusName.trim();
        return normalized.isEmpty() ? null : normalized;
    }
}
