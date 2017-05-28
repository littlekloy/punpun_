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
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.Members;
import model.Notifications;
import utilities.MemberUtil;
import utilities.NotificationUtil;

/**
 *
 * @author kanok
 */
public class loginServlet extends HttpServlet {

    private Connection conn;
    private PreparedStatement selectData;

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
            String user = request.getParameter("email");
            String pass = request.getParameter("password");
            HttpSession session = request.getSession();

            ServletContext context = getServletContext();
            DataSource ds = (DataSource) context.getAttribute("dataSource");

            MemberUtil memberUtil = new MemberUtil(ds);
            memberUtil.connect();
            Members member = memberUtil.authenicate(user, pass);
            System.out.println(member);

            NotificationUtil notiUtil = new NotificationUtil(ds);
            notiUtil.connect();
            ArrayList<Notifications> notifications = new ArrayList<Notifications>();
            notifications = notiUtil.findUncheckNotificationById(member.getMemberId());
            System.out.println(notifications.size());
            System.out.println(notifications);
            session.setAttribute("countNoti", notifications.size());
            session.setAttribute("uncheckNoti", notifications);
            if (member == null) {
                response.sendRedirect("test.html");
            } else {
                session.setAttribute("member", member);
                response.sendRedirect("index.jsp");
            }
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
