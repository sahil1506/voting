package Web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AdminLoginDao;
import model.AdminLogin;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
       
    private static final long serialVersionUID = 1L;

    private AdminLoginDao loginDao;

    public void init() {
        loginDao = new AdminLoginDao();
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AdminLogin login = new AdminLogin();
        login.setUsername(username);
        login.setPassword(password);
        
        try {
            if (AdminLoginDao.validate(login)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", login); // Store admin info in session
                response.sendRedirect("list");
            } else {
            	
                HttpSession session = request.getSession();
                session.setAttribute("loginError", "Invalid username or password.");
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
