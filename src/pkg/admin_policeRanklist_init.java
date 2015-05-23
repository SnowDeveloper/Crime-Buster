package pkg;


public class admin_policeRanklist_init {
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
        admin_policeRanklist_Dao e = new admin_policeRanklist_Dao();
        int i = e.register(refn, types);
        return i;
    }

    public int remove() {
        admin_policeRanklist_Dao e = new admin_policeRanklist_Dao();
        int i = e.remove(refn);
        return i;
    }
}