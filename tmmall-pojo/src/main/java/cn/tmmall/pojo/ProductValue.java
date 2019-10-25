package cn.tmmall.pojo;

public class ProductValue {
    private int id;
    private int id1;
    private String name;
    private String value;
    private int pid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "ProductValue{" +
                "id=" + id +
                ", id1=" + id1 +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", pid=" + pid +
                '}';
    }
}
