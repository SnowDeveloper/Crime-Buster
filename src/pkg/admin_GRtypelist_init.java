package pkg;


public class admin_GRtypelist_init {
    private int refn;
    private String types;

    public int getRefn() {
        return refn;
    }

    public void setRefn(int refn) {
        this.refn = refn;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public int register() {
        admin_GRtypelist_Dao e = new admin_GRtypelist_Dao();
        int i = e.register(refn, types);
        return i;
    }

    public int remove() {
        admin_GRtypelist_Dao e = new admin_GRtypelist_Dao();
        int i = e.remove(refn);
        return i;
    }
}