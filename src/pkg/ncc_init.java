package pkg;


public class ncc_init {
    private String name;
    private String email;
    private String age;
    private String phonenum;
    private String addr;
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

    public int getRefn() {
        return refn;
    }

    public void setRefn(int refn) {
        this.refn = refn;
    }

    public int register() {
        ncc_Dao e = new ncc_Dao();
        int i = e.register(name, email, age, phonenum, addr, refn);
        return i;
    }

    public int remove() {
        ncc_Dao e = new ncc_Dao();
        int i = e.remove(refn);
        return i;
    }
}