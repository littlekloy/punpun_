/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import model.Comments;
import model.Items;
import model.Members;
import model.ProjectItems;
import model.Projects;
import model.Supporter;

/**
 *
 * @author kanok
 */
public class ProjectUtil implements Serializable {

    private DataSource ds;
    private Connection conn;
    private PreparedStatement selectData, selectData2, selectItem, selectSupporter, selectComment, selectDonationItem;

    public ProjectUtil() {
    }

    public ProjectUtil(DataSource ds) {
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

    public ArrayList<Projects> findAllProjects() {
        String cmd = "select * from projects";
        ArrayList<Projects> projects = new ArrayList<Projects>();
        try {
            selectData = conn.prepareStatement(cmd);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Projects project = new Projects();
                project.setProjectId(rs.getInt("project_id"));
                project.setName(rs.getString("name"));
                project.setLocation(rs.getString("location"));
                project.setFundingDuration(rs.getInt("funding_duration"));
                project.setBudget(rs.getFloat("budget"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setShortDescription(rs.getString("short_description"));
                project.setStory(rs.getString("story"));
                project.setStatus(rs.getString("status"));
                project.setProjectCategoryId(rs.getInt("project_category_id"));

                //GET SUPPORTER
                String cmd_supporter_1 = "SELECT members.member_id, first_name, last_name, sum(amount) FROM donations ";
                String cmd_supporter_2 = "left join members on members.member_id = donations.member_id  ";
                String cmd_supporter_3 = "where type In ('project','item') and project_id = ? group by member_id";
                selectSupporter = conn.prepareStatement(cmd_supporter_1 + cmd_supporter_2 + cmd_supporter_3);
                selectSupporter.setInt(1, rs.getInt("project_id"));
                ArrayList<Supporter> supporter = new ArrayList<Supporter>();
                ResultSet rsSupporter = selectSupporter.executeQuery();
                Double funded = 0.0;
                while (rsSupporter.next()) {
                    Supporter sup = new Supporter();
                    sup.setMemberId(rsSupporter.getInt("member_id"));
                    sup.setFirstName(rsSupporter.getString("first_name"));
                    sup.setLastName(rsSupporter.getString("last_name"));
                    sup.setFunded(rsSupporter.getInt("sum(amount)"));
                    supporter.add(sup);
                    funded += rsSupporter.getInt("sum(amount)");
                    System.out.println("funded" + rs.getInt("project_id") + funded);
                }
                System.out.println(supporter);
                project.setSupporter(supporter);
                project.setSupporterSize(supporter.size());
                project.setFunded(funded);
                DecimalFormat df = new DecimalFormat();
                df.applyPattern("0.00");
                String percent = df.format((funded / rs.getFloat("budget") * 100));
                System.out.println(Float.valueOf(percent));
                project.setPercent(Float.valueOf(percent));
                projects.add(project);
            }
            return projects;
        } catch (SQLException ex) {
            Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    public Projects findProjectById(Integer id) {
        String cmd = "select * from projects where project_id = ?";
        Projects project = new Projects();
        String cmd_team = "SELECT * FROM  members right join member_team_pivot ";
        String cmd_team_on = "on members.member_id = member_team_pivot.member_id where team_id = ?";
        String cmd_item = "SELECT * FROM  items right join project_items ";
        String cmd_item_on = "on items.item_id = project_items.item_id where project_id = ?";
        try {
            selectData = conn.prepareStatement(cmd);
            selectData2 = conn.prepareStatement(cmd_team + cmd_team_on);
            selectItem = conn.prepareStatement(cmd_item + cmd_item_on);
            selectData.setInt(1, id);
            ResultSet rs = selectData.executeQuery();
            if (rs.next()) {
                project.setProjectId(rs.getInt("project_id"));
                project.setName(rs.getString("name"));
                project.setLocation(rs.getString("location"));
                project.setFundingDuration(rs.getInt("funding_duration"));
                project.setBudget(rs.getFloat("budget"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setShortDescription(rs.getString("short_description"));
                project.setStory(rs.getString("story"));
                project.setStatus(rs.getString("status"));
                project.setProjectCategoryId(rs.getInt("project_category_id"));

                project.setTeamId(rs.getInt("team_id"));
                //GET TEAM MEMBER
                selectData2.setInt(1, rs.getInt("team_id"));
                System.out.println(selectData2);
                ResultSet rs2 = selectData2.executeQuery();
                ArrayList<Members> team = new ArrayList<Members>();
                while (rs2.next()) {
                    Members member = new Members();
                    member.setUsername(rs2.getString("username"));
                    member.setEmail(rs2.getString("email"));
                    member.setPassword(rs2.getString("password"));
                    member.setFirstName(rs2.getString("first_name"));
                    member.setLastName(rs2.getString("last_name"));
                    member.setMemberId(rs2.getInt("member_id"));
                    member.setPosition(rs2.getString("position"));
                    team.add(member);
                    System.out.println(member);
                }
                project.setTeamCollection(team);
                //GET PROJECT ITEM
                selectItem.setInt(1, rs.getInt("project_id"));
                ResultSet rsItem = selectItem.executeQuery();
                System.out.println(selectItem);
                ArrayList<ProjectItems> project_item = new ArrayList<ProjectItems>();
                while (rsItem.next()) {
                    ProjectItems projectItem = new ProjectItems(rs.getInt("project_id"), rsItem.getInt("item_id"));
                    Items item = new Items();
                    item.setItemId(rsItem.getInt("item_id"));
                    item.setName(rsItem.getString("name"));
                    projectItem.setItems(item);
                    projectItem.setAmount(rsItem.getFloat("amount"));
                    String cmd_itemDonation = "select sum(amount) as funded from item_donations where project_id = ? and item_id = ?";
                    selectDonationItem = conn.prepareStatement(cmd_itemDonation);
                    selectDonationItem.setInt(1, rs.getInt("project_id"));
                    selectDonationItem.setInt(2, rsItem.getInt("item_id"));
                    ResultSet rsDonation = selectDonationItem.executeQuery();
                    while (rsDonation.next()) {
                        projectItem.setFunded(rsDonation.getInt("funded"));
                    }
                    project_item.add(projectItem);
                    System.out.println(projectItem);
                }

                String cmd_supporter_1 = "SELECT members.member_id, first_name, last_name, sum(amount) FROM donations ";
                String cmd_supporter_2 = "left join members on members.member_id = donations.member_id  ";
                String cmd_supporter_3 = "where type In ('project','item') and project_id = ? group by member_id";
                selectSupporter = conn.prepareStatement(cmd_supporter_1 + cmd_supporter_2 + cmd_supporter_3);
                selectSupporter.setInt(1, rs.getInt("project_id"));
                ArrayList<Supporter> supporter = new ArrayList<Supporter>();
                ResultSet rsSupporter = selectSupporter.executeQuery();
                Double funded = 0.0;
                while (rsSupporter.next()) {
                    Supporter sup = new Supporter();
                    sup.setMemberId(rsSupporter.getInt("member_id"));
                    sup.setFirstName(rsSupporter.getString("first_name"));
                    sup.setLastName(rsSupporter.getString("last_name"));
                    sup.setFunded(rsSupporter.getInt("sum(amount)"));
                    supporter.add(sup);
                    funded += rsSupporter.getInt("sum(amount)");
                    System.out.println("funded" + rs.getInt("project_id") + funded);
                }
                System.out.println(supporter);
                project.setSupporter(supporter);
                project.setSupporterSize(supporter.size());
                project.setFunded(funded);
                DecimalFormat df = new DecimalFormat();
                df.applyPattern("0.00");
                String percent = df.format((funded / rs.getFloat("budget") * 100));
                System.out.println(Float.valueOf(percent));
                project.setPercent(Float.valueOf(percent));

                //GET COMMENT
                String cmd_comment = "SELECT * FROM comments right join members on members.member_id = comments.member_id where project_id = ?";
                selectComment = conn.prepareStatement(cmd_comment);
                selectComment.setString(1, rs.getString("project_id"));
                ResultSet rsComment = selectComment.executeQuery();
                ArrayList<Comments> comments = new ArrayList<Comments>();
                while (rsComment.next()) {
                    Comments comment = new Comments();

                    comment.setCommentId(rsComment.getInt("comment_id"));
                    comment.setDate(rsComment.getTimestamp("date"));
                    comment.setText(rsComment.getString("text"));
                    Members member = new Members();
                    member.setMemberId(rsComment.getInt("member_id"));
                    member.setFirstName(rsComment.getString("first_name"));
                    member.setLastName(rsComment.getString("last_name"));
                    comment.setMemberId(member);
                    comment.setProjectId(rsComment.getInt("project_id"));
                    comments.add(comment);

                }

                project.setCommentsCollection(comments);
                System.out.println(project.getCommentsCollection());
                project.setProjectItemsCollection(project_item);
            }
            return project;
        } catch (SQLException ex) {
            Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Projects> findProjectByKeyword(String keyword) {
        String cmd = "select * from projects where name like ? ";
        String cmd2 = "or short_description like ? or story like ? or location like ?";
        ArrayList<Projects> projects = new ArrayList<Projects>();

        try {
            selectData = conn.prepareStatement(cmd + cmd2);
            selectData.setString(1, "%" + keyword + "%");
            selectData.setString(2, "%" + keyword + "%");
            selectData.setString(3, "%" + keyword + "%");
            selectData.setString(4, "%" + keyword + "%");
            System.out.println(selectData);
            ResultSet rs = selectData.executeQuery();
            while (rs.next()) {
                Projects project = new Projects();
                project.setProjectId(rs.getInt("project_id"));
                project.setName(rs.getString("name"));
                project.setLocation(rs.getString("location"));
                project.setFundingDuration(rs.getInt("funding_duration"));
                project.setBudget(rs.getFloat("budget"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setShortDescription(rs.getString("short_description"));
                project.setStory(rs.getString("story"));
                project.setStatus(rs.getString("status"));
                project.setProjectCategoryId(rs.getInt("project_category_id"));

                //GET SUPPORTER
                String cmd_supporter_1 = "SELECT members.member_id, first_name, last_name, sum(amount) FROM donations ";
                String cmd_supporter_2 = "left join members on members.member_id = donations.member_id  ";
                String cmd_supporter_3 = "where type In ('project','item') and project_id = ? group by member_id";
                selectSupporter = conn.prepareStatement(cmd_supporter_1 + cmd_supporter_2 + cmd_supporter_3);
                selectSupporter.setInt(1, rs.getInt("project_id"));
                ArrayList<Supporter> supporter = new ArrayList<Supporter>();
                ResultSet rsSupporter = selectSupporter.executeQuery();
                Double funded = 0.0;
                while (rsSupporter.next()) {
                    Supporter sup = new Supporter();
                    sup.setMemberId(rsSupporter.getInt("member_id"));
                    sup.setFirstName(rsSupporter.getString("first_name"));
                    sup.setLastName(rsSupporter.getString("last_name"));
                    sup.setFunded(rsSupporter.getInt("sum(amount)"));
                    supporter.add(sup);
                    funded += rsSupporter.getInt("sum(amount)");
                    System.out.println("funded" + rs.getInt("project_id") + funded);
                }
                System.out.println(supporter);
                project.setSupporter(supporter);
                project.setSupporterSize(supporter.size());
                project.setFunded(funded);
                DecimalFormat df = new DecimalFormat();
                df.applyPattern("0.00");
                String percent = df.format((funded / rs.getFloat("budget") * 100));
                System.out.println(Float.valueOf(percent));
                project.setPercent(Float.valueOf(percent));
                projects.add(project);
            }
            return projects;
        } catch (SQLException ex) {
            Logger.getLogger(ProjectUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
