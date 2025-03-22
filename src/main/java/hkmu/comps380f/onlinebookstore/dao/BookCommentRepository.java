package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookComment;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface BookCommentRepository extends JpaRepository<BookComment, Integer> {
    List<BookComment> findAllByBid(Integer bid, Sort sort);
}
