package pqas

class StudentAnswer {
	
	Question question
	Option answer
	User student
	Comment comment
	
	@Override
	public	String toString() {
		question + ": " + answer + "( "+student+" )"
	}

    static constraints = {
		question(blank: false)
		answer(blank: false)
		student(blank:false, validator: {return (it.getType()=="Student")})
    }
}
