package pkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class admin_policelist_Dao {
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

    public int remove(int rf) {
        int i = 0;
        try {
            Connection con = connect();

            PreparedStatement ps = con.prepareStatement("delete from polices where pid=?");

            ps.setInt(1, rf);
            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}


