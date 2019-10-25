package cn.tmmall.pojo;


import java.util.List;

public class PageListRes {
    private Long total;
    private Integer totalPage;
    private Integer pageNo;
    private List<Object> rows;

    public Integer getPageNo() { return pageNo; }
    public void setPageNo(Integer pageNo) { this.pageNo = pageNo; }
    public Integer getTotalPage() { return totalPage; }
    public void setTotalPage(Integer totalPage) { this.totalPage = totalPage; }
    public List<Object> getRows() {
        return rows;
    }
    public void setRows(List<Object> rows) {
        this.rows = rows;
    }
    public Long getTotal() {
        return total;
    }
    public void setTotal(Long total) {
        this.total = total;
    }

}
