package com.ubaid.ms.auditservice.controller;

import com.ubaid.ms.auditservice.config.SwaggerConfig;
import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.auditservice.service.AuditService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import org.apache.http.HttpStatus;

import java.security.Principal;

@Api(tags = SwaggerConfig.AUDIT)
@RestController
@RequestMapping("audit-service")
@RequiredArgsConstructor
public class AuditController {

    private final AuditService auditService;

    @ApiOperation(value = "Get Audit log by Id", response = Audit.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "An Audit Log fetched successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are not authorized to get Audit Log")
    })
    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Mono<Audit> findById(@PathVariable Long id) {
        return auditService.findById(id);
    }

    @ApiOperation(value = "Get All Audit Logs by User Id", response = Audit.class, responseContainer = "List")
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "All audit logs of current user fetched successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are unauthorized to get audit logs")
    })
    @GetMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
    public Flux<Audit> findAllByUserId(Principal principal) {
        return auditService
                .findAllByUserUUID(principal);
    }

    @ApiOperation(value = "Get All available Logs", response = Audit.class, responseContainer = "List")
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "All available audit logs fetched successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are unauthorized to get all audit logs")
    })
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public Flux<Audit> findAll() {
        return auditService.findAll();
    }


    @ApiOperation(value = "Save Audit Log", response = Audit.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Audit Log saved successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are unauthorized to save Audit Log")
    })
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Mono<Audit> save(Principal principal, @RequestBody Audit audit) {
        return auditService.save(principal, audit);
    }

    @ApiOperation(value = "Update Audit Log", response = Audit.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Audit Log updated successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are unauthorized to update Audit Log")
    })
    @PutMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Mono<Audit> update(Principal principal, @RequestBody Audit audit) {
        return auditService.update(principal, audit);
    }

    @ApiOperation(value = "Delete Audit Log")
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Audit Log deleted successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are unauthorized to delete Audit Log")
    })
    @DeleteMapping(value = "/{id}")
    public Mono<Void> delete(@PathVariable Long id) {
        return auditService.delete(id);
    }
}
