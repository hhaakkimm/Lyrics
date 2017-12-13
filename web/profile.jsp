<%-- 
    Document   : profile
    Created on : Dec 7, 2017, 8:16:25 PM
    Author     : hakim
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Жеке парақша</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        
            
            <% HttpSession ses = request.getSession();%>
            <% int id = (Integer)ses.getAttribute("id");%>
            
                
               <div class="jumbotron jumbotron-fluid">
                <div class="container">
                     <div class="col-sm-9">
                         <td><a href="javascript:history.back()">Back</a></td></div>
                     <div class="col-sm-3">
                       <a href="UserEdit.jsp">Изменить пароль</a>
                     </div>
                           <h1> Сіздің шығарылымдарыныз: </h1>
                       
                      </div>
              </div>
               <div class="container">
                   
                <% String db = "jdbc:derby://localhost:1527/endterm"; 
                    String user = "root"; 
                    String psql = "root"; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    String sql = "INSERT INTO posts VALUES(?,?,?,?,?,?)"; 
                    Connection con = DriverManager.getConnection(db, user, psql); 
                    Statement st = con.createStatement(); 
                    String sql2 = ("SELECT * FROM posts"); 
                    ResultSet rs = st.executeQuery(sql2);  %>
                
                <% int i=0;
                while(rs.next()){ i++;%>
                    <% if(id == rs.getInt("id_user")){%>
                    <div id="accordion">
                        <div class="card">
                          <div class="card-header">
                            <a class="card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                              <%= rs.getString("title")%>
                            </a>
                          </div>
                          <div id="collapseOne" class="collapse show">
                            <div class="card-body">
                                <%= rs.getString("main") %>
                            </div>
                          </div>
                        </div>
                      
                    <%}%>
                <%}%>
               </div>
             </body>
            <footer>
                <center>
                    <a href="newOlen.jsp">Жаңа қосу</a> <br>
                    <a href="javascript:history.back()">Go Back</a>
                </center>
            </footer>
            
    
</html>
