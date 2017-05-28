/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import model.Notifications;

/**
 *
 * @author kanok
 */
public class NotificationUtil {

    private DataSource ds;
    private Connection conn;
    private PreparedStatement insertData, updateData;
    private PreparedStatement selectData;

    public NotificationUtil() {
    }

    public NotificationUtil(DataSource ds) {
        this.ds = ds;
    }

    public void connect() {
        try {
            this.conn = ds.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Notifications> findAllNotification(Integer id) {
        String cmd = "select * from notifications where member_id = ?";
        ArrayList<Notifications> notifications = new ArrayList<Notifications>();
        try {
            selectData = conn.prepareStatement(cmd);
            selectData.setInt(1, id);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Notifications noti = new Notifications();
                noti.setNotificationId(rs.getInt("notification_id"));
                noti.setActor(rs.getString("actor"));
                noti.setAction(rs.getString("action"));
                noti.setDetail(rs.getString("detail"));
                noti.setTimestamp(rs.getTimestamp("timestamp"));
                noti.setChecked(rs.getInt("checked"));
                noti.setMemberId(rs.getInt("member_id"));
                notifications.add(noti);
            }
            System.out.println(notifications);
            return notifications;

        } catch (SQLException ex) {
            Logger.getLogger(NotificationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<Notifications> findUncheckNotificationById(Integer id) {
        String cmd = "select * from notifications where member_id = ? and checked = 0";
        ArrayList<Notifications> notifications = new ArrayList<Notifications>();
        try {
            selectData = conn.prepareStatement(cmd);
            selectData.setInt(1, id);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Notifications noti = new Notifications();
                noti.setNotificationId(rs.getInt("notification_id"));
                noti.setActor(rs.getString("actor"));
                noti.setAction(rs.getString("action"));
                noti.setDetail(rs.getString("detail"));
                noti.setTimestamp(rs.getTimestamp("timestamp"));
                noti.setChecked(rs.getInt("checked"));
                noti.setMemberId(rs.getInt("member_id"));
                notifications.add(noti);
            }
            System.out.println(notifications);
            return notifications;

        } catch (SQLException ex) {
            Logger.getLogger(NotificationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Integer checkoutNotifacation(Integer id) {
        String cmd = "update notifications set checked = 1 where member_id = ?";
        try {
            updateData = conn.prepareStatement(cmd);
            updateData.setInt(1, id);
            return updateData.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NotificationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
