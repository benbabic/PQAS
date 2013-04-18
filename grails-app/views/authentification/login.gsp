<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login </title>
</head>
<body>
	<div class="body">
		<g:form action="doLogin/${params.id}" method="POST">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
					<label for="email"> <g:message code="user.email.label"
							default="Email" /> <span class="required-indicator">*</span>
					</label>
					<g:field type="email" name="email" required=""
						value="${userInstance?.email}" />
				</div>
				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="password"> <g:message
							code="user.password.label" default="Password" /> <span
						class="required-indicator">*</span>
					</label>
					<g:field type="password" name="password" required=""
						value="${userInstance?.password}" />
				</div>
			</fieldset>
			<div class="buttons">
				<span class="formButton"> <input type="submit" value="Login"></input>
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>