package pkg;


public class gr_init {
    private String name;
    private String email;
    private String age;
    private String option;
    private String phonenum;
    private String addr;
    private String detail;
    private int refn;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
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
        gr_Dao e = new gr_Dao();
        int i = e.register(name, email, age, option, phonenum, addr, detail, refn);
        return i;
    }

    public int remove() {
        gr_Dao e = new gr_Dao();
        int i = e.remove(refn);
        return i;
    }
}