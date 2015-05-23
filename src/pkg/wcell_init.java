package pkg;


public class wcell_init {
    private String wname;
    private String email;
    private String age;
    private String phonenum;
    private String addr;
    private String detail;
    private int refn;

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getRefn() {
        return refn;
    }

    public void setRefn(int refn) {
        this.refn = refn;
    }

    public int register() {
        wcell_Dao e = new wcell_Dao();
        int i = e.register(wname, email, age, phonenum, addr, detail, refn);
        return i;
    }

    public int remove() {
        wcell_Dao e = new wcell_Dao();
        int i = e.remove(refn);
        return i;
    }


}
