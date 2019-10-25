package cn.tmmall.pojo;

/**
 * 订单项表
 *
 * @Author: Alex Yj
 * @Date: 2019/5/15 8:55
 */
public class OrderItem {

    /**
     * 订单项id
     */
    private Integer id;
    /**
     * 产品id
     */
    private Integer pid;
    /**
     * Product对象
     */
    private Product product;
    /**
     * 订单表id
     */
    private Integer oid;
    /**
     * orders 对象
     */
    private Orders orders;
    /**
     * 用户id
     */
    private Integer uid;
    /**
     * user对象
     */
    private User user;
    /**
     * 购买数量
     */
    private Integer number;

    private Float countPrice;

    /**
     * 单个总价
     *
     * @return
     */
    private Float singleTotal;

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", pid=" + pid +
                ", product=" + product +
                ", oid=" + oid +
                ", orders=" + orders +
                ", uid=" + uid +
                ", user=" + user +
                ", number=" + number +
                '}';
    }

    public Float getCountPrice() {
        return countPrice;
    }

    public void setCountPrice(Float countPrice) {
        this.countPrice = countPrice;
    }

    public Float getSingleTotal() {
        return singleTotal;
    }

    public void setSingleTotal(Float singleTotal) {
        this.singleTotal = singleTotal;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
