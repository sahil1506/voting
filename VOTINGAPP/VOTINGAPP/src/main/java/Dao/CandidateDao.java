package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Candidate;

public class CandidateDao {
	 private static String jdbcURL = "jdbc:mysql://localhost:3306/voting?useSSL=false";
	    private static String jdbcUsername = "root";
	    private static String jdbcPassword = "sahil1234";
	    private static String jdbcDriver = "com.mysql.cj.jdbc.Driver";

	    private static final String INSERT_CANDIDATE_SQL = "INSERT INTO candidates" +
	            "  (full_name, date_of_birth, nationality, party_name, party_logo, votes) VALUES " +
	            " (?, ?, ?, ?, ?, ?);";

	    private static final String SELECT_CANDIDATE_BY_ID = "SELECT id, full_name, date_of_birth, nationality, party_name, party_logo, votes FROM candidates WHERE id = ?";
	    private static final String SELECT_ALL_CANDIDATES = "SELECT * FROM candidates";
	    private static final String DELETE_CANDIDATE_SQL = "DELETE FROM candidates WHERE id = ?;";
	    private static final String UPDATE_CANDIDATE_SQL = "UPDATE candidates SET full_name = ?, party_name = ?, party_logo = ? WHERE id = ?;";
	    private static final String UPDATE_CANDIDATE_VOTES = "UPDATE candidates SET votes = votes + 1 WHERE id = ?";

	    public CandidateDao() {}

	    protected static Connection getConnection() {
	        Connection connection = null;
	        try {
	            Class.forName(jdbcDriver);
	            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return connection;
	    }

	    // Insert candidate
	    public static void insertCandidate(Candidate candidate) throws SQLException {
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CANDIDATE_SQL)) {
	            preparedStatement.setString(1, candidate.getFullName());
	            preparedStatement.setDate(2, candidate.getDateOfBirth());
	            preparedStatement.setString(3, candidate.getNationality());
	            preparedStatement.setString(4, candidate.getPartyName());
	            preparedStatement.setString(5, candidate.getPartyLogo());
	            preparedStatement.setInt(6, candidate.getVotes());

	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }

	    // Select candidate by ID
	    public Candidate getCandidateById(int id) {
	        Candidate candidate = null;
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CANDIDATE_BY_ID)) {
	            preparedStatement.setInt(1, id);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	                String fullName = rs.getString("full_name");
	                Date dateOfBirth = rs.getDate("date_of_birth");
	                String nationality = rs.getString("nationality");
	                String partyName = rs.getString("party_name");
	                String partyLogo = rs.getString("party_logo");
	                int votes = rs.getInt("votes");

	                candidate = new Candidate(id, fullName, dateOfBirth, nationality, partyName, partyLogo, votes);
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return candidate;
	    }

	    // Select all candidates
	    public static List<Candidate> getAllCandidates() {
	        List<Candidate> candidates = new ArrayList<>();
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CANDIDATES)) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String fullName = rs.getString("full_name");
	                Date dateOfBirth = rs.getDate("date_of_birth");
	                String nationality = rs.getString("nationality");
	                String partyName = rs.getString("party_name");
	                String partyLogo = rs.getString("party_logo");
	                int votes = rs.getInt("votes");

	                candidates.add(new Candidate(id, fullName, dateOfBirth, nationality, partyName, partyLogo, votes));
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return candidates;
	    }

	    // Update candidate
	    public boolean updateCandidate(Candidate candidate) throws SQLException {
	        boolean rowUpdated;
	        try (Connection connection = getConnection();
	             PreparedStatement statement = connection.prepareStatement(UPDATE_CANDIDATE_SQL)) {
	            statement.setString(1, candidate.getFullName());
	            statement.setString(2, candidate.getPartyName());
	            statement.setString(3, candidate.getPartyLogo());
	            statement.setInt(4, candidate.getId());

	            rowUpdated = statement.executeUpdate() > 0;
	        }
	        return rowUpdated;
	    }

	    // Delete candidate
	    public boolean deleteCandidate(int id) throws SQLException {
	        boolean rowDeleted;
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CANDIDATE_SQL)) {
	            preparedStatement.setInt(1, id);
	            rowDeleted = preparedStatement.executeUpdate() > 0;
	        }
	        return rowDeleted;
	    }

	    // Error handling
	    private static void printSQLException(SQLException ex) {
	        for (Throwable e : ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
	    
	    public void incrementVotes(int candidateId) throws SQLException {

	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CANDIDATE_VOTES)) {
	            preparedStatement.setInt(1, candidateId);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            throw new SQLException("Error updating candidate votes", e);
	        }
	    }
	    
	    public int getTotalVotes() throws SQLException {
	        String query = "SELECT SUM(votes) FROM candidates"; 
	        int totalVotes = 0;

	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            ResultSet rs = preparedStatement.executeQuery();
	            if (rs.next()) {
	                totalVotes = rs.getInt(1);  
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return totalVotes;
	    }

	   
}
