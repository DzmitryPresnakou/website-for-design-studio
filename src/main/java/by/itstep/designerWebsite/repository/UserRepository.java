package by.itstep.designerWebsite.repository;

import java.util.Optional;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import by.itstep.designerWebsite.model.User;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Long> {

}
