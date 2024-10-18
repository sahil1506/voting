package Web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VoterDao;
import Dao.CandidateDao;
import model.Voter;
import model.Candidate;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VoterDao voterDao;
    private CandidateDao candidateDao;

    public void init() {
        voterDao = new VoterDao();
        candidateDao = new CandidateDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String candidateIdString = request.getParameter("candidateId");
        Voter voter = (Voter) request.getSession().getAttribute("voter");

        if (voter == null) {
            response.sendRedirect("voter_login.jsp");
            return;
        }

        try {
           
            int candidateId = Integer.parseInt(candidateIdString);
           
            if (voter.getHasVoted() == 1) {
                response.sendRedirect("AlreadyVoted.jsp");
                return;
            } 
            voterDao.updateHasVoted(voter.getVoterId(), 1);

            Candidate candidate = candidateDao.getCandidateById(candidateId);

            if (candidate != null) {
                candidateDao.incrementVotes(candidateId); // Increment vote count

                request.setAttribute("candidate", candidate);
                request.getRequestDispatcher("VotingSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Candidate not found.");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your vote. Please try again later.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid candidate ID format.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }
}
