package model;

public class Voter {
	private String voterId;
    private String name;
    private String dateOfBirth;
    private String phoneNumber;
    private String aadhaarNumber;
    private String password;
    private String nationality;
    
    private int hasVoted;

    // Getters and setters for all fields

    public String getVoterId() { return voterId; }
    public void setVoterId(String voterId) { this.voterId = voterId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(String dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAadhaarNumber() { return aadhaarNumber; }
    public void setAadhaarNumber(String aadhaarNumber) { this.aadhaarNumber = aadhaarNumber; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getNationality() { return nationality; }
    public void setNationality(String nationality) { this.nationality = nationality; }

    
    public int getHasVoted() {
        return hasVoted;
    }

    public void setHasVoted(int hasVoted) {
        this.hasVoted = hasVoted;
    }
}
