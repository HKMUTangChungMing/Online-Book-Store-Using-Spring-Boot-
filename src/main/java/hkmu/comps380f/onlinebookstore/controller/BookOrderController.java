package hkmu.comps380f.onlinebookstore.controller;

import hkmu.comps380f.onlinebookstore.dao.*;
import hkmu.comps380f.onlinebookstore.entity.*;
import hkmu.comps380f.onlinebookstore.utils.BookInfoCart;
import hkmu.comps380f.onlinebookstore.utils.BookOrderItem;
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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static com.fasterxml.jackson.databind.type.LogicalType.DateTime;

@Controller
public class BookOrderController {
    @Resource
    BookCartRepository bookCartRepository;
    @Resource
    BookInfoRepository bookInfoRepository;
    @Resource
    BookOrderRepository bookOrderRepository;
    @Resource
    BookItemRepository bookItemRepository;
    /**
     * Admin order page
     * @return
     */
    @RequestMapping("/allorder")
    public String allorder(HttpServletRequest request, HttpServletResponse response){
        BookUser user = (BookUser) request.getSession().getAttribute("user");
        //Order summary
        List<BookOrder> orders = bookOrderRepository.findAll(Sort.by(Sort.Direction.DESC,"id"));
        if(orders.size()>0){
            List<String> ids = orders.stream().map(BookOrder::getOrderid).toList();
            //Order Details
            List<BookItem> items = bookItemRepository.findByOrderidIn(ids);
            List<BookOrderItem> orderItems = new ArrayList<>();
            for (BookOrder order : orders) {
                BookOrderItem orderItem = new BookOrderItem();
                orderItem.setOrderid(order.getOrderid());
                orderItem.setTotal(order.getTotal());
                orderItem.setPayname(order.getPayname());
                orderItem.setPaytime(order.getPaytime());
                orderItem.setUserid(order.getUserid());
                orderItem.setItemlist(new ArrayList<>());
                orderItems.add(orderItem);
                for (BookItem every : items) {
                    if (order.getOrderid().equals(every.getOrderid())) {
                        orderItem.getItemlist().add(every);
                    }
                }
            }
            request.setAttribute("orderItems",orderItems);
        }
        return "allorder";
    }
    /**
     * User order page
     * @return
     */
    @RequestMapping("/order")
    public String order(HttpServletRequest request, HttpServletResponse response){
        BookUser user = (BookUser) request.getSession().getAttribute("user");
        //Order summary
        List<BookOrder> orders = bookOrderRepository.findByUserid(user.getId(),Sort.by(Sort.Direction.DESC,"id"));
        if(orders.size()>0){
            List<String> ids = orders.stream().map(BookOrder::getOrderid).toList();
            //Order Details
            List<BookItem> items = bookItemRepository.findByOrderidIn(ids);
            List<BookOrderItem> orderItems = new ArrayList<>();
            for (BookOrder order : orders) {
                BookOrderItem orderItem = new BookOrderItem();
                orderItem.setOrderid(order.getOrderid());
                orderItem.setTotal(order.getTotal());
                orderItem.setPayname(order.getPayname());
                orderItem.setPaytime(order.getPaytime());
                orderItem.setUserid(order.getUserid());
                orderItem.setItemlist(new ArrayList<>());
                orderItems.add(orderItem);
                for (BookItem every : items) {
                    if (order.getOrderid().equals(every.getOrderid())) {
                        orderItem.getItemlist().add(every);
                    }
                }
            }
            request.setAttribute("orderItems",orderItems);
        }
        return "order";
    }
    /**
     * Settlement order
     * @return
     */
    @RequestMapping("/overorder")
    public String overorder(HttpServletRequest request, HttpServletResponse response){
        BookUser user = (BookUser) request.getSession().getAttribute("user");
        //User shopping cart
        List<BookCart> bookCarts = bookCartRepository.findAllByUsid(user.getId(),Sort.by(Sort.Direction.DESC,"id"));
        //order id
        String orderid = new Date().getTime()+"";
        //totle prices
        double sum = 0;
        BookItem bookItem;
        if(bookCarts.size()>0){
            List<Integer> ids = bookCarts.stream().map(BookCart::getBookid).toList();
            //User shopping cart books
            List<BookInfo> bookInfos = bookInfoRepository.findByIdIn(ids);
            for (BookCart cart : bookCarts) {
                for (BookInfo bookInfo : bookInfos) {
                    if (cart.getBookid().equals(bookInfo.getId())) {
                        bookItem = new BookItem();
                        bookItem.setBookid(cart.getBookid());
                        bookItem.setNum(cart.getNum());
                        bookItem.setPrice(bookInfo.getPrice());
                        bookItem.setName(bookInfo.getName());
                        bookItem.setFmimg(bookInfo.getFmimg());
                        bookItem.setOrderid(orderid);
                        bookItem.setPertotal(cart.getPertotal());
                        //Insert order details
                        bookItemRepository.save(bookItem);
                        //Delete the shopping cart after inserting
                        bookCartRepository.deleteById(cart.getId());
                        //totle prices
                        sum+=Double.parseDouble(cart.getPertotal());
                        continue;
                    }
                }
            }
            //Insert order
            BookOrder bookOrder = new BookOrder();
            bookOrder.setOrderid(orderid);
            bookOrder.setPayname(user.getUsername());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            bookOrder.setPaytime(sdf.format(new java.util.Date()));
            bookOrder.setTotal(sum+"");
            bookOrder.setUserid(user.getId());
            bookOrderRepository.save(bookOrder);
        }
        return "redirect:order";
    }

    /**
     * Buy it now
     * @return
     */
    @RequestMapping("/noworder")
    public String noworder(HttpServletRequest request, HttpServletResponse response){
        BookItem bookItem =  (BookItem) RequestUtil.getRequestConvertBean(request,BookItem.class);
        BookUser user = (BookUser) request.getSession().getAttribute("user");
        //order id
        String orderid = new Date().getTime()+"";
        //Insert order details
        bookItem.setOrderid(orderid);
        bookItemRepository.save(bookItem);
        //Insert order
        BookOrder bookOrder = new BookOrder();
        bookOrder.setOrderid(orderid);
        bookOrder.setPayname(user.getUsername());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        bookOrder.setPaytime(sdf.format(new java.util.Date()));
        bookOrder.setUserid(user.getId());
        bookOrder.setTotal(bookItem.getPertotal());
        bookOrderRepository.save(bookOrder);
        return "redirect:order";
    }
}
