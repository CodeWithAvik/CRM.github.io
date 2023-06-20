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
 * @author Ananya
 */
public class CustomerBean {

    private String custName;
    private String custEmail;
    private String custContact;
    private String custItemPurchased;
    private String custTotalItems;
    private String custTotalAmount;
    private String date;
    private String id;
    
    //SELECT * FROM (SELECT SUM(AMOUNT), DATE_OF_PURCHASE FROM CRM.CUSTOMERDB GROUP BY DATE_OF_PURCHASE) WHERE ROWNUM<=7;
    
    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustContact() {
        return custContact;
    }

    public void setCustContact(String custContact) {
        this.custContact = custContact;
    }

    public String getCustItemPurchased() {
        return custItemPurchased;
    }

    public void setCustItemPurchased(String custItemPurchased) {
        this.custItemPurchased = custItemPurchased;
    }

    public String getCustTotalItems() {
        return custTotalItems;
    }

    public void setCustTotalItems(String custTotalItems) {
        this.custTotalItems = custTotalItems;
    }

    public String getCustTotalAmount() {
        return custTotalAmount;
    }

    public void setCustTotalAmount(String custTotalAmount) {
        this.custTotalAmount = custTotalAmount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    ConnectionProvider con = new ConnectionProvider();
    
    public void insert() throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "INSERT INTO CUSTOMERDB VALUES(?,?,?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, custName);
        ps.setString(2, custEmail);
        ps.setString(3, custContact);
        ps.setString(4, custItemPurchased);
        ps.setString(5, custTotalItems);
        ps.setString(6, custTotalAmount);
        ps.setString(7, date);
        ps.setString(8, id);

        ps.executeUpdate();

        conn.close();
    }

    
    public void delete(String contact) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "DELETE FROM CUSTOMERDB WHERE MOBILE_NO=?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, contact);
        ps.executeUpdate();

        conn.close();

    }

    public void update() throws SQLException, ClassNotFoundException {
        Connection conn = con.connection();

        String sql = "UPDATE CUSTOMERDB SET CUSTOMER_NAME=?, EMAIL_ADDRESS=?, MOBILE_NO = ?, ITEMS=?, TOTAL_ITEMS=?, AMOUNT=?, DATE_OF_PURCHASE=? WHERE MOBILE_NO = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, custName);
        ps.setString(2, custEmail);
        ps.setString(3, custContact);
        ps.setString(4, custItemPurchased);
        ps.setString(5, custTotalItems);
        ps.setString(6, custTotalAmount);
        ps.setString(7, date);
        ps.setString(8, custContact);
        
        ps.executeUpdate();

        conn.close();

    }
    public ArrayList<CustomerBean> getChartData(String id) throws SQLException, ClassNotFoundException{
        Connection conn = con.connection();

        String sql = "SELECT * FROM (SELECT SUM(AMOUNT), DATE_OF_PURCHASE FROM CUSTOMERDB WHERE ENTERPRISE_ID =? GROUP BY DATE_OF_PURCHASE ORDER BY DATE_OF_PURCHASE DESC) WHERE ROWNUM<=7";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        ArrayList<CustomerBean> arr = new ArrayList<>();
        while (rs.next()) {
            CustomerBean cb = new CustomerBean();
            cb.setCustTotalAmount(rs.getString(1));
            cb.setDate(rs.getString(2));

            arr.add(cb);
        }
        conn.close();

        return arr;

    }

    public CustomerBean search(String number) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM CUSTOMERDB WHERE MOBILE_NO=?";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, number);

        CustomerBean cb = new CustomerBean();

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cb.setCustName(rs.getString(1));
            cb.setCustEmail(rs.getString(2));
            cb.setCustContact(rs.getString(3));
            cb.setCustItemPurchased(rs.getString(4));
            cb.setCustTotalItems(rs.getString(5));
            cb.setCustTotalAmount(rs.getString(6));
            cb.setDate(rs.getString(7));
        }
        conn.close();
        return cb;
    }

    public ArrayList<CustomerBean> show(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM CUSTOMERDB WHERE ENTERPRISE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        ArrayList<CustomerBean> arr = new ArrayList<>();
        while (rs.next()) {
            CustomerBean cb = new CustomerBean();
            cb.setCustName(rs.getString(1));
            cb.setCustEmail(rs.getString(2));
            cb.setCustContact(rs.getString(3));
            cb.setCustItemPurchased(rs.getString(4));
            cb.setCustTotalItems(rs.getString(5));
            cb.setCustTotalAmount(rs.getString(6));
            cb.setDate(rs.getString(7));

            arr.add(cb);
        }
        conn.close();

        return arr;
    }
}
