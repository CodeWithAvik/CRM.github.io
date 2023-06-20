package controllerservlet;

import beans.CustomerBean;
import beans.EmployeeBean;
import beans.EnterpriseBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ayanp
 */
public class Invoice extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Invoice</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Invoice at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String custName = request.getParameter("name");
        String custEmail = request.getParameter("email");
        String custContact = request.getParameter("contact");
        String custItemPurchased = request.getParameter("items");
        String custTotalItems = request.getParameter("totalitems");
        double custAmount = Float.parseFloat(request.getParameter("amount"));
        double taxPercentage = Float.parseFloat(request.getParameter("tax"));
        String date = request.getParameter("date");
        String paymentMethod = request.getParameter("paymentmethod");

        double tax = custAmount*taxPercentage/100;
        
        String id = request.getSession().getAttribute("id").toString();
        
        EnterpriseBean eb = new EnterpriseBean();
        EmployeeBean emb = new EmployeeBean();
        CustomerBean cust = new CustomerBean();
        
        cust.setCustName(custName);
        cust.setCustEmail(custEmail);
        cust.setCustContact(custContact);
        cust.setCustItemPurchased(custItemPurchased);
        cust.setCustTotalItems(custTotalItems);
        cust.setCustTotalAmount(String.valueOf(tax+custAmount));
        cust.setDate(date);
        
        if(eb.ifExist(id)){
            cust.setId(id);
        }
        else{
            cust.setId(emb.getEnterpriseId(id));
        }
        

        try {
            cust.insert();
            request.setAttribute("contact", custContact);
            request.setAttribute("tax", tax);
            request.setAttribute("percentage", taxPercentage);
            request.setAttribute("amount", custAmount);
            request.setAttribute("paymentmethod", paymentMethod);
            request.getRequestDispatcher("bill.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AddCustomer.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", ex.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
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
