package jsp.tagDemo;

public class Student {
	
	private String firstName, lastName; 
	private boolean goldCustomer; 
	
	public Student(String firstName, String lastName, boolean goldCustomer) {
		super();
		this.firstName = firstName; 
		this.lastName = lastName; 
		this.goldCustomer = goldCustomer;
	}
	
	public void setGoldCustomer(boolean goldCustomer) {
		this.goldCustomer = goldCustomer; 
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName; 
	}
	public void setLastName(String lastName) {
		this.lastName = lastName; 
	}
	
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public boolean isGoldCustomer() {
		return goldCustomer;
	}

}


