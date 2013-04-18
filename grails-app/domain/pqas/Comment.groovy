package pqas

class Comment {

	int mark
	String content
	User author
	
    static constraints = {
		mark(blank:false)
		author(blank:false)
    }
}
