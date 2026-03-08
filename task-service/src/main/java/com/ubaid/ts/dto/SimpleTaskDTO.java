package com.ubaid.ts.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record SimpleTaskDTO (
        @NotBlank(message = "Title is required")
        @Size(max = 50, message = "Title cannot exceed 50 characters")
        String title,

        @NotBlank(message = "Description is required")
        @Size(max = 255, message = "Description cannot exceed 255 characters")
        String description,

        @Valid StatusDTO status
) {}
