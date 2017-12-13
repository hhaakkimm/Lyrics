/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hakim
 */
public class search extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String text = request.getParameter("title");
        text = text.toLowerCase();
        try{
                String db = "jdbc:derby://localhost:1527/endterm"; 
                String user = "root"; 
                String psql = "root"; 
                Class.forName("com.mysql.jdbc.Driver"); 
                String sql = "INSERT INTO posts VALUES(?,?,?,?,?,?)"; 
                Connection con = DriverManager.getConnection(db, user, psql); 
                Statement st = con.createStatement(); 
                String sql2 = ("SELECT * FROM posts"); 
                ResultSet rs = st.executeQuery(sql2); 
                
                int i = 0; 
                while(rs.next()){ 
                    i++; 
                    String title = rs.getString("title"); 
                    title = title.toLowerCase(); 
                    int length = rs.getString("title").length(); 
                    if(text.equals(title.substring(0,text.length()))){ 
                        int id = rs.getInt("id_olen");
                        out.print("<a href='PostPage.jsp?postid=" + id + "'>" + rs.getString("title") + "</a>");
                        out.print("<br>");
                        out.print(rs.getString("main") + "<br>");
                        out.print("<small>Добавлено в:" + rs.getTimestamp("timestamp") + "</small>");    
                        out.print("<hr>");
                    }
                }
                out.println("<a href=\"javascript:history.back()\">Go Back</a>");
            }
            catch(Exception e){ 
                out.print("<br>"); 
                out.print(e); 
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
