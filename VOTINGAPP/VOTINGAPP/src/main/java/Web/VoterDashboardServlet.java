package Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CandidateDao;
import model.Candidate;

/**
 * Servlet implementation class VoterDashboardServlet
 */
@WebServlet("/VoterDashboard")
public class VoterDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CandidateDao candidateDao;

    @Override
    public void init() throws ServletException {
        candidateDao = new CandidateDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Candidate> listCandidate = candidateDao.getAllCandidates();
            request.setAttribute("listCandidate", listCandidate);

            RequestDispatcher dispatcher = request.getRequestDispatcher("voterDashboard.jsp");
            dispatcher.forward(request, response);
        }catch (Exception e) {  
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
