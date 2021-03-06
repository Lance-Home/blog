
package com.mtons.mblog.modules.repository;

import com.mtons.mblog.modules.entity.Links;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author Lance
 */
public interface LinksRepository extends JpaRepository<Links, Long>, JpaSpecificationExecutor<Links> {
}
