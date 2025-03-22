package hkmu.comps380f.onlinebookstore.dao;

import hkmu.comps380f.onlinebookstore.entity.BookInfo;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookInfoRepository extends JpaRepository<BookInfo, Integer> {
    List<BookInfo> findByIdIn(List<Integer> ids);
    List<BookInfo> findByNameLike(String name, Sort id);
}
