package hkmu.comps380f.onlinebookstore.controller;

import hkmu.comps380f.onlinebookstore.dao.BookCartRepository;
import hkmu.comps380f.onlinebookstore.dao.BookInfoRepository;
import hkmu.comps380f.onlinebookstore.dao.BookUserRepository;
import hkmu.comps380f.onlinebookstore.entity.BookCart;
import hkmu.comps380f.onlinebookstore.entity.BookInfo;
import hkmu.comps380f.onlinebookstore.entity.BookUser;
import hkmu.comps380f.onlinebookstore.utils.ApiResponse;
import hkmu.comps380f.onlinebookstore.utils.BookInfoCart;
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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class BookCartController {
    @Resource
    BookCartRepository bookCartRepository;
    @Resource
    BookInfoRepository bookInfoRepository;
    /**
     * Shopping cart page
     * @return
     */
    @RequestMapping("/shopcart")
    public String shopcart(HttpServletRequest request, HttpServletResponse response){
        BookUser user = (BookUser) request.getSession().getAttribute("user");
        //User shopping cart
        List<BookCart> bookCarts = bookCartRepository.findAllByUsid(user.getId(),Sort.by(Sort.Direction.DESC,"id"));
        //Total prices
        double sum = 0;
        //Total quantity
        int total = 0;
        if(bookCarts.size()>0){
            List<Integer> ids = bookCarts.stream().map(BookCart::getBookid).toList();
            //User shopping cart books
            List<BookInfo> bookInfos = bookInfoRepository.findByIdIn(ids);
            List<BookInfoCart> bookInfoCarts = new ArrayList<>();
            for (BookCart cart : bookCarts) {
                for (BookInfo bookInfo : bookInfos) {
                    if (cart.getBookid().equals(bookInfo.getId())) {
                        BookInfoCart bookInfoCart = new BookInfoCart();
                        bookInfoCart.setId(cart.getId());
                        bookInfoCart.setBookid(cart.getBookid());
                        bookInfoCart.setNum(cart.getNum());
                        bookInfoCart.setPertotal(cart.getPertotal());
                        bookInfoCart.setUsid(cart.getUsid());
                        bookInfoCart.setName(bookInfo.getName());
                        bookInfoCart.setPrice(bookInfo.getPrice());
                        bookInfoCart.setFmimg(bookInfo.getFmimg());
                        bookInfoCarts.add(bookInfoCart);
                        sum+=Double.parseDouble(cart.getPertotal());
                        total+=cart.getNum();
                        continue;
                    }
                }
            }
            request.setAttribute("carts",bookInfoCarts);
        }
        request.setAttribute("total",total);
        request.setAttribute("sum",sum+"");
        return "shopcart";
    }
    /**
     * Update cart quantity
     * @return
     */
    @RequestMapping("/changecart")
    @ResponseBody
    public ApiResponse changecart(HttpServletRequest request, HttpServletResponse response){
        BookCart bookCart = (BookCart) RequestUtil.getRequestConvertBean(request,BookCart.class);
        BookCart exitCart = bookCartRepository.findByUsidAndBookid(bookCart.getUsid(),bookCart.getBookid());
        if(exitCart==null){
            //Does not exist, add a shopping cart record
            bookCartRepository.save(bookCart);
        }else{
            //If it exists, get the original data and modify the new quantity and subtotal amount.
            exitCart.setNum(bookCart.getNum()+exitCart.getNum());
            exitCart.setPertotal((Double.parseDouble(bookCart.getPertotal())+Double.parseDouble(exitCart.getPertotal()))+"");
            bookCartRepository.save(exitCart);
        }
        return ApiResponse.success();
    }

    /**
     * Delete shopping cart
     * @return
     */
    @RequestMapping("/delcart")
    public String delcart(HttpServletRequest request, HttpServletResponse response){
        //Convert request parameters to entities
        BookCart bookCart = (BookCart) RequestUtil.getRequestConvertBean(request,BookCart.class);
        bookCartRepository.deleteById(bookCart.getId());
        return "redirect:/shopcart";
    }
}
