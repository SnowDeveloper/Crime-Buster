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


@WebServlet("/messageservlet")
public class messageservlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public messageservlet() { super();}

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;ISO-8859-1");
        PrintWriter writer = response.getWriter();

        String nm = request.getParameter("_name");
        String eml = request.getParameter("_email");
        String detail = request.getParameter("_detail");

        boolean validify = validateData(nm,eml,detail);
        if(validify == false)
        {
            writer.write("Something went wrong, Please try again.");
            writer.close();
            return;
        }
        System.out.print(nm+ ","+eml+","+detail);

        try{

            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            con.setAutoCommit(false);
            String sql = "insert into message (name,email,detail) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nm);
            ps.setString(2, eml);
            ps.setString(3, detail);

            int result = ps.executeUpdate();

            if(result>0)
            {
                con.commit();
                writer.write("Message Sent!");
            }
            else
                writer.write("Failed, Please try again");

            ps.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            writer.write("Class Not Found");

        } catch (SQLException e) {
            e.printStackTrace();
            writer.write("SQL Error");
        }
        finally {
            writer.close();
        }
    }

    private boolean validateData(String nm, String eml, String detail) {
        if(nm.isEmpty() || eml.isEmpty() || detail.isEmpty())
            return false;
        if(nm.length()>50 || eml.length()>50 || detail.length()>200)
            return false;
        if(!eml.contains("@") || !eml.contains("."))
            return false;
        return true;
    }
}
