package Web;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CandidateDao;
import model.Candidate;

/**
 * Servlet implementation class CandidateServlet
 */
@WebServlet("/")
public class CandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CandidateDao candidateDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        candidateDao = new CandidateDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCandidate(request, response);
                    break;
                case "/delete":
                    deleteCandidate(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateCandidate(request, response);
                    break;
                default:
                    listCandidate(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Error page
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("candidate-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCandidate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String fullName = request.getParameter("fullName");
        LocalDate localDateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"));
        java.sql.Date dateOfBirth = java.sql.Date.valueOf(localDateOfBirth);
        String nationality = request.getParameter("nationality");
        String partyName = request.getParameter("partyName");
        String partyLogoUrl = request.getParameter("partyLogoUrl");

        Candidate newCandidate = new Candidate(fullName, dateOfBirth, nationality, partyName, partyLogoUrl);
        candidateDao.insertCandidate(newCandidate);
        response.sendRedirect("list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Candidate existingCandidate = candidateDao.getCandidateById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("candidate-form.jsp");
        request.setAttribute("candidate", existingCandidate);
        dispatcher.forward(request, response);
    }

    private void updateCandidate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullName");
        String partyName = request.getParameter("partyName");
        String partyLogoUrl = request.getParameter("partyLogoUrl");
        Candidate candidate = new Candidate(id, fullName, null, null, partyName, partyLogoUrl, 0);
        candidateDao.updateCandidate(candidate);
        response.sendRedirect("list");
    }

    private void deleteCandidate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        candidateDao.deleteCandidate(id);
        response.sendRedirect("list");
    }

    private void listCandidate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Candidate> listCandidate = candidateDao.getAllCandidates();
        // Retrieve total votes
        int totalVotes = candidateDao.getTotalVotes();
        
        request.setAttribute("listCandidate", listCandidate);
        request.setAttribute("totalVotes", totalVotes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("candidate-list.jsp");
        dispatcher.forward(request, response);
    }
}
