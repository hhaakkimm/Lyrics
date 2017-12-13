<%-- 
    Document   : logBean
    Created on : Dec 8, 2017, 12:58:47 PM
    Author     : hakim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BeanBean</title>
    </head>
    <body>
        
        <jsp:useBean id="one" class="beans.UserBean" scope="session">
            <jsp:setProperty name="one" property="*"/>
        </jsp:useBean>
        <jsp:getProperty name="one" property="uname"/>
    </body>
</html>
