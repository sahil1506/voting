package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import model.Voter;

public class VoterDao {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/voting?useSSL=false";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "sahil1234";

    // SQL Queries
    private static final String SELECT_AADHAAR_COUNT = "SELECT COUNT(*) FROM voter WHERE aadhaar_number = ?";
    private static final String INSERT_VOTER = "INSERT INTO voter (voter_id, name, date_of_birth, phone_number, aadhaar_number, password, nationality, has_voted) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_VOTER_LOGIN = "SELECT * FROM voter WHERE voter_id = ? AND password = ?";
    private static final String SELECT_VOTER_BY_ID = "SELECT * FROM voter WHERE voter_id = ?";
    private static final String SELECT_VOTER_BY_AADHAAR = "SELECT * FROM voter WHERE aadhaar_number = ?";
    
    //Utility Method
    public Connection getConnection() throws SQLException {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    	}catch(ClassNotFoundException e) {
    		e.printStackTrace();
    	}
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }


    public boolean isAadhaarRegistered(String aadhaarNumber) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_AADHAAR_COUNT)) {
            preparedStatement.setString(1, aadhaarNumber);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // True if Aadhaar is registered
            }
        } catch (SQLException e) {
            // Log error
            throw new SQLException("Error checking Aadhaar registration", e);
        }
        return false;
    }

    // Check if voter is eligible
    public boolean isEligible(Voter voter) {
        if (voter.getDateOfBirth() == null || voter.getDateOfBirth().trim().isEmpty()) {
            return false;
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dob = LocalDate.parse(voter.getDateOfBirth(), formatter);
        LocalDate today = LocalDate.now();
        return dob.plusYears(18).isBefore(today) && "Indian".equalsIgnoreCase(voter.getNationality());
    }

    // Generate a unique voter ID
    public String generateVoterId(String aadhaarNumber) {
        return "VOTER" + aadhaarNumber.substring(aadhaarNumber.length() - 4); // Last 4 digits for ID
    }

    // Register a new voter
    public void registerVoter(Voter voter) throws SQLException {
        String voterId = generateVoterId(voter.getAadhaarNumber());
        voter.setVoterId(voterId);

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VOTER)) {
            preparedStatement.setString(1, voter.getVoterId());
            preparedStatement.setString(2, voter.getName());
            preparedStatement.setString(3, voter.getDateOfBirth());
            preparedStatement.setString(4, voter.getPhoneNumber());
            preparedStatement.setString(5, voter.getAadhaarNumber());
            preparedStatement.setString(6, voter.getPassword());
            preparedStatement.setString(7, voter.getNationality());
            preparedStatement.setInt(8, 0); // Initially, voter has not voted

            preparedStatement.executeUpdate(); // Execute registration
        } catch (SQLException e) {
            throw new SQLException("Error registering voter", e);
        }
    }

    // Validate voter login credentials
    public boolean validateVoterLogin(String voterId, String password) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VOTER_LOGIN)) {
            preparedStatement.setString(1, voterId);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new SQLException("Error validating voter login", e);
        }
    }

    // Retrieve voter details by voter ID
    public Voter getVoterById(String voterId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VOTER_BY_ID)) {
            preparedStatement.setString(1, voterId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Voter voter = new Voter();
                voter.setVoterId(resultSet.getString("voter_id"));
                voter.setName(resultSet.getString("name"));
                voter.setDateOfBirth(resultSet.getString("date_of_birth"));
                voter.setPhoneNumber(resultSet.getString("phone_number"));
                voter.setAadhaarNumber(resultSet.getString("aadhaar_number"));
                voter.setNationality(resultSet.getString("nationality"));
                voter.setHasVoted(resultSet.getInt("has_voted"));
                return voter; // Return the found voter details
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving voter details", e);
        }
        
        return null; 
    }
      
    public void updateHasVoted(String voterId, int hasVoted) throws SQLException {
        String sql = "UPDATE voter SET has_voted = ? WHERE voter_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, hasVoted);
            stmt.setString(2, voterId);
            stmt.executeUpdate();
        }
    }
}
