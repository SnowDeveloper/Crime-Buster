<%
    Cookie cookie = null;
    Cookie[] cookies = null;
    Boolean Logged = false;
    // Get an array of Cookies associated with this domain
    cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals("crimebuster") && cookie.getValue().equals("HliGjf6r8yohfjRBgcute64HCmhchhfb97gkfjDjbfhrq")) {
                Logged = true;
            }
        }
    }
    if (Logged == false)
        response.sendRedirect("PoliceTeam.jsp");
%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head profile="http://gmpg.org/xfn/11">
    <title>Crime Buster</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <link rel="stylesheet" href="styles/layout.css" type="text/css"/>
    <script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.waterwheelCarousel.js"></script>
    <script type="text/javascript" src="scripts/jquery.waterwheelCarousel.setup.js"></script>
</head>
<body id="top">
<div class="wrapper col1">
    <div id="header">
        <div class="fl_left">
            <h1><a href="index.jsp" onclick="return logout('crimebuster');">Crime Buster</a></h1>

            <p style="color:white">BE SAFE..BE SECURE..</p>
        </div>
        <div class="fl_right"><a href="#"><img src="images/demo/main.jpg" alt=""/></a></div>
        <br class="clear"/>
    </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
    <div id="topbar">
        <div id="topnav">
            <ul>
                <li><a href="index.jsp" onclick="return logout('crimebuster');">Home</a></li>
                <li><a href="#" onclick="return logout('crimebuster');">Register Complaints</a>
                    <ul>
                        <li><a href="WomenCell.jsp" onclick="return logout('crimebuster');">Women's Cell</a></li>
                        <li><a href="GeneralReport.jsp" onclick="return logout('crimebuster');">General Report</a></li>
                        <li><a href="NoCrimeCertificate.jsp" onclick="return logout('crimebuster');">No Crime Certificate</a></li>
                    </ul>
                </li>
                <li class="active"><a href="PoliceTeam.jsp" onclick="return logout('crimebuster');">Police Team</a>
                </li>
                <li class="last"><a href="FileFIR.jsp" onclick="return logout('crimebuster');">File FIR</a></li>
                <li><a href="ContactPolice.jsp" onclick="return logout('crimebuster');">Contact Police</a></li>
            </ul>
        </div>
        <div id="search" style="color:red">
            <h6>Toll Free Number (100)</h6>
        </div>
        <br class="clear"/>
    </div>
</div>

<div class="wrapper col3">
    <div id="breadcrumb">
        <ul>
            <li class="first">You Are Logged In</li>
            <li>&#187;</li>
            <li class="current"><span style="color: white; text-decoration: underline" onclick="logout('crimebuster')">Logout Here</span>
            </li>
        </ul>
    </div>
</div>

<div class="wrapper col4">
    <div id="container">
        <div id="content">
            <div name="WomenStage"></div>

            <section id="main" class="column" style="text-align: center;">

                <div style="color: #FFFFFF; font-size: 25pt;text-decoration:underline;">Women Complaints</div>
                <br>

                <%
                    Class.forName("org.sqlite.JDBC").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
                    PreparedStatement psmnt = con.prepareStatement("select * from wcomplaint ");
                    ResultSet resultset = psmnt.executeQuery();
                %>

                <TABLE BORDER="1" style="color:navajowhite" width="500" height="300">
                    <TR>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Name</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Email</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Age</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Contact</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Address</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Details</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Reference Number</div>
                            </h3>
                        </TH>
                    </TR>
                    <% while (resultset.next()) { %>
                    <TR>
                        <TD><%= resultset.getString(1) %>
                        </td>
                        <TD><%= resultset.getString(2) %>
                        </td>
                        <TD><%= resultset.getInt(3) %>
                        </TD>
                        <TD><%= resultset.getString(4) %>
                        </TD>
                        <TD><%= resultset.getString(5) %>
                        </TD>
                        <TD><%= resultset.getString(6) %>
                        </TD>
                        <TD><%= resultset.getInt(7) %>
                        </TD>
                    </TR>
                    <% } %>
                </TABLE>
            </section>


        </div>

        <div id="column">
            <div class="subnav">
                <h2 style="color:white">Complaint Details</h2>
                <ul>
                    <li><a href="#">Women's Cell</a>
                        <ul>
                            <li><a href="wcell.jsp">View Details</a></li>
                            <li><a href="wcell1.jsp">Take Actions</a></li>
                        </ul>
                    </li>

                    <li><a href="#">General Reports</a>
                        <ul>
                            <li><a href="gr.jsp">View Details</a></li>
                            <li><a href="gr1.jsp">Take Actions</a></li>
                        </ul>
                    </li>

                    <li><a href="#">No Crime Certificate</a>
                        <ul>
                            <li><a href="ncc.jsp">View Details</a></li>
                            <li><a href="ncc1.jsp">Take Actions</a></li>
                        </ul>
                    </li>
                    <li><a href="#">FIR Details</a>
                        <ul>
                            <li><a href="firDetail.jsp">View Details</a></li>
                            <li><a href="firDetail1.jsp">Take Actions</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <br class="clear"/>
</div>

</div>
<br><br>
<!-- ####################################################################################################### -->
<div class="wrapper col5">

</div>

<!-- ####################################################################################################### -->

<div class="wrapper col6">
    <div id="copyright" align="center">
        <p>Copyright@ 2015: Crime Buster</p><br>

        <p>All Rights Reserved</p>
        <br class="clear"/>
    </div>
</div>

<script type="text/javascript">
    function logout(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        location.href = "PoliceTeam.jsp";
    }
</script>


</body>
</html>
