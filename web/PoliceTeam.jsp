<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
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

    <style>
        .placeholder::-webkit-input-placeholder {
            color: #da4f49;
        }

        .placeholder::-webkit-input-placeholder {
            color: #da4f49;
        }

        .placeholder::-moz-placeholder {
            color: #da4f49;
        }

        .placeholder::-moz-placeholder {
            color: #da4f49;
        }

        .placeholder::-ms-input-placeholder {
            color: #da4f49;
        }
    </style>
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
                <li class="active"><a href="PoliceTeam.jsp">Police Team</a>
                </li>
                <li class="last"><a href="FileFIR.jsp">File FIR</a></li>
                <li><a href="ContactPolice.jsp">Contact Police</a></li>
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
            <li><a href="index.jsp">Our Team</a></li>
            <li>&#187;</li>
            <li class="current"><a href="PoliceTeam.jsp">Police Team</a></li>
        </ul>
    </div>
</div>

<div class="wrapper col4">
    <div id="container">
        <div id="content">
            <div name="PoliceStage"><h1 style="color:white">New Police Registration</h1></div>
            <form name="frm2" action="form2servlet" method="post" onsubmit="return(validateF());">
                <p align="center-left">
                    <input id="TheName" type="text" placeholder="Full Name" name="name" size="100">
                </p>

                <p align="center-left">
                    <textarea id="TheAddress" cols="98" rows="5" placeholder="Full Address" name="add"></textarea>
                </p>

                <p align="center-left">
                    <input id="TheLocation" type="text" placeholder="Location (Area in Charge)" name="location"
                           size="100">
                </p>

                <p align="center-left">
                    <label>Select Position: </label>
                    <label>
                        <select id="TheOption" name="option">
                            <option value=""><---Select---></option>
                            <%
                                Class.forName("org.sqlite.JDBC").newInstance();
                                Connection con = DriverManager.getConnection("jdbc:sqlite:C:/sqlite/wcomplaint");
                                PreparedStatement psmnt = con.prepareStatement("select rank from prank ");
                                ResultSet results = psmnt.executeQuery();
                                while (results.next()) {
                                    String name = results.getString(1);
                            %>
                            <option value="<%= name %>"><%=name%>
                            </option>
                            <%
                                }
                                results.close();
                                psmnt.close();
                            %>
                        </select>
                    </label><br>
                </p>
                <p align="center-left">
                    <input id="TheAge" type="number" placeholder="Age" name="age" size="100">
                </p>

                <p align="center-left">
                    <label id="msg">Gender: </label>
                    <input id="TheMGender" type="radio" name="gender" value="male" checked="checked">Male
                    <input id="TheFGender" type="radio" name="gender" value="female">Female
                </p>

                <p align="center-left">
                    <input id="TheEmail" type="text" placeholder="Email Address (This will be your UserID)" name="email"
                           size="100">
                </p>

                <p align="center-left">
                    <input id="ThePhoneNumber" type="tel" placeholder="10-digit Mobile Number" name="num" size="100">
                </p>

                <p align="center-left">
                    <input id="ThePID" type="number" placeholder="Police ID number"
                           name="pid" size="100">
                </p>

                <p align="center-left">
                    <input id="ThePassword" type="password" placeholder="Enter new password (Eight characters minimum)"
                           name="pwd" size="100">
                </p>

                <p align="center-left">
                    <input id="TheConfirmPassword" type="password" placeholder="Confirm password (Re-enter password)"
                           name="cpwd" size="100">
                </p>

                <div class="row">
                    <div style="text-align: center;">
                        <button type="submit">Submit Form</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="column">
        <div class="subnav">
            <h2 style="color:white">Police Login</h2>

            <form name="frm" action="PoliceServlet" method="post" onsubmit="return(validateForm());">
                <div class="row">
                    <input id="UID" type="text" placeholder="UserId (Your Registered Email)" name="email"
                           size="40"></br>
                </div>
                <br>

                <div class="row">
                    <input id="Password" type="password" placeholder="Your Password" name="pwd" size="40"></br>
                </div>
                <br>

                <div class="row">
                    <div style="text-align: center;">
                        <button type="submit">Sign In</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <br class="clear"/>
</div>
</div>
<br><br>
<!-- ####################################################################################################### -->
<div class="wrapper col5">

</div>

<div class="wrapper col6">
    <div id="copyright" align="center">
        <p>Copyright@ 2015: Crime Buster</p><br>

        <p>All Rights Reserved</p>
        <br class="clear"/>
    </div>
</div>

