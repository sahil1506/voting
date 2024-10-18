package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VoterDao;
import model.Voter;

/**
 * Servlet implementation class VoterRegisterServlet
 */
@WebServlet("/VoterRegisterServlet")
public class VoterRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VoterDao voterDao;

    @Override
    public void init() {
        voterDao = new VoterDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dob"); 
        String phoneNumber = request.getParameter("phone");
        String aadhaarNumber = request.getParameter("aadhar");
        String password = request.getParameter("password");
        String nationality = request.getParameter("nationality");

        if (dateOfBirth == null || dateOfBirth.trim().isEmpty()) {
            response.getWriter().println("Date of birth is required.");
            return;
        }

        Voter voter = new Voter();
        voter.setName(name);
        voter.setDateOfBirth(dateOfBirth);
        voter.setPhoneNumber(phoneNumber);
        voter.setAadhaarNumber(aadhaarNumber);
        voter.setPassword(password);
        voter.setNationality(nationality);

        try {
            if (voterDao.isAadhaarRegistered(aadhaarNumber)) {
                response.getWriter().println("Aadhaar number already registered.");
                return;
            }

            if (!voterDao.isEligible(voter)) {
                response.getWriter().println("Voter is either underage or not an Indian national.");
                return;
            }

            voterDao.registerVoter(voter);
            request.setAttribute("voterId", voter.getVoterId());
            request.getRequestDispatcher("voter_registration.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
