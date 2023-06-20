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
import java.util.HashMap;
import services.ConnectionProvider;

/**
 *
 * @author ayanp
 */
public class TaskBean {
    
    private String task;
    private String empId;
    private String enterpriseId;

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(String enterpriseId) {
        this.enterpriseId = enterpriseId;
    }
    
    ConnectionProvider con = new ConnectionProvider();
    
    public void addTask() throws SQLException, ClassNotFoundException{
        
        Connection conn = con.connection();
        
        String sql = "INSERT INTO TASKS VALUES(?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, task);
        ps.setString(2, empId);
        ps.setString(3, enterpriseId);
        
        ps.executeUpdate();
        
        conn.close();
    }
    
    public ArrayList<HashMap> getTasks(String empId, String entId) throws SQLException, ClassNotFoundException {

        Connection conn = con.connection();

        String sql = "SELECT TASK, EMPLOYEE_ID FROM TASKS WHERE EMPLOYEE_ID = ? AND ENTERPRISE_ID =?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, empId);
        ps.setString(2, entId);

        ResultSet rs = ps.executeQuery();
        ArrayList<HashMap> tasks = new ArrayList<>();
        while (rs.next()) {
            HashMap<String, String> task = new HashMap<>();
            task.put("task", rs.getString(1));
            task.put("empid", rs.getString(2));
            tasks.add(task);
        }
        conn.close();
                
        return tasks;

    }
    
    public ArrayList<TaskBean> getAllTasks(String entId) throws SQLException, ClassNotFoundException {
        
        Connection conn = con.connection();

        String sql = "SELECT TASK, EMPLOYEE_ID FROM TASKS WHERE ENTERPRISE_ID =?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, entId);

        ResultSet rs = ps.executeQuery();
        ArrayList<TaskBean> tasks = new ArrayList<>();
        while (rs.next()) {
            TaskBean tb = new TaskBean();
            tb.setTask(rs.getString(1));
            tb.setEmpId(rs.getString(2));
            tasks.add(tb);
        }
        conn.close();
                
        return tasks;
        
    }
    
    public void deleteTasks(String task) throws SQLException, ClassNotFoundException {
        
        Connection conn = con.connection();

        String sql = "DELETE FROM TASKS WHERE TASK = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, task);
        
        ps.executeUpdate();
        
        conn.close();
        
    }
    
}
