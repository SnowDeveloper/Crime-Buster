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


@WebServlet("/form1servlet")
public class form1servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public form1servlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;ISO-8859-1");
        PrintWriter writer = response.getWriter();

        String nm = request.getParameter("_name");
        String eml = request.getParameter("_email");
        String ag = request.getParameter("_age");
        String no = request.getParameter("_phonenum");
        String add = request.getParameter("_addr");
        String detail = request.getParameter("_detail");

        boolean validify = validateData(nm, eml, ag, no, add, detail);
        if (validify == false) {
            writer.write("Something went wrong, Please try again.");
            writer.close();
            return;
        }

        Random rand = new Random();
        int referNum = rand.nextInt((90000 - 10000) + 1) + 10000;
        String rf = Integer.toString(referNum + 1337);
        System.out.print(nm + "," + eml + "," + ag + "," + no + "," + add + "," + detail + "," + rf);

        try {

            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            con.setAutoCommit(false);
            String sql = "insert into wcomplaint (wname,email,age,phonenum,addr,detail,refn) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nm);
            ps.setString(2, eml);
            ps.setString(3, ag);
            ps.setString(4, no);
            ps.setString(5, add);
            ps.setString(6, detail);
            ps.setString(7, rf);

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

    private boolean validateData(String nm, String eml, String ag, String no, String add, String detail) {
        if (nm.isEmpty() || eml.isEmpty() || ag.isEmpty() || no.isEmpty() || add.isEmpty() || detail.isEmpty())
            return false;
        if (nm.length() > 50 || eml.length() > 50 || !isNumber(ag) || !isNumber(no) || add.length() > 100 || detail.length() > 200)
            return false;
        if (!eml.contains("@") || !eml.contains("."))
            return false;
        return true;
    }

    public static boolean isNumber(String number) {
        try {
            Long.parseLong(number);
        } catch (NumberFormatException ex) {
            return false;
        }
        return true;
    }
}
