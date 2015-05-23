package pkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ncc_Dao {
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

    public int register(String nm, String eml, String ag, String no, String add, int rf)

    {
        int i = 0;
        try {
            Connection con = connect();
            //System.out.println("hello");
            PreparedStatement ps = con.prepareStatement("insert into nocrimecerti (name,email,age,phonenum,addr,refn) values (?,?,?,?,?,?)");
            ps.setString(1, nm);
            ps.setString(2, eml);
            ps.setString(3, ag);
            ps.setString(4, no);
            ps.setString(5, add);
            ps.setInt(6, rf);
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

            PreparedStatement ps = con.prepareStatement("delete from nocrimecerti where refn=?");

            ps.setInt(1, rf);
            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}


