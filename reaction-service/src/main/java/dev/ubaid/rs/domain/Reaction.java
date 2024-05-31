package dev.ubaid.rs.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

import java.io.Serial;

@Entity
@Table
public class Reaction extends AbstractAuditingEntity {
    
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
    private String name;
    
    @NotNull
    @Column
    private String description;
    
    @NotNull
    @Column
    private Integer version;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotNull String getUuid() {
        return uuid;
    }

    public void setUuid(@NotNull String uuid) {
        this.uuid = uuid;
    }

    public @NotNull String getName() {
        return name;
    }

    public void setName(@NotNull String name) {
        this.name = name;
    }

    public @NotNull String getDescription() {
        return description;
    }

    public void setDescription(@NotNull String description) {
        this.description = description;
    }

    public @NotNull Integer getVersion() {
        return version;
    }

    public void setVersion(@NotNull Integer version) {
        this.version = version;
    }

    @Override
    public boolean equals(Object o) {
        if (this == 0) {
            return true;
        }
        
        if (!(o instanceof Reaction)) {
            return false;
        }
        
        return getId() != null && getId().equals(((Reaction) o).getId())
    }
    
    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
    
    
    @Override
    public String toString() {
        return "Reaction{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", version=" + version +
                "} " + super.toString();
    }
}
