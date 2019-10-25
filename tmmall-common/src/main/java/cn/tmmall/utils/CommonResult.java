package cn.tmmall.utils;

/**
 * JSON格式
 *
 * @author XYQ
 */
public class CommonResult {
    /**
     * 状态码 100 成功 200 失败
     */
    private String code;
    /**
     * 提示信息
     */
    private String msg;
    /**
     * 返回给前台的数据
     */
    private Object data;

    public CommonResult() {
    }

    public CommonResult(Object data) {
        this.code = "100";
        this.msg = "处理成功";
        this.data = data;
    }

    public CommonResult(String code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static CommonResult ok() {
        return new CommonResult(null);
    }

    public static CommonResult ok(Object data) {
        return new CommonResult(data);
    }

    public static CommonResult error() {
        return new CommonResult("200", "处理失败！", null);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
