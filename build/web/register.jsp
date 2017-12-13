<%-- 
    Document   : register
    Created on : Oct 20, 2017, 12:15:52 PM
    Author     : hakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrate</title>
        <link href="bootstrap.css" type="text/css" rel="stylesheet">
    </head>
      <body>
        <br><br><br><br>
         <center><h1>Registrate</h1></center>
         <br><br> 
        <form action="registration" method="post">
            <table align="center">
                <tr>
                    <td colspan="2" align="right">
                        ${error}
                    </td>
                </tr>
                <tr>
                    <th align="right">E-mail : </th>
                    <td><input type="text" name="email" placeholder="email"></td>
                </tr>
                <tr>
                    <th align="right">Password : </th>
                    <td><input type="password" name="userpass" placeholder="password"></td>
                </tr>
                <tr>
                    <th align="right">Confirm Password : </th>
                    <td><input type="password" name="userpass1" placeholder="password"></td>
                </tr>
                

                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" value="Registrate" class="btn btn-primary">
                    </td>
                </tr>
                
                 
            </table>
        </form>
         <br>
         <center>
          <td colspan="2" align="right">
                    <a href="index.jsp" class="btn btn-success">Login</a>
          </td>   
         </center>
    </body>
</html>
