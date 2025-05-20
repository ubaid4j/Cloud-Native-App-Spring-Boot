package com.ubaid.ts.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.UUID;

public record SimpleTaskDTO (
        @NotBlank(message = "Title is required")
        @Size(max = 50, message = "Title cannot exceed 50 characters")
        String title,

        @NotBlank(message = "Description is required")
        @Size(max = 255, message = "Description cannot exceed 255 characters")
        String description,

        @Size(max = 15, message = "Description cannot exceed 15 characters")
        String status
) {}