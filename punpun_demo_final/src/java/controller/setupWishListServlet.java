/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

            Projects project = (Projects) session.getAttribute("newProject");
            ArrayList<ProjectItems> projectItem = project.getItemCollection();
            if (projectItem == null) {
                projectItem = new ArrayList<ProjectItems>();
            }
            ProjectItems pjItem = new ProjectItems();
            Items item = new Items();
            item.setItemCategoryId(1);
            item.setName(request.getParameter("name"));
            pjItem.setItems(item);
            pjItem.setAmount(Float.parseFloat(request.getParameter("amount")));
            projectItem.add(pjItem);
            System.out.println(projectItem.get(0).getAmount());
            project.setItemCollection(projectItem);
            System.out.println(project.getItemCollection().get(0).getItems().getItemCategoryId() + " : " + project.getItemCollection().get(0).getItems().getName());
            session.setAttribute("newProject", project);
            response.sendRedirect("dashboard-project-setup-wishlist.jsp");
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