<script type="text/javascript">
    function validateF() {
        var name = document.frm2.name.value;
        var addr = document.frm2.add.value;
        var location = document.frm2.location.value;
        var option = document.frm2.option.value;
        var age = document.frm2.age.value;
        var gender = document.frm2.gender.value;
        var email = document.frm2.email.value;
        var phonenum = document.frm2.num.value;
        var pid = document.frm2.pid.value;
        var pwd = document.frm2.pwd.value;
        var cpwd = document.frm2.cpwd.value;

        if (name == null || name == "") {
            $("#TheName").attr("value", "");
            $("#TheName").attr("placeholder", "Name Not Filled");
            $("#TheName").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheName").offset().top
            }, 'slow');
            return false;
        }
        if (addr == null || addr == "") {
            $("#TheAddress").attr("value", "");
            $("#TheAddress").attr("placeholder", "Address must be filled out");
            $("#TheAddress").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheAddress").offset().top
            }, 'slow');
            return false;
        }
        if (location == null || location == "") {
            $("#TheLocation").attr("value", "");
            $("#TheLocation").attr("placeholder", "Location Not Filled");
            $("#TheLocation").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheLocation").offset().top
            }, 'slow');
            return false;
        }
        if (age == null || age == "" || isNaN(age) || age < 18 || age > 60) {
            $("#TheAge").attr("value", "");
            $("#TheAge").attr("placeholder", "Age Not Filled");
            $("#TheAge").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheAge").offset().top
            }, 'slow');
            return false;
        }
        if (email == null || email == "" || email.indexOf("@") == -1 || email.indexOf(".") == -1) {
            $("#TheEmail").attr("value", "");
            $("#TheEmail").attr("placeholder", "Email Not Filled");
            $("#TheEmail").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheEmail").offset().top
            }, 'slow');
            return false;
        }
        if (phonenum == null || phonenum == "" || isNaN(phonenum) || phonenum.length < 10 || phonenum.length > 10) {
            $("#ThePhoneNumber").attr("value", "");
            $("#ThePhoneNumber").attr("placeholder", "Mobile Number should be filled and of 10-digits");
            $("#ThePhoneNumber").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePhoneNumber").offset().top
            }, 'slow');
            return false;
        }
        if (pid == null || pid == "" || isNaN(pid)) {
            $("#ThePID").attr("value", "");
            $("#ThePID").attr("placeholder", "Police ID must be filled");
            $("#ThePID").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePID").offset().top
            }, 'slow');
            return false;
        }
        if (pwd == null || pwd == "" || pwd.length < 8) {
            $("#ThePassword").attr("value", "");
            $("#ThePassword").attr("placeholder", "Password must be filled out and should be of minimum 8-characters");
            $("#ThePassword").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePassword").offset().top
            }, 'slow');
            return false;
        }
        if ((cpwd != null || cpwd != "") && pwd != cpwd) {
            $("#TheConfirmPassword").attr("value", "");
            $("#TheConfirmPassword").attr("placeholder", "Password and Confirm Password are not same");
            $("#TheConfirmPassword").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheConfirmPassword").offset().top
            }, 'slow');
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/form2servlet",
            data: {
                _name: name,
                _addr: addr,
                _location: location,
                _option: option,
                _age: age,
                _gender: gender,
                _email: email,
                _phonenum: phonenum,
                _pid: pid,
                _pwd: pwd,
                _cpwd: cpwd
            },
            success: function (data) {
                $('form[name="frm2"]').closest("form").hide();
                $('div[name="PoliceStage"]').closest("div").text(data);
                $('div[name="PoliceStage"]').closest("div").append("<br><br><a onclick='return(ReForm());'>Click Here for New Form</a>");
            },
            error: function (data) {
                $('form[name="frm2"]').closest("form").hide();
                $('div[name="PoliceStage"]').closest("div").text(data);
                $('div[name="PoliceStage"]').append("Email-ID is already registered!");
                $('div[name="PoliceStage"]').closest("div").append("<br><br><a onclick='return(ReForm());'>Click For New Form</a>");

            }
        });
        return false;
    }
</script>

<script type="text/javascript">
    function ReForm() {
        $('form[name="frm2"]').closest("form").trigger("reset");
        $('form[name="frm2"]').closest("form").show();
        $('div[name="PoliceStage"]').closest("div").text("Enter Details");
    }
</script>
<script type="text/javascript">
    function validateForm() {

        var email = document.frm.email.value;
        var pwd = document.frm.pwd.value;

        if (email == null || email == "" || email.indexOf("@") == -1 || email.indexOf(".") == -1) {
            $("#UID").attr("value", "")
            $("#UID").attr("placeholder", "UserID must be filled out")
            $("#UID").addClass("placeholder")
            $('html, body').animate({
                scrollTop: $("#UID").offset().top
            }, 'slow');
            return false;
        }
        if (pwd == null || pwd == "") {
            $("#Password").attr("value", "")
            $("#Password").attr("placeholder", "Password must be filled out")
            $("#Password").addClass("placeholder")
            $('html, body').animate({
                scrollTop: $("#Password").offset().top
            }, 'slow');
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/PoliceServlet",
            data: {_email: email, _pwd: pwd},
            success: function (data) {
                console.log(data);
                document.cookie = "crimebuster" + "=" + data;
                location.href = "PoliceLoggedIn.jsp";
            },
            error: function (err) {
                console.log(err);
                $('form[name="frm2"]').closest("form").hide();
                $('div[name="PoliceStage"]').closest("div").text(err);
                $('div[name="PoliceStage"]').append("Invalid UserID or Password entered");
                $('div[name="PoliceStage"]').closest("div").append("<br><br><a onclick='return(ReForm());'>Click For New Form</a>");

            }
        });
        return false;

    }
</script>


</body>
</html>
