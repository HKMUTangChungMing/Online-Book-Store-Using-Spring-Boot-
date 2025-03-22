package hkmu.comps380f.onlinebookstore.utils;

import hkmu.comps380f.onlinebookstore.entity.BookItem;
import jakarta.persistence.*;

import java.awt.print.Book;
import java.io.Serializable;
import java.util.List;

/**
 * Order summary class
 *
 */
public class BookOrderItem implements Serializable {
    /**
     * id
     */
    private Integer id;
    /**
     * user id
     */
    private Integer userid;
    /**
     * Payment account
     */
    private String payname;
    /**
     * Payment time
     */
    private String paytime;
    /**
     * order number
     */
    private String orderid;
    /**
     * Order total
     */
    private String total;

    private List<BookItem> itemlist;

    public List<BookItem> getItemlist() {
        return itemlist;
    }

    public void setItemlist(List<BookItem> itemlist) {
        this.itemlist = itemlist;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getPayname() {
        return payname;
    }

    public void setPayname(String payname) {
        this.payname = payname;
    }
}
