/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Members;
import model.Projects;

/**
 *
 * @author kanok
 */
public class setupInfoServlet extends HttpServlet {

    private PreparedStatement insertData;
    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String projectName = request.getParameter("projectName");
            String category = request.getParameter("category");
            Integer duration = Integer.parseInt(request.getParameter("duration"));
            Float amount = Float.parseFloat(request.getParameter("amount"));
            String description = request.getParameter("description");
            HttpSession session = request.getSession();
            Projects project = (Projects) session.getAttribute("newProject");
            if (project == null) {
                project = new Projects();

                project.setBudget(amount);
                project.setName(projectName);
                project.setFundingDuration(duration);
                project.setShortDescription(description);
                project.setProjectCategoryId(Integer.parseInt(category));
                String cmd = "Insert into projects(name,funding_duration,budget,project_category_id,short_description) values (?,?,?,?,?)";
                insertData = conn.prepareStatement(cmd, Statement.RETURN_GENERATED_KEYS);
                insertData.setString(1, projectName);
                insertData.setInt(2, duration);
                insertData.setFloat(3, amount);
                insertData.setInt(4, Integer.parseInt(category));
                insertData.setString(5, description);
                System.out.println(insertData);
                System.out.println(insertData.executeUpdate());
                ResultSet generatedKeys = insertData.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedKeys.getInt(1);
                    System.out.print(generatedKeys.getInt(1));
                    int projectId = generatedKeys.getInt(1);
                    project.setProjectId(projectId);
                }
            } else {
                project.setBudget(amount);
                project.setName(projectName);
                project.setShortDescription(description);
                project.setFundingDuration(duration);
                project.setProjectCategoryId(Integer.parseInt(category));
            }
            project.setProjectOwner((Members) session.getAttribute("member"));
            System.out.println("project : " + project);
            session.setAttribute("newProject", project);
            response.sendRedirect("dashboard-project-setup-info.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(setupInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
