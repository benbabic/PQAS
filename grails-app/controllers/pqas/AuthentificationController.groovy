package pqas

class AuthentificationController {

	def login() {
		def caller = params["id"]
		if(session.user) {
			sendBack(caller)
		}
	}

	def error(){
		flash.message='You are not authorized to access this ressource'
		redirect(url: "/")
		return
	}

	def logout(){
		session.user = null
	}

	def sendBack(String caller){
		// caller is null when page is called with action="login"
		// caller is "null" when page is called with action="login/"
		if(caller == "null" || caller == null) {
			redirect(url: "/")
		}else{
			redirect(controller:''+caller)
		}
	}

	def doLogin() {
		def caller = params["id"]
		def user = User.findWhere(email:params['email'], password:params['password'])
		if (user){
			session.user = user
			sendBack(caller)
		}
		else
			redirect(controller:'authentification',action:'login/'+caller)
		return
	}

	def index() {
	}
}
