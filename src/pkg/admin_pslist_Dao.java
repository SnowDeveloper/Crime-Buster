package pkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class admin_pslist_Dao {
    String driver = "org.sqlite.JDBC";
    String url = "jdbc:sqlite:C:/sqlite/wcomplaint";

    public java.sql.Connection connect() {
        java.sql.Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public int register(int id, String nm, String ad, String ct)

    {
        int i = 0;
        try {
            Connection con = connect();
            //System.out.println("hello");
            PreparedStatement ps = con.prepareStatement("insert into ps (id,name,address,contact) values (?,?,?,?)");
            ps.setInt(1, id);
            ps.setString(2, nm);
            ps.setString(3, ad);
            ps.setString(4, ct);
            i = ps.executeUpdate();
            //System.out.println(i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public int remove(int id) {
        int i = 0;
        try {
            Connection con = connect();

            PreparedStatement ps = con.prepareStatement("delete from ps where id=?");

            ps.setInt(1, id);
            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}


