package pkg;


public class admin_wpslist_init {
    private int id;
    private String name;
    private String jurisdiction;
    private String contact;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJurisdiction() {
        return jurisdiction;
    }

    public void setJurisdiction(String jurisdiction) {
        this.jurisdiction = jurisdiction;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int register()
    {
        admin_wpslist_Dao e = new admin_wpslist_Dao();
        int i = e.register(id,name,jurisdiction,contact);
        return i;
    }

    public int remove()
    {
        admin_wpslist_Dao e = new admin_wpslist_Dao();
        int i = e.remove(id);
        return i;
    }


}