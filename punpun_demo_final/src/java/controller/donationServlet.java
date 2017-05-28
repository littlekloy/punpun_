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
public class donationServlet extends HttpServlet {

    private PreparedStatement insertPunpunDonation, insertProjectDonation, insertItemDonation, insertData;
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
            if (to_punpun != null) {
                int amount;
                String punpun = request.getParameter("punpun");
                if (punpun.equals("on")) {
                    String amount_punpun = request.getParameter("amount_punpun");
                    out.print(amount_punpun);
                    amount = Integer.parseInt(amount_punpun);
                } else {
                    amount = Integer.parseInt(punpun);
                }
                out.print("To punpun" + amount);
                String cmdInsert = "Insert into donations(amount,type,method,member_id,project_id) values (?,?,?,?,?)";
                insertPunpunDonation = conn.prepareStatement(cmdInsert);
                insertPunpunDonation.setInt(1, amount);
                insertPunpunDonation.setString(2, "punpun");
                insertPunpunDonation.setString(3, "cash");
                insertPunpunDonation.setInt(4, member.getMemberId());
                insertPunpunDonation.setInt(5, project.getProjectId());
                System.out.println(insertPunpunDonation);
                System.out.println(insertPunpunDonation.executeUpdate());
            }
            if (whole_project != null) {
                String project_ = request.getParameter("project");
                int amount;
                if (project_.equals("on")) {
                    String amount_project = request.getParameter("amount_project");
                    out.print("whole" + amount_project);
                    amount = Integer.parseInt(amount_project);
                } else {
                    amount = Integer.parseInt(project_);
                }
                out.print("To project" + amount);
                String cmdInsert = "Insert into donations(amount,type,method,member_id,project_id) values (?,?,?,?,?)";
                insertProjectDonation = conn.prepareStatement(cmdInsert);
                insertProjectDonation.setInt(1, amount);
                insertProjectDonation.setString(2, "project");
                insertProjectDonation.setString(3, "cash");
                insertProjectDonation.setInt(4, member.getMemberId());
                insertProjectDonation.setInt(5, project.getProjectId());
                System.out.println(insertProjectDonation);
                System.out.println(insertProjectDonation.executeUpdate());
            }
            if (per_item != null) {
                String[] item_id = request.getParameterValues("per-item");
                int allAmount = 0;
                for (String i : item_id) {
                    out.print("<br>" + i);
                    if (request.getParameter(i).equals("on")) {
                        String amount_item = request.getParameter("amount_item");
                        out.print("item Amount :" + amount_item);
                        allAmount += Integer.parseInt(amount_item);
                    } else {
                        String amount = request.getParameter(i);
                        out.print("item :" + amount);
                        allAmount += Integer.parseInt(amount);
                    }
                }
                String cmdInsert = "Insert into donations(amount,type,method,member_id,project_id) values (?,?,?,?,?)";
                insertItemDonation = conn.prepareStatement(cmdInsert);
                insertItemDonation.setInt(1, allAmount);
                insertItemDonation.setString(2, "item");
                insertItemDonation.setString(3, "cash");
                insertItemDonation.setInt(4, member.getMemberId());
                insertItemDonation.setInt(5, project.getProjectId());
                System.out.println(insertItemDonation);
                System.out.println(insertItemDonation.executeUpdate());

                PreparedStatement selectData;
                String cmdSelect = "Select max(donation_id) from donations";
                selectData = conn.prepareStatement(cmdSelect);
                ResultSet rs = selectData.executeQuery();
                while (rs.next()) {
                    item_id = request.getParameterValues("per-item");

                    for (String i : item_id) {
                        int item_amount = 0;
                        if (request.getParameter(i).equals("on")) {
                            String amount_item = request.getParameter("amount_item");
                            out.print("item Amount :" + amount_item);
                            item_amount = Integer.parseInt(amount_item);
                        } else {
                            String amount = request.getParameter(i);
                            out.print("item :" + amount);
                            item_amount = Integer.parseInt(amount);
                        }
                        String cmdInsert2 = "Insert into item_donations(donation_id,amount,project_id,item_id) values (?,?,?,?)";
                        insertData = conn.prepareStatement(cmdInsert2);
                        insertData.setInt(1, rs.getInt("max(donation_id)"));
                        insertData.setInt(2, item_amount);
                        insertData.setInt(3, project.getProjectId());
                        insertData.setString(4, i);

                        System.out.println(insertData);
                        System.out.println(insertData.executeUpdate());
                    }

                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(donationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
