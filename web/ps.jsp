<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
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
            <h1><a href="index.jsp">Crime Buster</a></h1>

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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Register Complaints</a>
                    <ul>
                        <li><a href="WomenCell.jsp">Women's Cell</a></li>
                        <li><a href="GeneralReport.jsp">General Report</a></li>
                        <li><a href="NoCrimeCertificate.jsp">No Crime Certificate</a></li>
                    </ul>
                </li>
                <li><a href="PoliceTeam.jsp">Police Team</a>
                </li>
                <li class="last"><a href="FileFIR.jsp">File FIR</a></li>
                <li class="active"><a href="ContactPolice.jsp">Contact Police</a></li>
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
            <li class="first">You Are Here</li>
            <li>&#187;</li>
            <li><a href="index.jsp">Home</a></li>
            <li>&#187;</li>
            <li class="current"><a href="ContactPolice.jsp">Contact Police</a></li>
        </ul>
    </div>
</div>

<div class="wrapper col4">
    <div id="container">
        <div id="content">
            <div name="PoliceStage"></div>

            <section id="main" class="column" style="text-align: center;">

                <div style="color: #FFFFFF; font-size: 25pt;text-decoration:underline;">Police Station</div>
                <br>

                <%
                    Class.forName("org.sqlite.JDBC").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
                    PreparedStatement psmnt = con.prepareStatement("select * from ps ");
                    ResultSet resultset = psmnt.executeQuery();
                %>

                <TABLE BORDER="1" style="color:navajowhite" width="500" height="300">
                    <TR>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">ID</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Name</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Address</div>
                            </h3>
                        </TH>
                        <TH>
                            <h3>
                                <div style="color: #FFFFFF; font-size: 15pt;">Contact</div>
                            </h3>
                        </TH>
                    </TR>
                    <% while (resultset.next()) { %>
                    <TR>
                        <TD><%= resultset.getInt(1) %>
                        </td>
                        <TD><%= resultset.getString(2) %>
                        </td>
                        <TD><%= resultset.getString(3) %>
                        </TD>
                        <TD><%= resultset.getString(4) %>
                        </TD>
                    </TR>
                    <% } %>
                </TABLE>
            </section>


        </div>

        <div id="column">
            <div class="subnav">
                <h2 style="color:white">Police Stations (Across West Bengal)</h2>
                <ul>
                    <li>Special Women Police Stations:
                        <ul>
                            <li><a href="wps.jsp">Get Details</a></li>
                        </ul>
                    </li>
                    <br>
                    <li>Police Stations:
                        <ul>
                            <li><a href="ps.jsp">Get Details</a></li>
                        </ul>
                    </li>

                </ul>
                <br><br>

                <h1 style="color:white">Write Message to Admin</h1>

                <div name="MessageStage"></div>
                <form name="msgfrm" action="messageservlet" method="post" onsubmit="return(validateF());">
                    <p align="center">
                        <input id="TheName" type="text" placeholder="Full Name" name="name" size="27">
                    </p>

                    <p align="center">
                        <input id="TheEmail" type="text" placeholder="Email Address" name="email" size="27">
                    </p>

                    <p align="center">
                        <textarea id="TheDetails" cols="25" rows="4" placeholder="Your Message (Write Here)"
                                  name="detail"></textarea>
                    </p>

                    <div class="clear"></div>
                    <div class="row">
                        <div style="text-align: center;">
                            <button type="submit">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>
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


</body>
</html>
