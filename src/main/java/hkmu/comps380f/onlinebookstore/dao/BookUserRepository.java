package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface  BookUserRepository extends JpaRepository<BookUser, Integer> {
}
