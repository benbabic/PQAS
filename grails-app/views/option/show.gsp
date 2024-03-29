
<%@ page import="pqas.Option" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'option.label', default: 'Option')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-option" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-option" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list option">
			
				<g:if test="${optionInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="option.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${optionInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="option.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:formatBoolean boolean="${optionInstance?.answer}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="option.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${optionInstance?.question?.id}">${optionInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${optionInstance?.id}" />
					<g:link class="edit" action="edit" id="${optionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
