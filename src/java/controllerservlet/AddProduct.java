package controllerservlet;

import beans.EmployeeBean;
import beans.EnterpriseBean;
import beans.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Avik
 */
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        
        String productId = request.getParameter("pid");
        String productName = request.getParameter("pname");
        String productCategory = request.getParameter("category");
        String productExpdate = request.getParameter("expdate");
        String productPrice = request.getParameter("price");
        
        HttpSession session = request.getSession();
        String id = session.getAttribute("id").toString();
        
        EnterpriseBean eb = new EnterpriseBean();
        EmployeeBean emb = new EmployeeBean();
        ProductBean pd = new ProductBean();
        
        pd.setProductId(productId);
        pd.setProductName(productName);
        pd.setProductCategory(productCategory);
        pd.setProductExpdate(productExpdate);
        pd.setProductPrice(productPrice);
        
        if (eb.ifExist(id)) {
            pd.setEnterpriseId(id);
        } else {
            pd.setEnterpriseId(emb.getEnterpriseId(id));
        }
        
        try {
            if (pd.ifExist(productId)) {
                request.setAttribute("message", "Product already exists");
                request.getRequestDispatcher("addproduct.jsp").forward(request, response);
            } else {
                pd.insert();
                response.sendRedirect("addproduct.jsp");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
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
