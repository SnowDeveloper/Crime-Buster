package pkg;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/adminloginservlet")
public class adminloginservlet extends HttpServlet {

    private String name;

    public adminloginservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        String name = request.getParameter("_name").trim();
        String pwd = request.getParameter("_pwd").trim();

        boolean validify = validateData(name, pwd);
        if (validify == false) {
            writer.write("Something went wrong, Please try again.");
            writer.close();
            return;
        }
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            String sq = "select count(*) from admin where name = ? and pwd = ?";
            PreparedStatement ps = con.prepareStatement(sq);
            ps.setString(1, name);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int numberOfRows = rs.getInt(1);
                System.out.println("numberOfRows= " + numberOfRows);
                if (numberOfRows == 0) {
                    response.sendError(401);
                    System.out.println("No user found for this username and password");

                } else {
                    System.out.println("found!");
                    writer.write("IkhuijJOIJoejifo9kuh8UHI798yguyg");


                }

            }
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

    private boolean validateData(String name, String pwd) {
        if (name.isEmpty() || pwd.isEmpty())
            return false;
        if (name.length() > 50)
            return false;
        return true;
    }
}
