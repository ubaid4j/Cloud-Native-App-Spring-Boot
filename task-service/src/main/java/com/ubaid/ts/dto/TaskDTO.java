package com.ubaid.ts.dto;

import java.time.Instant;
import java.util.UUID;

public record TaskDTO(
        UUID uuid,
        String title,
        String description,
        String status,
        UUID assigneeUuid,
        UUID createdByUuid,
        Instant createdDate,
        UUID lastModifiedByUuid,
        Instant lastModifiedDate
) {}