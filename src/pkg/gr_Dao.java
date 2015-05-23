package pkg;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class gr_Dao {
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

    public int register(String nm, String eml, String ag, String opt, String no, String add, String detail, int rf)

    {
        int i = 0;
        try {
            Connection con = connect();
            //System.out.println("hello");
            PreparedStatement ps = con.prepareStatement("insert into gencomplaint (name,email,age,option,phonenum,addr,detail,refn) values (?,?,?,?,?,?,?,?)");
            ps.setString(1, nm);
            ps.setString(2, eml);
            ps.setString(3, ag);
            ps.setString(4, opt);
            ps.setString(5, no);
            ps.setString(6, add);
            ps.setString(7, detail);
            ps.setInt(8, rf);
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

            PreparedStatement ps = con.prepareStatement("delete from gencomplaint where refn=?");

            ps.setInt(1, rf);
            i = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}


