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
            <div name="WomenStage"><h1 style="color:white">Get in Touch with Police!<br><br></h1></div>
            <div>
                <p>
                    Here you can get all the contact information of Police Stations Across West Bengal!
                </p><br>

                <p>
                    Feel Free to Seek Information and keep your Reference Number Generated via your Complaint Registered
                    in Crime Buster Website handy!
                </p><br>

                <p style="color:white">
                    Don't be Silent! Report Criminal Activities Now! We are happy to help 24 x 7!
                </p><br>
                <br>

                <h2 style="color:white">Women Toll-Free HelpLine: 1800-345-3010</h2>
            </div>


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
<script type="text/javascript">
    function validateF() {
        var name = document.msgfrm.name.value;
        var email = document.msgfrm.email.value;
        var detail = document.msgfrm.detail.value;

        if (name == null || name == "") {
            $("#TheName").attr("value", "");
            $("#TheName").attr("placeholder", "Name Not Filled");
            $("#TheName").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheName").offset().top
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
        if (detail == null || detail == "") {
            $("#TheDetails").attr("value", "");
            $("#TheDetails").attr("placeholder", "Details must be filled out");
            $("#TheDetails").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheDetails").offset().top
            }, 'slow');
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/messageservlet",
            data: {_name: name, _email: email, _detail: detail},
            success: function (data) {
                $('form[name="msgfrm"]').trigger("reset");
                $('form[name="msgfrm"]').closest("form").hide();
                $('div[name="MessageStage"]').closest("div").text(data);
                $('div[name="MessageStage"]').closest("div").append("<br><br><a onclick='return(ReForm());'>Click Here for New Message</a>");
            }
        });
        return false;
    }
</script>
<script type="text/javascript">
    function ReForm() {
        $('form[name="msgfrm"]').closest("form").trigger("reset");
        $('form[name="msgfrm"]').closest("form").show();
        $('div[name="MessageStage"]').closest("div").text("Enter Details");
    }
</script>


</body>
</html>
