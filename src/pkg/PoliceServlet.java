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

@WebServlet("/PoliceServlet")
public class PoliceServlet extends HttpServlet {

    private String name;

    public PoliceServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        String email = request.getParameter("_email").trim();
        String pwd = request.getParameter("_pwd").trim();

        boolean validify = validateData(email, pwd);
        if (validify == false) {
            writer.write("Something went wrong, Please try again.");
            writer.close();
            return;
        }
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            String sq = "select count(*) from polices where email = ? and pwd = ?";
            PreparedStatement ps = con.prepareStatement(sq);
            ps.setString(1, email);
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
                    writer.write("HliGjf6r8yohfjRBgcute64HCmhchhfb97gkfjDjbfhrq");
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

    private boolean validateData(String email, String pwd) {
        if (email.isEmpty() || pwd.isEmpty())
            return false;
        if (email.length() > 50)
            return false;
        if (!email.contains("@") || !email.contains("."))
            return false;
        return true;
    }
}
