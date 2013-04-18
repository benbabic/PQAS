package pqas

import java.util.Date;

class User {

	String firstName
	String secondName
	String email
	String type
	String password
	Date dateOfBirth

	@Override
	public	String toString() {
		firstName + " " + secondName
	}

	static constraints = {
		firstName(size: 2..20, blank: false, matches: "[a-zA-Z]+")
		secondName(size: 2..20, blank: false, matches: "[a-zA-Z]+")
		email(email:true, blank: false, unique: true)
		password(password:true, blank: false)
		type(inList:["Teacher", "Student"])
		dateOfBirth(validator: {return (it.before(new Date() - 15*365))}) 
	}
}
