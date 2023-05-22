package by.itstep.designerWebsite.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import by.itstep.designerWebsite.model.PackageOfServices;
import by.itstep.designerWebsite.model.Stage;

@Repository
public interface StageRepository extends PagingAndSortingRepository<Stage, Long> {

}
