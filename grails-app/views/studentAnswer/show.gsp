
<%@ page import="pqas.StudentAnswer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentAnswer.label', default: 'StudentAnswer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-studentAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-studentAnswer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list studentAnswer">
			
				<g:if test="${studentAnswerInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="studentAnswer.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${studentAnswerInstance?.question?.id}">${studentAnswerInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentAnswerInstance?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="studentAnswer.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:link controller="option" action="show" id="${studentAnswerInstance?.answer?.id}">${studentAnswerInstance?.answer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentAnswerInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="studentAnswer.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="user" action="show" id="${studentAnswerInstance?.student?.id}">${studentAnswerInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentAnswerInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="studentAnswer.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:link controller="comment" action="show" id="${studentAnswerInstance?.comment?.id}">${studentAnswerInstance?.comment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentAnswerInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentAnswerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
