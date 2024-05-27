package dev.ubaid.ps.service.mapper;

import dev.ubaid.ps.domain.Post;
import dev.ubaid.ps.service.dto.PostDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface PostMapper extends EntityMapper<PostDTO, Post> {
}
