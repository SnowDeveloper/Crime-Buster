package pkg;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/ReferenceServlet")
public class ReferenceServlet extends HttpServlet {

    private String name, email;

    public ReferenceServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;ISO-8859-1");
        PrintWriter writer = response.getWriter();
        String refno = request.getParameter("_ref");

        boolean validify = validateData(refno);
        if (validify == false) {
            writer.write("Something went wrong, Please try again.");
            writer.close();
            return;
        }
        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            String sql = "select wname,email from wcomplaint where refn=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(refno));
            int temp = 0;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
                email = rs.getString(2);
                ++temp;
            }
            con.close();
            if (temp != 0)
                writer.write(name + ";" + email);
            else
                writer.write("Hello");
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

    private boolean validateData(String refno) {
        if (refno.isEmpty())
            return false;
        return true;
    }
}
