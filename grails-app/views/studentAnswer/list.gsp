
<%@ page import="pqas.StudentAnswer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentAnswer.label', default: 'StudentAnswer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-studentAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-studentAnswer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="studentAnswer.question.label" default="Question" /></th>
					
						<th><g:message code="studentAnswer.answer.label" default="Answer" /></th>
					
						<th><g:message code="studentAnswer.student.label" default="Student" /></th>
					
						<th><g:message code="studentAnswer.comment.label" default="Comment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentAnswerInstanceList}" status="i" var="studentAnswerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentAnswerInstance.id}">${fieldValue(bean: studentAnswerInstance, field: "question")}</g:link></td>
					
						<td>${fieldValue(bean: studentAnswerInstance, field: "answer")}</td>
					
						<td>${fieldValue(bean: studentAnswerInstance, field: "student")}</td>
					
						<td>${fieldValue(bean: studentAnswerInstance, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentAnswerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
