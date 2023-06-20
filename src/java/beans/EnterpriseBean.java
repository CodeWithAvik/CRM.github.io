/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import services.EncryptPassword;
import services.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ayanp
 */
public class EnterpriseBean {

    private String company_name;
    private String company_type;
    private String total_employee;
    private String email;
    private String contact;
    private String city;
    private String state;
    private String address;
    private String password;
    private String image;

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_type() {
        return company_type;
    }

    public void setCompany_type(String company_type) {
        this.company_type = company_type;
    }

    public String getTotal_employee() {
        return total_employee;
    }

    public void setTotal_employee(String total_employee) {
        this.total_employee = total_employee;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    EncryptPassword enc = new EncryptPassword();
    ConnectionProvider con = new ConnectionProvider();

    public void insert() throws SQLException, ClassNotFoundException {
        Connection conn = con.connection();

        String sql = "INSERT INTO REGISTRATIONDB VALUES(?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, company_name);
        ps.setString(3, company_type);
        ps.setString(4, total_employee);
        ps.setString(5, email);
        ps.setString(6, contact);
        ps.setString(7, city);
        ps.setString(8, state);
        ps.setString(9, address);
        ps.setString(10, enc.encrypt(password));
        ps.setString(11, image);
        
        ps.executeUpdate();

        conn.close();

    }

    public void update() throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "UPDATE REGISTRATIONDB SET COMPANY_NAME = ?, COMPANY_TYPE = ?, TOTAL_EMPLOYEE = ?, CONTACT = ?, CITY = ?, STATE = ?, ADDRESS = ? WHERE ID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, company_name);
        ps.setString(2, company_type);
        ps.setString(3, total_employee);
        ps.setString(4, contact);
        ps.setString(5, city);
        ps.setString(6, state);
        ps.setString(7, address);
        ps.setString(8, email);

        ps.executeUpdate();

        conn.close();

    }
    
    public void updateImage(String id, String image) throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "UPDATE REGISTRATIONDB SET IMAGE = ? WHERE ID = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, image);
        ps.setString(2, id);
        
        ps.executeUpdate();
        
        conn.close();
        
    }

    public EnterpriseBean show(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM REGISTRATIONDB WHERE ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        EnterpriseBean eb = new EnterpriseBean();
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            eb.setCompany_name(rs.getString(2));
            eb.setCompany_type(rs.getString(3));
            eb.setTotal_employee(rs.getString(4));
            eb.setEmail(rs.getString(5));
            eb.setContact(rs.getString(6));
            eb.setCity(rs.getString(7));
            eb.setState(rs.getString(8));
            eb.setAddress(rs.getString(9));
            eb.setImage(rs.getString(11));
        }

        conn.close();

        return eb;

    }

    public void updatePassword(String id, String password) throws SQLException, ClassNotFoundException {
        Connection conn = con.connection();

        String sql = "UPDATE REGISTRATIONDB SET PASSWORD = ? WHERE ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, enc.encrypt(password));
        ps.setString(2, id);

        ps.executeUpdate();

        conn.close();

    }

    public boolean ifExist(String id) {
        boolean result = false;
        try {
            Connection conn = con.connection();

            String sql = "SELECT * FROM REGISTRATIONDB WHERE ID = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                result = true;
            }
            conn.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EnterpriseBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean login() throws SQLException, ClassNotFoundException {

        boolean result = false;
        Connection conn = con.connection();

        String sql = "SELECT * FROM REGISTRATIONDB WHERE ID = ? AND PASSWORD = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, enc.encrypt(password));

        ResultSet rs = ps.executeQuery();

        result = rs.next();

        conn.close();

        return result;

    }

}
