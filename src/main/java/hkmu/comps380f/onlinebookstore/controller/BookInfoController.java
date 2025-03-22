package hkmu.comps380f.onlinebookstore.controller;

import hkmu.comps380f.onlinebookstore.dao.BookCommentRepository;
import hkmu.comps380f.onlinebookstore.dao.BookInfoRepository;
import hkmu.comps380f.onlinebookstore.dao.BookUserRepository;
import hkmu.comps380f.onlinebookstore.entity.BookComment;
import hkmu.comps380f.onlinebookstore.entity.BookInfo;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import hkmu.comps380f.onlinebookstore.utils.RequestUtil;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class BookInfoController {
    @Resource
    BookInfoRepository bookInfoRepository;
    @Resource
    BookCommentRepository bookCommentRepository;
    /**
     * Book editing page
     * @return
     */
    @RequestMapping("/dobook")
    public String dobook(HttpServletRequest request, HttpServletResponse response) {

        BookInfo bookInfo = (BookInfo) RequestUtil.getRequestConvertBean(request,BookInfo.class);
        BookInfo nowBookInfo = null;
        if(bookInfo.getId()!=null){
            //When jumping to the modification page, you need to echo it first
            Optional<BookInfo> bookInfoOptional = bookInfoRepository.findById(bookInfo.getId());
            if(bookInfoOptional.isPresent()){
                nowBookInfo = bookInfoOptional.get();
            }
        }else{
            nowBookInfo = new BookInfo();
            //Find any book cover picture
            nowBookInfo.setFmimg("https://s2.loli.net/2024/04/08/56xUbTPeMJLycS9.png");
        }
        request.setAttribute("book",nowBookInfo);
        return "dobook";
    }

    /**
     * book list page
     * @return
     */
    @RequestMapping("/delbook")
    public String delbook(HttpServletRequest request, HttpServletResponse response) {

        BookInfo bookInfo = (BookInfo) RequestUtil.getRequestConvertBean(request,BookInfo.class);
        bookInfoRepository.deleteById(bookInfo.getId());
        return "redirect:books";
    }

    /**
     * book list page
     * @return
     */
    @RequestMapping("/books")
    public String books(HttpServletRequest request, HttpServletResponse response) {
        List<BookInfo> books = bookInfoRepository.findAll(Sort.by("id").descending());
        request.setAttribute("books",books);
        return "books";
    }

    /**
     * Books added
     * @return
     */
    @RequestMapping("/insert")
    public String insert(HttpServletRequest request, HttpServletResponse response) {

        BookInfo bookInfo = (BookInfo) RequestUtil.getRequestConvertBean(request,BookInfo.class);
        bookInfoRepository.save(bookInfo);
        request.setAttribute("message","Successful operation");
        return "dobook";
    }

    /**
     * Book details
     * @return
     */
    @RequestMapping("/detail")
    public String detail(HttpServletRequest request, HttpServletResponse response) {

        BookInfo bookInfo = (BookInfo) RequestUtil.getRequestConvertBean(request,BookInfo.class);
        Optional<BookInfo> nowBook = bookInfoRepository.findById(bookInfo.getId());
        //Book details
        request.setAttribute("book",nowBook.get());
        //comment list
        List<BookComment> comments = bookCommentRepository.findAllByBid(bookInfo.getId(), Sort.by("id").descending());
        request.setAttribute("comments",comments);
        return "detail";
    }

    /**
     * front page
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpServletResponse response){

        BookInfo bookInfo = (BookInfo) RequestUtil.getRequestConvertBean(request,BookInfo.class);
        List<BookInfo> books;
        if(bookInfo.getName()==null){
            books = bookInfoRepository.findAll(Sort.by("id").descending());
        }else{
            request.setAttribute("book",bookInfo);
            books = bookInfoRepository.findByNameLike("%"+bookInfo.getName()+"%", Sort.by("id").descending());
        }
        request.setAttribute("books",books);
        return "index";
    }
}
