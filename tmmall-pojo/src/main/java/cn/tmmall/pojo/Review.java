package cn.tmmall.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 评价表
 */
public class Review {
    /**
     * id
     */
    private Integer id;
    /**
     * 评价内容
     */
    private String content;
    /**
     * 用户id
     */
    private Integer uid;
    /**
     * 商品id
     */
    private Integer pid;
    /**
     * 评价日期
     * @JsonFormat 此注解可以转换json传到前端的时间格式
     *              要引入fasterxml下的jackson这个jar包才能使用
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;
    /**
     * 用户名称
     */
    private String username;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", uid=" + uid +
                ", pid=" + pid +
                ", createDate=" + createDate +
                ", username='" + username + '\'' +
                '}';
    }
}
