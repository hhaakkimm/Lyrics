<%-- 
    Document   : PostPage
    Created on : Dec 7, 2017, 3:26:24 AM
    Author     : hakim
--%>

<%@page import="java.io.Serializable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hakeem</title>
    </head>
    <body>
        
        <% int userid = -1;%>
        <% String postid = request.getParameter("id_olen");%>
        <% String useremail = "";%>
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
        <% String id = rs.getInt("id_olen")+"";%>
            <%if(postid.equals(id)){%>
                <% userid = rs.getInt("id_user");%>
                <b><%= rs.getString("title")%></b> <br>
                <%= rs.getString("main")%> тг <br>
                <small>Қосылды: <%= rs.getTimestamp("timestamp") %></small><br>
                <% HttpSession ses = request.getSession();%>
                <% useremail = (String)ses.getAttribute("email");%>
                <% int currentid = (Integer)ses.getAttribute("id");%>
                <% if(currentid == userid) {%>
                    <a href='PostEdit.jsp?postid=<%= rs.getInt("id")%>'>Редактировать объявление</a>
                <% } %> 
            <% } %>
        <% } %>
        <br>
        
        <% ObjectInputStream ois = new ObjectInputStream(new FileInputStream("C:/Users/tassa/Documents/NetBeansProjects/MarketPlace/comments.ser"));%>
        <%// ArrayList<comments> cm = (ArrayList<comments>)ois.readObject();%>
          
        
        <form action="newcomment" method="POST">
            <input type="text" name="comment" placeholder="Введите коммент">
            <input type=hidden name="postid" value="<%=postid%>">
            <input type=hidden name="useremail" value="<%=useremail%>">
            <input type="submit" value="Отправить">
        </form>
        <a href="javascript:history.back()">Go Back</a>
    </body>
</html>
