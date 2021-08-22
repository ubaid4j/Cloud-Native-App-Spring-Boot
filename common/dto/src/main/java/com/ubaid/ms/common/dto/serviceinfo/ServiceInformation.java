package com.ubaid.ms.common.dto.serviceinfo;

import com.ubaid.ms.common.dto.serviceinfo.Git;
import io.soabase.recordbuilder.core.RecordBuilder;
import java.time.Instant;

@RecordBuilder
public record ServiceInformation(String name,
                                 Git git) {
}
