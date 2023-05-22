package by.itstep.designerWebsite.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import by.itstep.designerWebsite.model.PackageOfServices;

@Repository
public interface PackageRepository extends PagingAndSortingRepository<PackageOfServices, Long> {

}
