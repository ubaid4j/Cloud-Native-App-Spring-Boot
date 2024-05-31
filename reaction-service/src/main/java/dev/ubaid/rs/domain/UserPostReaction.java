package dev.ubaid.rs.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

import java.io.Serial;

@Entity
@Table
public class UserPostReaction extends AbstractAuditingEntity {
    
    @Serial
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    private Long id;
    
    @NotNull
    @Column
    private String uuid;
    
    @NotNull
    @Column
    private String postUuid;

    @OneToOne
    private Reaction reaction;
}
