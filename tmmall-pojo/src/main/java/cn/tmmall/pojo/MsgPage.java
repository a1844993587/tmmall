package cn.tmmall.pojo;

import java.util.List;
public class MsgPage {
    @Override
    public String toString() {
        return "MsgPage{" +
                "msg='" + msg + '\'' +
                ", list=" + list +
                '}';
    }

    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    private List<Object> list;
}
