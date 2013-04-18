package pqas

class Option {
	
	static belongsTo = [question: Question]
	String content
	boolean answer
	
	@Override
	public	String toString() {
		content
	}
	
    static constraints = {
		content(blank:false)
		answer(blank:false)
    }
}
