package cn.tmmall.pojo;

import java.util.Date;
import java.util.List;

/**
 * 订单表
 *
 * @Author: Alex Yj
 * @Date: 2019/5/15 8:38
 */
public class Orders {

    /**
     * 订单Id
     */
    private Integer id;
    /**
     * 订单号
     */
    private String orderCode;
    /**
     * 收货地址
     */
    private String address;
    /**
     * 邮政编码
     */
    private String post;
    /**
     * 收货姓名
     */
    private String receiver;
    /**
     *  电话号码
     */
    private String mobile;
    /**
     * 用户备注信息
     */
    private String userMessage;
    /**
     * 订单创建日期
     */
    private Date createDate;
    /**
     * 支付日期
     */
    private Date payDate;
    /**
     * 发货日期
     */
    private Date deliveryDate;
    /**
     * 确认收货日期
     */
    private Date confirmDate;
    /**
     * 用户id
     */
    private Integer uid;
    /**
     * 用户对像
     */
    private User user;
    /**
     * 订单状态
     */
    private String status;

    /**
     * 一对多
     */
    private List<OrderItem> orderItems;

    /**
     * 订单总金额
     */
    private Float totalPrice;

    /**
     * 总数量
     */
    private Integer countNumber;

    public Orders() {
    }

    public Orders(Integer id, String orderCode, String address, String post, String receiver, String mobile, String userMessage, Date createDate, Date payDate, Date deliveryDate, Date confirmDate, Integer uid, String status) {
        this.id = id;
        this.orderCode = orderCode;
        this.address = address;
        this.post = post;
        this.receiver = receiver;
        this.mobile = mobile;
        this.userMessage = userMessage;
        this.createDate = createDate;
        this.payDate = payDate;
        this.deliveryDate = deliveryDate;
        this.confirmDate = confirmDate;
        this.uid = uid;
        this.status = status;
    }

    public Integer getCountNumber() {
        return countNumber;
    }

    public void setCountNumber(Integer countNumber) {
        this.countNumber = countNumber;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", orderCode='" + orderCode + '\'' +
                ", address='" + address + '\'' +
                ", post='" + post + '\'' +
                ", receiver='" + receiver + '\'' +
                ", mobile='" + mobile + '\'' +
                ", userMessage='" + userMessage + '\'' +
                ", createDate=" + createDate +
                ", payDate=" + payDate +
                ", deliveryDate=" + deliveryDate +
                ", confirmDate=" + confirmDate +
                ", uid=" + uid +
                ", status='" + status + '\'' +
                '}';
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Date getConfirmDate() {
        return confirmDate;
    }

    public void setConfirmDate(Date confirmDate) {
        this.confirmDate = confirmDate;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
