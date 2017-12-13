<%-- 
    Document   : qazaqsha
    Created on : Dec 7, 2017, 7:35:11 PM
    Author     : hakim
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>English poems</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://vk.com/js/api/share.js?93" charset="windows-1251"></script>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid">
  <div class="container">
  
      <h1>English poems</h1><br><br>
         <td><a href="javascript:history.back()">Back</a></td>
        </div>
</div>
        <div class="container">
        <% HttpSession ses = request.getSession();%>
        <% String current = (String)ses.getAttribute("email");%>
        <% String db = "jdbc:derby://localhost:1527/endterm"; 
                String user = "root"; 
                String psql = "root"; 
                Class.forName("com.mysql.jdbc.Driver"); 
                String sql = "INSERT INTO posts VALUES(?,?,?,?,?,?)"; 
                Connection con = DriverManager.getConnection(db, user, psql); 
                Statement st = con.createStatement(); 
                String sql2 = ("SELECT * FROM posts"); 
                ResultSet rs = st.executeQuery(sql2);  %>
        <% int i = 0;
        while(rs.next()){ i++;%>
        <% if(rs.getString("language").equals("3")){%>
        <%= rs.getString("title")%><br><br>
        <%= rs.getString("main")%><br>
                <span class="badge badge-warning">Added : <%= rs.getTimestamp("timestamp") %></span>
                <span class="badge badge-primary">English</span>
                <script type="text/javascript">
                    document.write(VK.Share.button()); 
                </script>
                <hr>
            <% } %>   
        <% } %>
        </div>
    </body>
</html>
