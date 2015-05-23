package pkg;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/form2servlet")
public class form2servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public form2servlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;ISO-8859-1");
        PrintWriter writer = response.getWriter();

        String name = request.getParameter("_name");
        String addr = request.getParameter("_addr");
        String location = request.getParameter("_location");
        String position = request.getParameter("_option");
        String age = request.getParameter("_age");
        String gender = request.getParameter("_gender");
        String email = request.getParameter("_email");
        String phonenum = request.getParameter("_phonenum");
        String pid = request.getParameter("_pid");
        String pwd = request.getParameter("_pwd");
        String cpwd = request.getParameter("_cpwd");


        System.out.print(name + "," + addr + "," + location + "," + position + "," + age + "," + gender + "," + email + "," + phonenum + "," + pid + "," + pwd + "," + cpwd);

        try {
            Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
            con.setAutoCommit(false);

            String sq = "select count(*) from polices where email = ?";
            PreparedStatement p = con.prepareStatement(sq);
            p.setString(1, email);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                int numberOfRows = rs.getInt(1);
                System.out.println("numberOfRows= " + numberOfRows);
                if (numberOfRows == 0) {

                    String q = "select count(*) from pid where pid = ?";

                    PreparedStatement pt = con.prepareStatement(q);
                    pt.setString(1, pid);
                    ResultSet t = pt.executeQuery();
                    while (t.next()) {
                        int numberOfRow = t.getInt(1);
                        System.out.println("numberOfRows= " + numberOfRow);
                        if (numberOfRow == 0) {
                            writer.write("Invalid Police ID! You are unauthorized! Try Again!");
                        } else {

                            String sql = "insert into polices (name,address,location,rank,age,gender,email,contact,pid,pwd,cpwd) values (?,?,?,?,?,?,?,?,?,?,?)";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setString(1, name);
                            ps.setString(2, addr);
                            ps.setString(3, location);
                            ps.setString(4, position);
                            ps.setString(5, age);
                            ps.setString(6, gender);
                            ps.setString(7, email);
                            ps.setString(8, phonenum);
                            ps.setString(9, pid);
                            ps.setString(10, pwd);
                            ps.setString(11, cpwd);

                            int result = ps.executeUpdate();

                            if (result > 0) {
                                con.commit();
                                writer.write("Your Account is Created! You can now Sign In with your UserID and Password");
                            } else
                                writer.write("Failed, Please try again");

                            ps.close();
                        }
                    }
                    pt.close();
                } else {
                    writer.write("Email-Id or UserName already exists! Try again");
                    System.out.println("UID exists");
                }

            }
            p.close();
            con.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            writer.write("Class Not Found");
        } catch (SQLException e) {
            e.printStackTrace();
            writer.write("The EmailID (username) is already registered! Try Again!");
        } finally {
            writer.close();
        }
    }


}
