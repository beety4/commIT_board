package tocuser;

public class userDTO {
	String userID;
	String userPassword;
	String Name;
	String Email;
	String Emailhash;
	int Emailcheck;
	


	// ============================= ID ===============================
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	// ============================= PW ===============================
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	// ============================ NAME ==============================
	public String getName() {
		return Name;
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	
	// ============================ EMAIL =============================
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	
	// ========================= EMAILhash =============================
	public String getEmailhash() {
		return Emailhash;
	}
	public void setEmailhash(String Emailhash) {
		this.Emailhash = Emailhash;
	}
	
	// ========================= EMAILcheck =============================
	public int getEmailcheck() {
		return Emailcheck;
	}
	public void setEmailcheck(int Emailcheck) {
		this.Emailcheck = Emailcheck;
	}
	
	
	public userDTO() {
	}
	
	public userDTO(String userID, String userPassword, String name, String email, String emailhash, int emailcheck) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		Name = name;
		Email = email;
		Emailhash = emailhash;
		Emailcheck = emailcheck;
	}
}
