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
import model.Members;
import model.Projects;
import utilities.DonationUtil;

/**
 *
 * @author kanok
 */
public class donationServlet extends HttpServlet {

    private PreparedStatement insertPunpunDonation, insertProjectDonation, insertItemDonation, insertData, insertDonation;
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
            String to_punpun = request.getParameter("To_punpun");
            String whole_project = request.getParameter("whole-project");
            String per_item = request.getParameter("per_item");
            HttpSession session = request.getSession();
            Members member = (Members) session.getAttribute("member");
            Projects project = (Projects) session.getAttribute("project");
            String cmd = "Insert into donations values (?,?,?,?,?)";
            insertDonation = conn.prepareStatement(cmd);
            ServletContext context = getServletContext();
            DataSource ds = (DataSource) context.getAttribute("dataSource");
            DonationUtil donationUtil = new DonationUtil(ds);
            donationUtil.connect();
            int allAmount = 0;
            int id = donationUtil.donateTransaction(member, project);
            if (to_punpun != null) {
                String amount = request.getParameter("amount");
                String custom_amount = request.getParameter("custom_amount");
                int punpun_amount = punpunDonation(amount, custom_amount);
                donationUtil.punpunDonation(punpun_amount, id);
                allAmount += punpun_amount;

            }
            if (whole_project != null) {
                String amount = request.getParameter("amount");
                String custom_amount = request.getParameter("custom_amount");
                int project_amount = punpunDonation(amount, custom_amount);
                donationUtil.projectDonation(project_amount, id);
                allAmount += project_amount;

            }
            if (per_item != null) {
                String[] item_id = request.getParameterValues("per-item");

                for (String i : item_id) {
                    String amount = request.getParameter(i);
                    String amount_item = request.getParameter("amount_item_" + i);
                    int item_amount = ItemDonation(amount, amount_item);
                    donationUtil.itemDonation(item_amount, id, Integer.parseInt(i));
                    allAmount += item_amount;
                }

            }
            out.print(allAmount);
            System.out.println(donationUtil.setAmount(allAmount, id));
            session.setAttribute("allAmount", allAmount);
            System.out.println(member);
        } catch (SQLException ex) {
            Logger.getLogger(donationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("payment.jsp");
    }

    public Integer punpunDonation(String amount, String custom_amount) {
        int amount_;
        if (amount.equals("on")) {
            amount_ = Integer.parseInt(custom_amount);
        } else {
            amount_ = Integer.parseInt(amount);
        }
        System.out.println("To punpun" + amount_);
        return amount_;
    }

    public Integer projectDonation(String amount, String custom_amount) {
        int amount_;
        if (amount.equals("on")) {
            amount_ = Integer.parseInt(custom_amount);
        } else {
            amount_ = Integer.parseInt(amount);
        }
        System.out.println("To project" + amount_);
        return amount_;
    }

    public Integer ItemDonation(String item, String custom_amount) {

        if (item.equals("on")) {
            System.out.println("To item" + custom_amount);
            return Integer.parseInt(custom_amount);
        } else {
            System.out.println("To item" + item);
            return Integer.parseInt(item);
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
