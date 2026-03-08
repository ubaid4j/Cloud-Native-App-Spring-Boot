package com.ubaid.ts.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record StatusDTO(
        @NotBlank(message = "Status name is required")
        @Size(max = 15, message = "Status cannot exceed 15 characters")
        String name
) {
}
