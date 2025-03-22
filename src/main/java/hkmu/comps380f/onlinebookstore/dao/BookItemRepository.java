package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookItem;
import hkmu.comps380f.onlinebookstore.entity.BookOrder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookItemRepository extends JpaRepository<BookItem, Integer> {
    List<BookItem> findByOrderidIn(List<String> ids);
}
