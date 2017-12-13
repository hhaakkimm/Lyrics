/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Hakeem
 */
public class login extends HttpServlet {

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try{ 
                String db = "jdbc:derby://localhost:1527/endterm"; 
                String user = "root"; 
                String psql = "root"; 
                Class.forName("com.mysql.jdbc.Driver"); 
                Connection con = DriverManager.getConnection(db, user, psql); 
                Statement st = con.createStatement(); 
                String sql2 = ("SELECT * FROM users"); 
                ResultSet rs = st.executeQuery(sql2); 
                
                int i = 0;
                boolean exist = false; 
                int role = 0;
                int id = -1;
                while(rs.next()) { 
                    i++; 
                    if(email.equals(rs.getString("email"))){ 
                        if(password.equals(rs.getString("password"))){ 
                            exist = true; 
                            role = rs.getInt("role");
                            id = rs.getInt("id");
                            break; 
                        } 
                    } 
                } 
                
                if(exist){ 
                    HttpSession session = request.getSession(); 
                    session.setAttribute("email", email);
                    session.setAttribute("role", role);
                    session.setAttribute("id", id); 
                    if(role == 1){
                        response.sendRedirect("AdminPage.jsp"); 
                    }
                    else if(role == 0){
                        response.sendRedirect("posts.jsp"); 
                    }
                }
                else{
                    out.println("Something gets wrong!");
                    out.print("<br>");
                     out.print("<a href=\"javascript:history.back()\">Go Back</a>");     
                }
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
