<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="admin_FIRtypelist" class="pkg.admin_FIRtypelist_init">

    <jsp:setProperty name="admin_FIRtypelist" property="*"/>

</jsp:useBean>
<%
    int i = admin_FIRtypelist.register();
    if (i > 0) {
        //out.print("<br>Inserted");
        request.setAttribute("register", "success");

        RequestDispatcher rd = request.getRequestDispatcher("admin_FIRtypelist1.jsp");
        rd.forward(request, response);
    } else {
        request.setAttribute("register", "failure");

        RequestDispatcher rd = request.getRequestDispatcher("admin_FIRtypelist1.jsp");
        rd.forward(request, response);
    }
%>
</body>
</html>