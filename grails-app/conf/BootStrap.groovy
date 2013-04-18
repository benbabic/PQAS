import pqas.User
import pqas.Question
import pqas.Option
import pqas.StudentAnswer

class BootStrap {

    def init = { servletContext ->
		User student = new User(firstName:"Benjamin", secondName:"Babic", email:"benjamin.babic@hotmail.fr", type:"Student", dateOfBirth:new Date("24/09/1991"), password:"12563")
		if(!student.save()) {
			student.errors.allErrors.each{error -> println "An error occured with student"}
		}
		
		User teacher = new User(firstName:"Ronald", secondName:"McDonald", email:"ronald@hotmail.fr", type:"Teacher", dateOfBirth:new Date("12/02/1950"), password:"12356")
		if(!teacher.save()) {
			teacher.errors.allErrors.each{error -> println "An error occured with teacher"}
		}
		
		/*Option opt1 = new Option(content:"Oui")
		Option opt2 = new Option(content:"Non")
		Option opt3 = new Option(content:"Peut Etre")
		if(!opt1.save() || !opt2.save() || !opt3.save()) {
			println "An error occured with options"
		}
		
		Question question1 = new Question(statement:"Connais tu la racine carre de 2?", answer:Option.findByContent("Oui"), status:"Opened")
		if(!question1.save()) {
			question1.errors.allErrors.each{error -> println "An error occured with question1"}
		}
		
		question1.addToOptions(Option.findByContent("Oui"))
		question1.addToOptions(Option.findByContent("Non"))
		question1.addToOptions(Option.findByContent("Peut Etre"))
		
		StudentAnswer babicAnwser = new StudentAnswer(answer:Option.findByContent("Oui"),student:User.findByFirstName("Babic"),question:Question.findByStatement("Connais tu la racine carre de 2?"))
		if(!babicAnwser.save()) {
			babicAnwser.errors.allErrors.each{error -> println "An error occured with babicAnwser"}
		}*/
    }
    def destroy = {
    }
}
