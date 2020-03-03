package po.BSJ;

public class User {
    private int u_id;
    private String u_name;
    private String u_password;
    private String u_sex;
    private String u_forbid;

    public int getu_id() {
        return u_id;
    }

    public void setu_id(int id) {
        this.u_id = id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_sex() {
        return u_sex;
    }

    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public String getU_forbid() {
        return u_forbid;
    }

    public void setU_forbid(String u_forbid) {
        this.u_forbid = u_forbid;
    }
}
