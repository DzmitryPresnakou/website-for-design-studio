package by.itstep.designerWebsite.repository;

import java.util.List;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import by.itstep.designerWebsite.model.Photo;

@Repository
public interface PhotoRepository extends PagingAndSortingRepository<Photo, Long> {

	List<Photo> findFirst6By();
	List<Photo> findPhotoByfileName(String fileName);

}
