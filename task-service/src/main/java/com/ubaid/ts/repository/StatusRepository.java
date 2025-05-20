package com.ubaid.ts.repository;

import com.ubaid.ts.domain.Status;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusRepository extends JpaRepository<Status, Long> {
}
