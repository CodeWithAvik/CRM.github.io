/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import services.ConnectionProvider;

/**
 *
 * @author Devanjana Ghosh
 */
public class LeadBean {

    private String leadName;
    private String leadMail;
    private String leadPh;
    private String interIn;
    private String interAct;
    private String enterpriseID;

    public String getLeadName() {
        return leadName;
    }

    public void setLeadName(String leadName) {
        this.leadName = leadName;
    }

    public String getLeadMail() {
        return leadMail;
    }

    public void setLeadMail(String leadMail) {
        this.leadMail = leadMail;
    }

    public String getLeadPh() {
        return leadPh;
    }

    public void setLeadPh(String leadPh) {
        this.leadPh = leadPh;
    }

    public String getInterIn() {
        return interIn;
    }

    public void setInterIn(String interIn) {
        this.interIn = interIn;
    }

    public String getInterAct() {
        return interAct;
    }

    public void setInterAct(String interAct) {
        this.interAct = interAct;
    }

    public String getEnterpriseID() {
        return enterpriseID;
    }

    public void setEnterpriseID(String enterpriseID) {
        this.enterpriseID = enterpriseID;
    }

    ConnectionProvider con = new ConnectionProvider();

    public void insert() throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "INSERT INTO LEADSDB VALUES(?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, leadName);
        ps.setString(2, leadMail);
        ps.setString(3, leadPh);
        ps.setString(4, interIn);
        ps.setString(5, interAct);
        ps.setString(6, enterpriseID);

        ps.executeUpdate();

        conn.close();

    }

    public void delete(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "DELETE FROM LEADSDB WHERE MOBILE_NO = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        ps.executeUpdate();

        conn.close();

    }

    public void update(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "UPDATE LEADSDB SET NAME = ?, EMAIL_ADDRESS = ?, INTERESTED_IN = ?, INTERACTED_IN = ? WHERE MOBILE_NO = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, leadName);
        ps.setString(2, leadMail);
        ps.setString(3, interIn);
        ps.setString(4, interAct);
        ps.setString(5, id);

        ps.executeUpdate();

        conn.close();
    }

    public LeadBean search(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM LEADSDB WHERE MOBILE_NO = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        LeadBean lb = new LeadBean();
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            lb.setLeadName(rs.getString(1));
            lb.setLeadMail(rs.getString(2));
            lb.setLeadPh(rs.getString(3));
            lb.setInterIn(rs.getString(4));
            lb.setInterAct(rs.getString(5));
        }
        conn.close();

        return lb;
    }

    public ArrayList<LeadBean> show(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM LEADSDB WHERE ENTERPRISE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        ArrayList<LeadBean> arr = new ArrayList<>();
        while (rs.next()) {
            LeadBean lb = new LeadBean();
            lb.setLeadName(rs.getString(1));
            lb.setLeadMail(rs.getString(2));
            lb.setLeadPh(rs.getString(3));
            lb.setInterIn(rs.getString(4));
            lb.setInterAct(rs.getString(5));

            arr.add(lb);
        }
        conn.close();

        return arr;
    }

}
