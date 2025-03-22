package hkmu.comps380f.onlinebookstore.controller;

import hkmu.comps380f.onlinebookstore.dao.BookUserRepository;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import hkmu.comps380f.onlinebookstore.utils.RequestUtil;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class BookUserController {
    @Resource
    BookUserRepository bookUserRepository;
    /**
     * registration page
     * @return
     */
    @RequestMapping("/register")
    public String register(HttpServletRequest request, HttpServletResponse response){
        return "register";
    }
    /**
     * log in page
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response){
        return "login";
    }
    /**
     * sign out
     * @return
     */
    @RequestMapping("/goOut")
    public String goOut(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:index";
    }

    /**
     * Log in
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(HttpServletRequest request, HttpServletResponse response) {

        BookUser bookUser = (BookUser) RequestUtil.getRequestConvertBean(request,BookUser.class);
        Example<BookUser> example = Example.of(bookUser);
        Optional<BookUser> bookUserOptional = bookUserRepository.findOne(example);
        if(bookUserOptional.isPresent()){
            request.getSession().setAttribute("user",bookUserOptional.get());
            return "redirect:index";
        }else{
            request.setAttribute("message", "wrong user name or password!");
            return "login";
        }
    }

    /**
     * register
     * @return
     */
    @RequestMapping("/toRegister")
    public String toRegister(HttpServletRequest request, HttpServletResponse response){

        BookUser bookUser = (BookUser) RequestUtil.getRequestConvertBean(request,BookUser.class);
        //Build object to find if user exists
        BookUser newUser = new BookUser();
        newUser.setUsername(bookUser.getUsername());
        Example<BookUser> example = Example.of(newUser);
        Optional<BookUser> bookUserOptional = bookUserRepository.findOne(example);
        if(bookUserOptional.isPresent()){
            request.setAttribute("message", "Username already exists and cannot be registered");
        }else{
            //registered user
            bookUserRepository.save(bookUser);
            request.setAttribute("message", "Registration is successful, go and log in~");
        }
        return "register";
    }

    /**
     * user list
     * @return
     */
    @RequestMapping("/users")
    public String users(HttpServletRequest request, HttpServletResponse response) {
        List<BookUser> bookUsers = bookUserRepository.findAll(Sort.by("id").descending());
        request.setAttribute("users", bookUsers);
        return "users";
    }

    /**
     * User details
     * @return
     */
    @RequestMapping("/douser")
    public String douser(HttpServletRequest request, HttpServletResponse response) {

        BookUser user = (BookUser) RequestUtil.getRequestConvertBean(request,BookUser.class);
        Optional<BookUser> bookUsers = bookUserRepository.findById(user.getId());
        request.setAttribute("user", bookUsers.get());
        return "douser";
    }

    /**
     * edit
     * @return
     */
    @RequestMapping("/update/{page}")
    public String update(HttpServletRequest request, HttpServletResponse response,@PathVariable("page") String page){

        BookUser user = (BookUser) RequestUtil.getRequestConvertBean(request,BookUser.class);
        bookUserRepository.save(user);
        request.setAttribute("message", "Successful operation");
        return page;
    }

    /**
     * Personal page
     * @return
     */
    @RequestMapping("/userinfo")
    public String userinfo(HttpServletRequest request, HttpServletResponse response){
        return "userinfo";
    }
}
