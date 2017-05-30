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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Items;
import model.ProjectItems;
import model.Projects;

/**
 *
 * @author kanok
 */
public class setupWishListServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            Projects project = (Projects) session.getAttribute("newProject");
            ArrayList<ProjectItems> projectItem = project.getItemCollection();
            if (projectItem == null) {
                projectItem = new ArrayList<ProjectItems>();
            }
            ProjectItems pjItem = new ProjectItems();
            Items item = new Items();
            item.setItemCategoryId(1);
            item.setName(name);

            PreparedStatement selectStatement;
            selectStatement = conn.prepareStatement("Select * from items where name = ?");
            selectStatement.setString(1, name);
            ResultSet rs = selectStatement.executeQuery();
            if (rs.next()) {
                item.setItemId(rs.getInt("item_id"));

            } else {
                selectStatement = conn.prepareStatement("Select max(item_id) from items");
                ResultSet rs2 = selectStatement.executeQuery();
                if (rs2.next()) {
                    PreparedStatement insertData = conn.prepareStatement("Insert into items(name,item_category_id) values (?,?)");
                    insertData.setString(1, name);
                    insertData.setInt(2, 1);
                    insertData.executeUpdate();
                    item.setItemId(rs2.getInt("max(item_id)") + 1);
                }
            }
            System.out.println("real Item Id" + item.getItemId());
            pjItem.setItems(item);
            pjItem.setAmount(Float.parseFloat(request.getParameter("amount")));
            projectItem.add(pjItem);
            project.setItemCollection(projectItem);
            for (ProjectItems pj : project.getItemCollection()) {
                System.out.println(pj.getItems().getItemCategoryId() + " : " + pj.getItems().getName());
            }
            session.setAttribute("newProject", project);
            response.sendRedirect("dashboard-project-setup-wishlist.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(setupWishListServlet.class.getName()).log(Level.SEVERE, null, ex);
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
