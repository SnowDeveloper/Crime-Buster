<%
    Cookie cookie = null;
    Cookie[] cookies = null;
    Boolean Logged = false;
    // Get an array of Cookies associated with this domain
    cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals("admincrimebuster") && cookie.getValue().equals("IkhuijJOIJoejifo9kuh8UHI798yguyg")) {
                Logged = true;
            }
        }
    }
    if (Logged == false)
        response.sendRedirect("admin_login.jsp");
%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CB - Admin</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="admin_home.jsp" style="color:#E60498">Crime Buster - Admin</a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gear"></i> <b
                        class="caret"></b></a>
                <ul class="dropdown-menu message-dropdown">

                    <li>
                        <a href="admin_settings.jsp"><i class="fa fa-fw fa-gear"></i> Admin Settings</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
                        class="caret"></b></a>
                <ul class="dropdown-menu message-dropdown">

                    <li>
                        <a href="admin_msgs.jsp"><i class="fa fa-envelope"></i> Messages</a>
                    </li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white"><i
                        class="fa fa-user"></i> Admin <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li class="divider"></li>
                    <li>
                        <span onclick="logout('admincrimebuster')"><i class="fa fa-fw fa-power-off"></i> Log Out</span>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li>
                    <a href="admin_home.jsp" style="color:white"><i class="fa fa-user"></i> Welcome Admin!</a>
                </li>
                <li>
                    <a href="admin_GRtypelist.jsp"><i class="fa fa-fw fa-wrench"></i> General Report Page</a>
                </li>
                <li>
                    <a href="admin_policelist.jsp"><i class="fa fa-user"></i> Polices</a>
                </li>
                <li class="active">
                    <a href="admin_policeIDlist.jsp"><i class="fa fa-fw fa-file"></i> Police ID</a>
                </li>
                <li>
                    <a href="admin_policeRanklist.jsp"><i class="fa fa-fw fa-dashboard"></i> Police Rank</a>
                </li>

                <li>
                    <a href="admin_FIRtypelist.jsp"><i class="fa fa-fw fa-wrench"></i> File FIR Page </a>
                </li>
                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-wrench"></i>
                        Contact Police Page<i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="demo" class="collapse">
                        <li>
                            <a href="admin_wpslist.jsp"><i class="fa fa-fw fa-file"></i> Women Police Station </a>
                        </li>
                        <li>
                            <a href="admin_pslist.jsp"><i class="fa fa-fw fa-dashboard"></i> Police Station </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a target="_blank" href="index.jsp"><i class="fa fa-fw fa-desktop"></i> View Website</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Police Team Page
                        <small>Police ID List</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-user"></i> <a href="admin_home.jsp">Admin</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-wrench"></i> Police ID List
                        </li>
                    </ol>
                </div>
            </div>

            <div class="navbar navbar-inverse">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="admin_policeIDlist.jsp">Police Team</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="admin_policeIDlist.jsp">View Police IDs</a>
                            </li>
                            <li><a href="admin_policeIDlist1.jsp">Add Police ID</a>
                            </li>
                            <li><a href="admin_policeIDlist2.jsp">Remove Police ID</a>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>


            <div class="table-responsive">
                <table class="table table-bordered table-hover" style="text-align: center;">

                    <section id="main" class="column" style="text-align: center;">

                        <div style="color: darkblue; font-size: 25pt;text-decoration:underline;">Police ID List</div>
                        <br>

                            <%
              Class.forName("org.sqlite.JDBC").newInstance();
              Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
              PreparedStatement psmnt = con.prepareStatement("select * from pid ");
              ResultSet resultset = psmnt.executeQuery();
            %>

                        <thread>
                            <TR>
                                <TH>
                                    <h3>
                                        <div style="color: black; text-decoration: underline; text-align: center;">
                                            Reference Number
                                        </div>
                                    </h3>
                                </TH>
                                <TH>
                                    <h3>
                                        <div style="color: black; text-decoration: underline; text-align: center;">ID
                                        </div>
                                    </h3>
                                </TH>
                            </TR>
                        </thread>
                        <tbody>
                        <% while (resultset.next()) { %>
                        <TR>
                            <TD><%= resultset.getInt(1) %>
                            </td>
                            <TD><%= resultset.getString(2) %>
                            </td>
                        </TR>
                        <% } %>
                        </tbody>
                </TABLE>
                </section>

                </table>
            </div>


        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    function logout(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
        location.href = "admin_login.jsp";
    }
</script>

</body>

</html>

