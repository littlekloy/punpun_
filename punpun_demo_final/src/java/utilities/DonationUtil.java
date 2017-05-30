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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import model.Donations;
import model.Members;
import model.Projects;

/**
 *
 * @author kanok
 */
public class DonationUtil {

    private DataSource ds;
    private Connection conn;
    private PreparedStatement selectData, selectData2, selectItem, selectSupporter, selectComment, selectDonationItem, insertDonation;
    private PreparedStatement insertPunpunDonation, insertProjectDonation, insertItemDonation;

    public DonationUtil() {
    }

    public DonationUtil(DataSource ds) {
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

    public Integer punpunDonation(Integer amount, Integer donationId) {
        String cmdInsert = "Insert into punpun_donations(amount,donation_id) values (?,?)";
        try {
            insertPunpunDonation = conn.prepareStatement(cmdInsert);
            insertPunpunDonation.setInt(1, amount);
            insertPunpunDonation.setInt(2, donationId);
            System.out.println(insertPunpunDonation);
            System.out.println(insertPunpunDonation.executeUpdate());
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer projectDonation(Integer amount, Integer donationId) {
        String cmdInsert = "Insert into project_donations(amount,donation_id) values (?,?)";
        try {
            insertProjectDonation = conn.prepareStatement(cmdInsert);
            insertProjectDonation.setInt(1, amount);
            insertProjectDonation.setInt(2, donationId);
            System.out.println(insertProjectDonation);
            System.out.println(insertProjectDonation.executeUpdate());
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer itemDonation(Integer amount, Integer donationId, Integer itemId, Integer projectId) {
        String cmdInsert = "Insert into item_donations(amount,donation_id,item_id,project_id) values (?,?,?,?)";
        try {
            insertItemDonation = conn.prepareStatement(cmdInsert);
            insertItemDonation.setInt(1, amount);
            insertItemDonation.setInt(2, donationId);
            insertItemDonation.setInt(3, itemId);
            insertItemDonation.setInt(3, projectId);
            System.out.println(insertItemDonation);
            System.out.println(insertItemDonation.executeUpdate());
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer donateTransaction(Members member, Projects project) {
        String cmd = "Insert into donations(member_id,project_id) values (?,?)";
        try {
            insertDonation = conn.prepareStatement(cmd, Statement.RETURN_GENERATED_KEYS);
            insertDonation.setInt(2, project.getProjectId());
            insertDonation.setInt(1, member.getMemberId());
            System.out.println(insertDonation);
            System.out.println(insertDonation.executeUpdate());
            ResultSet generatedKeys = insertDonation.getGeneratedKeys();
            if (generatedKeys.next()) {
                generatedKeys.getInt(1);
                System.out.print(generatedKeys.getInt(1));
                return generatedKeys.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer setAmount(Integer amount, Integer donationId) {
        try {
            String cmd = "UPDATE donations SET amount = ? WHERE donation_id = ?";
            PreparedStatement updateData = conn.prepareStatement(cmd);
            updateData.setInt(1, amount);
            updateData.setInt(2, donationId);
            System.out.println(updateData);
            return updateData.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Donations findDonationtById(Integer donationId) {
        try {
            String cmd = "SELECT * from donations where donation_id = ?;";
            PreparedStatement selectData = conn.prepareStatement(cmd);
            selectData.setInt(1, donationId);
            System.out.print(selectData);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Donations donation = new Donations();
                donation.setAmount(rs.getFloat("amount"));
                System.out.println("Amount : " + donation.getAmount());
                donation.setDate(rs.getDate("date"));
                Members members = new Members(rs.getInt("member_id"));
                donation.setMemberId(members);

                ProjectUtil projectUtil = new ProjectUtil(ds);
                projectUtil.connect();
                Projects project = projectUtil.findProjectById(rs.getInt("project_id"));

                donation.setProjectId(project);
                donation.setStatus(rs.getString("status"));
                donation.setDonationId(rs.getInt("donation_id"));
                donation.setMethod(rs.getString("method"));

                return donation;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Donations> findDonationByMemberId(Integer memberId) {
        try {
            ArrayList<Donations> donations = new ArrayList<Donations>();
            String cmd = "SELECT * from donations where member_id = ?;";
            PreparedStatement selectData = conn.prepareStatement(cmd);
            selectData.setInt(1, memberId);
            System.out.print(selectData);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Donations donation = this.findDonationtById(rs.getInt("donation_id"));
                donations.add(donation);
                System.out.println("From Funded " + donations.get(0).getAmount());
            }
            return donations;
        } catch (SQLException ex) {
            Logger.getLogger(DonationUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
