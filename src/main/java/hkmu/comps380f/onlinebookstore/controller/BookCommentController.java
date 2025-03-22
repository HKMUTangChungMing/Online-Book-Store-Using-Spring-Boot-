package hkmu.comps380f.onlinebookstore.controller;

import hkmu.comps380f.onlinebookstore.dao.BookCommentRepository;
import hkmu.comps380f.onlinebookstore.dao.BookInfoRepository;
import hkmu.comps380f.onlinebookstore.dao.BookUserRepository;
import hkmu.comps380f.onlinebookstore.entity.BookComment;
import hkmu.comps380f.onlinebookstore.entity.BookInfo;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import hkmu.comps380f.onlinebookstore.utils.ApiResponse;
import hkmu.comps380f.onlinebookstore.utils.RequestUtil;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

@Controller
public class BookCommentController {
    @Resource
    BookCommentRepository bookCommentRepository;
    @Resource
    BookInfoRepository bookInfoRepository;
    /**
     * Admin added comment
     * @return
     */
    @RequestMapping("/insertComment")
    public String insertComment(HttpServletRequest request, HttpServletResponse response){

        BookComment bookComment = (BookComment) RequestUtil.getRequestConvertBean(request,BookComment.class);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        bookComment.setCreatetime(sdf.format(new java.util.Date()));
        bookCommentRepository.save(bookComment);
        request.setAttribute("message", "added successfully!");
        return "docomment";
    }
    /**
     * Add a new comment page
     * @return
     */
    @RequestMapping("/docomment")
    public String docomment(HttpServletRequest request, HttpServletResponse response){

        BookComment bookComment = (BookComment) RequestUtil.getRequestConvertBean(request,BookComment.class);
        Optional<BookInfo> optionalBookInfo = bookInfoRepository.findById(bookComment.getBid());
        request.setAttribute("bookInfo", optionalBookInfo.get());
        return "docomment";
    }

    /**
     * delete
     * @return
     */
    @RequestMapping("/delComment")
    public String delComment(HttpServletRequest request, HttpServletResponse response) {

        BookComment bookComment = (BookComment) RequestUtil.getRequestConvertBean(request,BookComment.class);
        bookCommentRepository.deleteById(bookComment.getId());
        return "redirect:comments";
    }

    /**
     * list
     * @return
     */
    @RequestMapping("/comments")
    public String comments(HttpServletRequest request, HttpServletResponse response){

        List<BookComment> list = bookCommentRepository.findAll(Sort.by("id").descending());
        request.setAttribute("comments", list);
        return "comments";
    }

    /**
     * User added comments
     * @return
     */
    @RequestMapping("/insertUserComment")
    @ResponseBody
    public ApiResponse insertUserComment(HttpServletRequest request, HttpServletResponse response){

        BookComment bookComment = (BookComment) RequestUtil.getRequestConvertBean(request,BookComment.class);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        bookComment.setCreatetime(sdf.format(new java.util.Date()));
        bookCommentRepository.save(bookComment);
        return ApiResponse.success();
    }
}
