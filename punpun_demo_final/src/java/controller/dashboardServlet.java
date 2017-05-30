/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.Donations;
import model.Projects;
import utilities.DonationUtil;
import utilities.ProjectUtil;

/**
 *
 * @author kanok
 */
public class dashboardServlet extends HttpServlet {

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
            Integer id = Integer.parseInt(request.getParameter("id"));
            ServletContext context = getServletContext();
            DataSource ds = (DataSource) context.getAttribute("dataSource");

            ProjectUtil projectUtil = new ProjectUtil(ds);
            projectUtil.connect();

            ArrayList<Projects> projects = projectUtil.findOwnerProject(id);
            session.setAttribute("yoursProject", projects);
            ArrayList<Projects> draft = new ArrayList<Projects>();
            ArrayList<Projects> pending = new ArrayList<Projects>();
            ArrayList<Projects> accept = new ArrayList<Projects>();
            ArrayList<Projects> eject = new ArrayList<Projects>();
            ArrayList<Projects> delete = new ArrayList<Projects>();
            ArrayList<Projects> finish = new ArrayList<Projects>();
            for (Projects project : projects) {
                String status = project.getStatus();
                if (status.equals("draft")) {
                    draft.add(project);
                } else if (status.equals("pending")) {
                    pending.add(project);
                } else if (status.equals("accept")) {
                    accept.add(project);
                } else if (status.equals("eject")) {
                    eject.add(project);
                } else if (status.equals("delete")) {
                    delete.add(project);
                } else if (status.equals("finish")) {
                    finish.add(project);
                }
            }

            session.setAttribute("finish", finish);
            session.setAttribute("draft", draft);
            session.setAttribute("pending", pending);
            session.setAttribute("accept", accept);
            session.setAttribute("eject", eject);
            session.setAttribute("delete", delete);
            DonationUtil donationUtil = new DonationUtil(ds);
            donationUtil.connect();
            ArrayList<Donations> fundedDonation = donationUtil.findDonationByMemberId(id);
            session.setAttribute("fundedDonations", fundedDonation);

            System.out.println("From finish : " + finish);
            System.out.println("From draft : " + draft);
            System.out.println("From pending : " + pending);
            System.out.println("From accept : " + accept);
            System.out.println("From eject : " + eject);
            System.out.println("From delete : " + delete);
            donationUtil.closeConnection();
            response.sendRedirect("dashboard.jsp");
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
