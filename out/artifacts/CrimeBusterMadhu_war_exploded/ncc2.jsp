<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ncc" class="pkg.ncc_init">

    <jsp:setProperty name="ncc" property="refn"/>

</jsp:useBean>
<%
    int i = ncc.remove();
    if (i > 0) {
        //out.print("<br>Inserted");
        request.setAttribute("register", "success");

        RequestDispatcher rd = request.getRequestDispatcher("ncc1.jsp");
        rd.forward(request, response);
    } else {
        request.setAttribute("register", "failure");

        RequestDispatcher rd = request.getRequestDispatcher("ncc1.jsp");
        rd.forward(request, response);
    }
%>

</body>
</html>  