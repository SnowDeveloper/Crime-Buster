package pkg;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;


@WebServlet("/firservlet")
public class firservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public firservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;ISO-8859-1");
        PrintWriter writer = response.getWriter();

        String nm = request.getParameter("_name");
        String eml = request.getParameter("_email");
        String ag = request.getParameter("_age");
        String opt = request.getParameter("_option");
        String no = request.getParameter("_phonenum");
        String add = request.getParameter("_addr");
        String detail = request.getParameter("_detail");

        Random rand = new Random();
        int referNum = rand.nextInt((90000 - 10000) + 1) + 10000;
        String rf = Integer.toString(referNum + 1037);
        System.out.print(nm + "," + eml + "," + ag + "," + no + "," + add + "," + detail + "," + rf);

        try {

            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            con.setAutoCommit(false);
            String sql = "insert into fircomplaint (name,email,age,option,phonenum,addr,detail,refn) values (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nm);
            ps.setString(2, eml);
            ps.setString(3, ag);
            ps.setString(4, opt);
            ps.setString(5, no);
            ps.setString(6, add);
            ps.setString(7, detail);
            ps.setString(8, rf);

            int result = ps.executeUpdate();

            if (result > 0) {
                con.commit();
                writer.write("Your reference number is: " + rf);
            } else
                writer.write("Failed, Please try again");

            ps.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            writer.write("Class Not Found");

        } catch (SQLException e) {
            e.printStackTrace();
            writer.write("SQL Error");
        } finally {
            writer.close();
        }
    }


}
