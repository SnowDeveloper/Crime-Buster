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

<body>

<div>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div>
            <a class="navbar-brand" href="admin_login.jsp" style="color:#E60498">Crime Buster - Admin Login</a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <div>
                <a target="_blank" class="navbar-brand" href="index.jsp" style="color:white">View Website</a>
            </div>
        </ul>

    </nav>


    <!-- /#page-wrapper -->


    <div class="jumbotron" style="text-align: center">
        <div name="AdminLoginStage"><h1 style="color:black">Admin Login</h1></div>
        <form name="adminloginform" action="adminloginservlet" method="post" onsubmit="return(validateF());">
            <p align="center-left">
                <input id="TheName" type="text" placeholder="Your Username" name="name">
            </p>

            <p align="center-left">
                <input id="ThePassword" type="password" placeholder="Your Password" name="pwd">
            </p>

            <div class="row">
                <div style="text-align: center;">
                    <button type="submit">Login</button>
                </div>
            </div>
        </form>
    </div>

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    function validateF() {
        var name = document.adminloginform.name.value;
        var pwd = document.adminloginform.pwd.value;

        if (name == null || name == "") {
            $("#TheName").attr("value", "");
            $("#TheName").attr("placeholder", "Username Not Filled");
            $("#TheName").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#TheName").offset().top
            }, 'slow');
            return false;
        }
        if (pwd == null || pwd == "") {
            $("#ThePassword").attr("value", "");
            $("#ThePassword").attr("placeholder", "Password Not Filled");
            $("#ThePassword").addClass("placeholder");
            $('html, body').animate({
                scrollTop: $("#ThePassword").offset().top
            }, 'slow');
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/adminloginservlet",
            data: {_name: name, _pwd: pwd},
            success: function (data) {
                console.log(data);
                document.cookie = "admincrimebuster" + "=" + data;
                location.href = "admin_home.jsp";
            },
            error: function (err) {
                console.log(err);
                $('div[name="AdminLoginStage"]').append("<p style='color: red'>Invalid UserID or Password entered!</p>");
                $('form[name="adminloginform"]').closest("form").trigger("reset");
                $('form[name="adminloginform"]').closest("form").show();
            }
        });
        return false;
    }
</script>
</body>

</html>

