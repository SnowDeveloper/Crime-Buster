package pkg;


public class admin_pslist_init {
    private int id;
    private String name;
    private String address;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int register() {
        admin_pslist_Dao e = new admin_pslist_Dao();
        int i = e.register(id, name, address, contact);
        return i;
    }

    public int remove() {
        admin_pslist_Dao e = new admin_pslist_Dao();
        int i = e.remove(id);
        return i;
    }


}