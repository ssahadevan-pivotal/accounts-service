package org.example.accounts.repo;

import org.example.accounts.model.Account;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

@RepositoryRestResource(collectionResourceRel = "accounts", path = "accounts")
public interface AccountRepository extends PagingAndSortingRepository<Account, Long> {
	
	Page<Account> findAll(Pageable pageable);

    @RestResource(exported = false)
    Account findById(Long id);

    @RestResource(path = "name", rel = "name")
    Page<Account> findByNameIgnoreCase(@Param("q") String name, Pageable pageable);

    @RestResource(path = "nameContains", rel = "nameContains")
    Page<Account> findByNameContainsIgnoreCase(@Param("q") String name, Pageable pageable);

}
