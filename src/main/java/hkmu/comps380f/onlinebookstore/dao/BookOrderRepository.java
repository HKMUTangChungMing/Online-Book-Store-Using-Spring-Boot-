package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookOrder;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookOrderRepository extends JpaRepository<BookOrder, Integer> {
    List<BookOrder> findByUserid(Integer userid, Sort sort);
}
