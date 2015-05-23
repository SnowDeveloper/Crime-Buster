package pkg;


public class admin_policeIDlist_init {
    private int refn;
    private int pid;

    public int getRefn() {
        return refn;
    }

    public void setRefn(int refn) {
        this.refn = refn;
    }


    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }


    public int register() {
        admin_policeIDlist_Dao e = new admin_policeIDlist_Dao();
        int i = e.register(refn, pid);
        return i;
    }

    public int remove() {
        admin_policeIDlist_Dao e = new admin_policeIDlist_Dao();
        int i = e.remove(refn);
        return i;
    }
}