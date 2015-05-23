package pkg;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/adminsettingsservlet")
public class adminsettingsservlet extends HttpServlet {


    public adminsettingsservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        String npwd = request.getParameter("_npwd").trim();
        String cpwd = request.getParameter("_cpwd").trim();
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            String sq = "update admin set pwd = ? where id='1'";
            PreparedStatement ps = con.prepareStatement(sq);
            ps.setString(1, npwd);
            ps.executeUpdate();

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