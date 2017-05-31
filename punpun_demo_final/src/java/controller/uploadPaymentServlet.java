/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utilities.DonationUtil;

/**
 *
 * @author kanok
 */
public class uploadPaymentServlet extends HttpServlet {

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
            boolean isMultipart;
            String filePath;

            // Get the file location where it would be stored.
            filePath = getServletContext().getInitParameter("file-upload");

            isMultipart = ServletFileUpload.isMultipartContent(request);

            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            String uploadFolder = ("D:\\Dropbox\\CharityWeb_Kloy_Ice\\Implemented_Sytem\\Code\\punpun_final\\punpun_\\punpun_demo_final\\web\\assets\\img\\payment");
            out.print(uploadFolder);
            ServletContext context = getServletContext();
            DataSource ds = (DataSource) context.getAttribute("dataSource");
            DonationUtil donationUtil = new DonationUtil(ds);
            donationUtil.connect();
            String id = request.getParameter("id");
            out.print("ID : " + id);
            Donations donation = donationUtil.findDonationtById(Integer.parseInt(id));
            out.print(donation);
            for (FileItem item : multiparts) {
                if (!item.isFormField()) {
                    String name = new File(item.getName()).getName();
                    System.out.println(uploadFolder + File.separator + donation.getDonationId() + ".jpg");
                    item.write(new File(uploadFolder + File.separator + donation.getDonationId() + ".jpg"));
                }
            }
            response.sendRedirect("success-payment.jsp");
        } catch (Exception ex) {
            Logger.getLogger(uploadPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
