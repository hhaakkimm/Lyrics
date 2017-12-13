<%-- 
    Document   : index
    Created on : Oct 18, 2017, 12:31:56 AM
    Author     : hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="bootstrap.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <br><br><br><br>
         <center><h1>Login</h1></center>
         <br><br> 
        <form action="login" action="logBean.jsp"  method="post">
            <table align="center">
                <tr>
                    <th align="right">Email : </th>
                    <td><input type="text" name="email" placeholder="email"></td>
                </tr>
                <tr>
                    <th align="right">Password : </th>
                    <td><input type="password" name="password" placeholder="password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" value="Log In" class="btn btn-primary">
                    </td>
                </tr>
                
            </table>
        </form>
         <br>
         <center>
          <td colspan="2" align="right">
                    <a href="register.jsp" class="btn btn-success">Registrate</a>
                </td>    
         </center>
    </body>
</html>
