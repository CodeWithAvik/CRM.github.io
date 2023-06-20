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
import java.util.logging.Level;
import java.util.logging.Logger;
import services.ConnectionProvider;
import services.EncryptPassword;

/**
 *
 * @author ayanp
 */
public class EmployeeBean {

    private String empId;
    private String empName;
    private String empGender;
    private String empEmail;
    private String empContact;
    private String empAddress;
    private String empEnterprise;
    private String empPassword;

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getEmpContact() {
        return empContact;
    }

    public void setEmpContact(String empContact) {
        this.empContact = empContact;
    }

    public String getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(String empAddress) {
        this.empAddress = empAddress;
    }

    public String getEmpEnterprise() {
        return empEnterprise;
    }

    public void setEmpEnterprise(String empEnterprise) {
        this.empEnterprise = empEnterprise;
    }

    public String getEmpPassword() {
        return empPassword;
    }

    public void setEmpPassword(String empPassword) {
        this.empPassword = empPassword;
    }

    ConnectionProvider con = new ConnectionProvider();
    EncryptPassword enc = new EncryptPassword();

    public void insert() throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "INSERT INTO EMPLOYEEDB VALUES(?,?,?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, empId);
        ps.setString(2, empName);
        ps.setString(3, empGender);
        ps.setString(4, empEmail);
        ps.setString(5, empContact);
        ps.setString(6, empAddress);
        ps.setString(7, empEnterprise);
        ps.setString(8, enc.encrypt(empPassword));

        ps.executeUpdate();

        conn.close();

    }

    public void delete(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "DELETE FROM EMPLOYEEDB WHERE EMPLOYEE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        ps.executeUpdate();

        conn.close();

    }

    public void update() throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "UPDATE EMPLOYEEDB SET EMPLOYEE_NAME = ?, GENDER = ?, EMAIL_ADDRESS = ?, CONTACT_NO = ?, ADDRESS = ? WHERE EMPLOYEE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, empName);
        ps.setString(2, empGender);
        ps.setString(3, empEmail);
        ps.setString(4, empContact);
        ps.setString(5, empAddress);
        ps.setString(6, empId);

        ps.executeUpdate();

        conn.close();
    }

    public EmployeeBean search(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM EMPLOYEEDB WHERE EMPLOYEE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        EmployeeBean eb = new EmployeeBean();
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            eb.setEmpId(rs.getString(1));
            eb.setEmpName(rs.getString(2));
            eb.setEmpGender(rs.getString(3));
            eb.setEmpEmail(rs.getString(4));
            eb.setEmpContact(rs.getString(5));
            eb.setEmpAddress(rs.getString(6));

        }
        conn.close();

        return eb;
    }

    public ArrayList<EmployeeBean> show(String id) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT * FROM EMPLOYEEDB WHERE ENTERPRISE_ID = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        ArrayList<EmployeeBean> arr = new ArrayList<>();
        while (rs.next()) {
            EmployeeBean eb = new EmployeeBean();
            eb.setEmpId(rs.getString(1));
            eb.setEmpName(rs.getString(2));
            eb.setEmpGender(rs.getString(3));
            eb.setEmpEmail(rs.getString(4));
            eb.setEmpContact(rs.getString(5));
            eb.setEmpAddress(rs.getString(6));

            arr.add(eb);
        }
        conn.close();

        return arr;
    }

    public String getEnterpriseId(String empid) {
        try {
            String enterpriseId = "";
            Connection conn = con.connection();
            
            String sql = "SELECT ENTERPRISE_ID FROM EMPLOYEEDB WHERE EMPLOYEE_ID = ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, empid);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                enterpriseId = rs.getString(1);
            }
            return enterpriseId;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean ifExist(String id) {
        boolean result = false;
        try {
            Connection conn = con.connection();

            String sql = "SELECT * FROM EMPLOYEEDB WHERE EMPLOYEE_ID = ?";

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

    public boolean login(String id, String password) throws SQLException, ClassNotFoundException {

        boolean result = false;
        Connection conn = con.connection();

        String sql = "SELECT * FROM EMPLOYEEDB WHERE EMPLOYEE_ID = ? AND PASSWORD = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, enc.encrypt(password));

        ResultSet rs = ps.executeQuery();

        result = rs.next();

        conn.close();

        return result;

    }

}
