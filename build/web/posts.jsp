<%-- 
    Document   : posts
    Created on : Dec 7, 2017, 3:09:22 AM
    Author     : hakim
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib uri="/WEB-INF/tlds/myTags.tld" prefix="s"%>--%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Өлендер</title>
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://vk.com/js/api/share.js?93" charset="windows-1251"></script>
    </head>
    <body>
        
        <% HttpSession ses = request.getSession();%>
        <% String current = (String)ses.getAttribute("email");%>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
   <div class="col-sm-1">
  <a class="navbar-brand" href="#">Өлеңдер</a>
   </div>
  <!-- Links -->
  <div class="col-sm-8">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href='profile.jsp?email=<%= current%>'>Мой профиль</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="https://vk.com/ihkim">Профиль моего братишки</a>
    </li>
    
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Categories
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href='profile.jsp?email=<%= current%>'>Мой профиль</a>
        <a class="dropdown-item" href="qazaqsha.jsp">Қазақша өлендер</a>
        <a class="dropdown-item" href="russian.jsp">Русские стихи</a>
        <a class="dropdown-item" href="english.jsp">English</a>
      </div>
    </li>
    <%--<s:show sname= "hhaakkimm@gmail.com"></s:show>--%>
  </ul>
       
  </div>
        <div class="col-sm-3">
       <div float="right">
      <form class="form-inline" action="search" method="POST">
            <input class="form-control" type="text" name="title" placeholder="Search">
            <button class="btn btn-success" type="submit">Ізде</button>
        </form>  
       </div>
         <ul class="navbar-nav">
            <li class="nav-item">
      <a class="nav-link" href="index.jsp">Профильден шығу</a>
            </li>
         </ul>
        </div>
            </nav>
            
           
        <hr>
          <div class="jumbotron jumbotron-fluid">
            <div class="container">

                <h1>Барша өлендер</h1>
                <c:set var = "now" value = "08-12-2017" />
                <fmt:parseDate value = "${now}" var = "parsedEmpDate" pattern = "dd-MM-yyyy" />
                <p>Бүгін : <c:out value = "${parsedEmpDate}" /></p>
                  </div>
          </div>
        <div class="container">
            <div float="right">
                <a type="button" class="btn btn-outline-info" href="newOlen.jsp">Жаңа қосу</a>
            </div>
            <hr>
            <table class="table xtable-hover">
            <% String db = "jdbc:derby://localhost:1527/endterm"; 
                    String user = "root"; 
                    String psql = "root"; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    String sql = "INSERT INTO posts VALUES(?,?,?,?,?)"; 
                    Connection con = DriverManager.getConnection(db, user, psql); 
                    Statement st = con.createStatement(); 
                    String sql2 = ("SELECT * FROM posts"); 
                    ResultSet rs = st.executeQuery(sql2);  %>
            <% int i = 0;
            while(rs.next()){ i++;%>
                <b><a href='PostPage.jsp?id_olen=<%= rs.getInt("id_user")%>'><%= rs.getString("title")%></a></b> <br>
                <%= rs.getString("main")%> <br>
                <% String til=null; 
                    if(rs.getString("language").equals("1"))
                    {
                        til = "Қазақша";
                    }
                    else if(rs.getString("language").equals("2"))
                    {
                        til = "Русский";
                    }
                    if(rs.getString("language").equals("3"))
                    { 
                        til = "English";
                    }
                %>
                <span class="badge badge-warning">Қосылды : <%= rs.getTimestamp("timestamp") %></span>
                
                <span class="badge badge-primary"><%=til%></span>
                <script type="text/javascript">
                    document.write(VK.Share.button()); 
                </script>
                <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11';
                      fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Share</a></div>
                <br>
                
            <% } %>
         </table>
        </div> 
    </body>
</html>
