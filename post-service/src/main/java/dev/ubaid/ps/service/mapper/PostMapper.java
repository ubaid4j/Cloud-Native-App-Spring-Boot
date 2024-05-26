 package dev.ubaid.ps.service.mapper;

 import dev.ubaid.ps.domain.Post;
 import dev.ubaid.ps.service.dto.PostDTO;
 import org.mapstruct.Mapper;
 import org.mapstruct.Mapping;
 import org.mapstruct.ReportingPolicy;

 @Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface PostMapper extends EntityMapper<PostDTO, Post> {

    @Mapping(target = "postDetail", source = "postDetail")
    @Override
    Post toEntity(PostDTO postDTO);
}
