package dev.ubaid.ps.service.mapper;

public interface EntityMapper <D, E> {
    E toEntity(D d);
    D toDTO(E e);
}
