package model;

import java.sql.Date;

public class Candidate {
	private int id;
    private String fullName;
    private Date dateOfBirth;
    private String nationality;
    private String partyName;
    private String partyLogo;
    private int votes;
    
    
    
	public Candidate(int id, String fullName, Date dateOfBirth, String nationality, String partyName, String partyLogo,
			int votes) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.nationality = nationality;
		this.partyName = partyName;
		this.partyLogo = partyLogo;
		this.votes = votes;
	}
	
	public Candidate(int id, String fullName, Date dateOfBirth, String nationality, String partyName, String partyLogo) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.nationality = nationality;
		this.partyName = partyName;
		this.partyLogo = partyLogo;
	}
	

	public Candidate(int id,String fullName, String partyName, String partyLogo) {
		super();
		this.id=id;
		this.fullName = fullName;
		this.partyName = partyName;
		this.partyLogo = partyLogo;
	}



	public Candidate(String fullName, Date dateOfBirth, String nationality, String partyName, String partyLogo) {
		// TODO Auto-generated constructor stub
		super();
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.nationality = nationality;
		this.partyName = partyName;
		this.partyLogo = partyLogo;
	}



	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

	public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public String getPartyLogo() {
        return partyLogo;
    }

    public void setPartyLogo(String partyLogo) {
        this.partyLogo = partyLogo;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }
	
}
