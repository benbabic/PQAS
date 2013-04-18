package pqas

class Question {

	String statement
	String status
	static hasMany = [options: Option]
	
	@Override
	public	String toString() {
		statement
	}
	
    static constraints = {
		statement(size: 1..500, blank: false)
		status(blank:false, inList:["Opened", "Closed"])
    }
}
