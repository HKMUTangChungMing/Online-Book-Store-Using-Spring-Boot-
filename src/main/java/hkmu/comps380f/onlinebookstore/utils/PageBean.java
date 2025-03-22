package hkmu.comps380f.onlinebookstore.utils;

import java.util.List;

/**
 * Paging tool class
 *
 */
public class PageBean<T> {

    /**
     * which page
     */
    private int page;
    /**
     * Number of records per page
     */
    private int pageSize = 10;

    /**
     * total
     */
    private long totalCount = 0;
    /**
     * total pages
     */
    private  int totalPage = 0;
    /**
     * Current page record
     */
    private List<T> list;

    private String pageCode;

    public PageBean(int page, int pageSize, long totalCount, int totalPage, List<T> list) {
        super();
        this.page = page;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.list = list;
        this.totalPage = totalPage;
        this.pageCode = genPage(page);
    }

    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public long getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public long getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }

    public String getPageCode() {
        return pageCode;
    }

    public void setPageCode(String pageCode) {
        this.pageCode = pageCode;
    }

    /**
     * Pagination style
     * @param currentPage
     * @return
     */
    private String genPage(int currentPage){
        StringBuilder pageCode = new StringBuilder();
        pageCode.append("<li><a href='zanwei&page=1'>front page</a></li>");
        if(currentPage==1) {
            pageCode.append("<li class='disabled'><a href='#'>Previous page</a></li>");
        }else {
            pageCode.append("<li><a href='zanwei&page=").append(currentPage - 1).append("'>Previous page</a></li>");
        }
        for(int i=currentPage-2;i<=currentPage+2;i++) {
            if(i<1||i>totalPage) {
                continue;
            }
            if(i==currentPage) {
                pageCode.append("<li class='active'><a href='#'>").append(i).append("</a></li>");
            } else {
                pageCode.append("<li><a href='zanwei&page=").append(i).append("'>").append(i).append("</a></li>");
            }
        }
        if(currentPage==totalPage) {
            pageCode.append("<li class='disabled'><a href='#'>Next page</a></li>");
        } else {
            pageCode.append("<li><a href='zanwei&page=").append(currentPage + 1).append("'>Next page</a></li>");
        }
        pageCode.append("<li><a href='zanwei&page=").append(totalPage).append("'>last page</a></li>");
        return pageCode.toString();
    }

    /**
     * Replacement path diameter
     * @param url
     */
    public void replaceUrl(String url){
        this.pageCode = this.pageCode.replace("zanwei", url);
    }
}