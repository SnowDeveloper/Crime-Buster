package pkg;


public class admin_policelist_init {
    private int refn;

    public int getRefn() {
        return refn;
    }

    public void setRefn(int refn) {
        this.refn = refn;
    }

    public int remove() {
        admin_policelist_Dao e = new admin_policelist_Dao();
        int i = e.remove(refn);
        return i;
    }
}