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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.Donations;
import utilities.DonationUtil;

/**
 *
 * @author kanok
 */
public class paymentServlet extends HttpServlet {

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
            String method = request.getParameter("method");
            PreparedStatement update = conn.prepareStatement("UPDATE donations SET method = ? WHERE donation_id = ?");
            update.setString(1, method);
            ServletContext context = getServletContext();
            DataSource ds = (DataSource) context.getAttribute("dataSource");
            DonationUtil donationUtil = new DonationUtil(ds);
            donationUtil.connect();
            HttpSession session = request.getSession();
            PreparedStatement selectData = conn.prepareStatement("SELECT MAX(donation_id) as id from donations");
            ResultSet rs = selectData.executeQuery();
            String url = "index.jsp";
            if (rs.next()) {
                Donations donation = donationUtil.findDonationtById(rs.getInt("id"));
                update.setString(2, rs.getString("id"));
                url = "payment-processing.jsp?donationId=" + rs.getString("id");
                System.out.println(donation);
                session.setAttribute("donationForCHKout", donation);
            }
            out.print(update);
            out.print(update.executeUpdate());

            response.sendRedirect(url);

        } catch (SQLException ex) {
            Logger.getLogger(paymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
