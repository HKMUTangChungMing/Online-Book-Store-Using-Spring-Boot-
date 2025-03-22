package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookCart;
import hkmu.comps380f.onlinebookstore.entity.BookComment;
import hkmu.comps380f.onlinebookstore.entity.BookInfo;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookCartRepository extends JpaRepository<BookCart, Integer> {
    List<BookCart> findAllByUsid(Integer usid, Sort sort);
    BookCart findByUsidAndBookid(Integer usid, Integer bookid);
}
