package pkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class admin_policeRanklist_Dao {
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

    public int register(int rf, String rk)

    {
        int i = 0;
        try {
            Connection con = connect();
            //System.out.println("hello");
            PreparedStatement ps = con.prepareStatement("insert into prank (refn,rank) values (?,?)");
            ps.setInt(1, rf);
            ps.setString(2, rk);
            i = ps.executeUpdate();
            //System.out.println(i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public int remove(int rf) {
        int i = 0;
        try {
            Connection con = connect();

            PreparedStatement ps = con.prepareStatement("delete from prank where refn=?");

            ps.setInt(1, rf);
            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}


