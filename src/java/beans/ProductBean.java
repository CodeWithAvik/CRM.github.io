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

/**
 *
 * @author ayanp
 */
public class ProductBean {
    private String productId;
    private String productName;
    private String productCategory;
    private String productExpdate;
    private String productPrice;
    private String enterpriseId;
   
    public String getProductId(){
        return productId;
    }
    public void setProductId(String productId){
        this.productId = productId;
    }
    
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }
    
    public String getProductExpdate() {
        return productExpdate;
    }

    public void setProductExpdate(String productExpdate) {
        this.productExpdate = productExpdate;
    }
    
    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }
    
    public String getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(String enterpriseId) {
        this.enterpriseId = enterpriseId;
    }
    
    ConnectionProvider con = new ConnectionProvider();
    
    public void insert() throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "INSERT INTO PRODUCTDB VALUES(?,?,?,?,?,?)";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, productId);
        ps.setString(2, productName);
        ps.setString(3, productCategory);
        ps.setString(4, productExpdate);
        ps.setString(5, productPrice);
        ps.setString(6, enterpriseId);
        
        ps.executeUpdate();
        
        conn.close();
        
    }
    
    public void delete(String id) throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "DELETE FROM PRODUCTDB WHERE PRODUCT_ID = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        
        ps.executeUpdate();
        
        conn.close();
        
    }
    
    public void update() throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "UPDATE PRODUCTDB SET PRODUCT_NAME = ?, CATEGORY = ?, EXPIRY_DATE = ?, PRICE = ? WHERE PRODUCT_ID = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, productName);
        ps.setString(2, productCategory);
        ps.setString(3, productExpdate);
        ps.setString(4, productPrice);
        ps.setString(5, productId);
        
        ps.executeUpdate();
        
        conn.close();
    }
    
    public ProductBean search(String id) throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "SELECT * FROM PRODUCTDB WHERE PRODUCT_ID = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ProductBean pb = new ProductBean();
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            
            pb.setProductId(rs.getString(1));
            pb.setProductName(rs.getString(2));
            pb.setProductCategory(rs.getString(3));
            pb.setProductExpdate(rs.getString(4));
            pb.setProductPrice(rs.getString(5));

        }
        conn.close();
        
        return pb;
    }
    
    public ArrayList<ProductBean> show(String id) throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "SELECT * FROM PRODUCTDB WHERE ENTERPRISE_ID = ?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        
        ResultSet rs = ps.executeQuery();
        ArrayList<ProductBean> arr = new ArrayList<>();
        while(rs.next()){
            ProductBean pb = new ProductBean();
            pb.setProductId(rs.getString(1));
            pb.setProductName(rs.getString(2));
            pb.setProductCategory(rs.getString(3));
            pb.setProductExpdate(rs.getString(4));
            pb.setProductPrice(rs.getString(5));
            
            
            arr.add(pb);
        }
        conn.close();
        
        return arr;
    }
    
    public boolean ifExist(String id) {
        boolean result = false;
        try {
            Connection conn = con.connection();

            String sql = "SELECT * FROM PRODUCTDB WHERE PRODUCT_ID = ?";

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

}
