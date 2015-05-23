<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head profile="http://gmpg.org/xfn/11">
    <title>Crime Buster</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <link rel="stylesheet" href="styles/layout.css" type="text/css"/>
    <link href="css/lightbox.css" rel="stylesheet"/>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/lightbox.min.js"></script>
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
                <li class="active"><a href="#">Register Complaints</a>
                    <ul>
                        <li><a href="WomenCell.jsp">Women's Cell</a></li>
                        <li><a href="GeneralReport.jsp">General Report</a></li>
                        <li><a href="NoCrimeCertificate.jsp">No Crime Certificate</a></li>
                    </ul>
                </li>
                <li><a href="PoliceTeam.jsp">Police Team</a>
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
>

<div class="wrapper col3">
    <div id="breadcrumb">
        <ul>
            <li class="first">You Are Here</li>
            <li>&#187;</li>
            <li><a href="index.jsp">Home</a></li>
            <li>&#187;</li>
            <li><a href="index.jsp">Register Complaints</a></li>
            <li>&#187;</li>
            <li class="current"><a href="NoCrimeCertificate.jsp">No Crime Certificate</a></li>
        </ul>
    </div>
</div>


<div class="wrapper col4">
    <div id="container">
        <div id="content">
            <div name="NoCrimeCertificate"><h1 style="color:white">Registration Form (No Crime Certificate)</h1></div>
            <form name="nccForm" action="nccservlet" method="post" onsubmit="return(validateF());">
                <p align="center-left">
                    <input id="TheName" type="text" placeholder="Full Name" name="name" size="100">
                </p>

                <p align="center-left">
                    <input id="TheEmail" type="text" placeholder="Email Address" name="email" size="100">
                </p>

                <p align="center-left">
                    <input id="TheAge" type="number" placeholder="Age" name="age" size="100">
                </p>

                <p align="center-left">
                    <input id="ThePhoneNumber" type="tel" placeholder="Phone Number" name="num" size="100">
                </p>

                <p align="center-left">
                    <textarea id="TheAddress" cols="98" rows="5" placeholder="Address" name="add"></textarea>
                </p>

                <div class="clear"></div>
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
            <h2 style="color:white">Sample No Crime Certificate</h2>
            <li>Issued Within 7 Days!</li>
            <img src="img/pcc.jpg" alt="Mountain View" style="width:304px;height:228px"><br><br>
            <a href="img/pcc.jpg">Click Here to View Larger Image</a>
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
        var name = document.nccForm.name.value;
        var email = document.nccForm.email.value;
        var age = document.nccForm.age.value;
        var phonenum = document.nccForm.num.value;
        var addr = document.nccForm.add.value;

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
        if (age == null || age == "" || isNaN(age) || age < 10 || age > 100) {
            $("#TheAge").attr("value", "");
            $("#TheAge").attr("placeholder", "Age Not Filled");
            $("#TheAge").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheAge").offset().top
            }, 'slow');
            return false;
        }
        if (phonenum == null || phonenum == "" || isNaN(phonenum) || phonenum.length < 10) {
            $("#ThePhoneNumber").attr("value", "");
            $("#ThePhoneNumber").attr("placeholder", "Contact Not Filled and should be of 10 digits");
            $("#ThePhoneNumber").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePhoneNumber").offset().top
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
        $.ajax({
            type: "POST",
            url: "/nccservlet",
            data: {_name: name, _email: email, _age: age, _phonenum: phonenum, _addr: addr},
            success: function (data) {
                $('form[name="nccForm"]').trigger("reset");
                $('form[name="nccForm"]').closest("form").hide();
                $('div[name="NoCrimeCertificate"]').closest("div").text(data);
                $('div[name="NoCrimeCertificate"]').append("<br><br>If Registered and you got the Reference Number, you will get your No Crime Certificate within 7 days! <br>Bring all your identity documents at your nearest Police Station within 24 hours!");
                $('div[name="NoCrimeCertificate"]').append("<br><br><br>For Nearest Police Station click on <a href='ContactPolice.jsp'> 'Contact Police'</a> section.");
                $('div[name="NoCrimeCertificate"]').closest("div").append("<br><br><br><br><a onclick='return(ReForm());'>Click Here for New Form</a>");
            }
        });
        return false;
    }
</script>
<script type="text/javascript">
    function ReForm() {
        $('form[name="nccForm"]').closest("form").trigger("reset");
        $('form[name="nccForm"]').closest("form").show();
        $('div[name="NoCrimeCertificate"]').closest("div").text("Enter Details");
    }
</script>


</body>
</html>
