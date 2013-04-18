<%@ page import="pqas.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'statement', 'error')} required">
	<label for="statement">
		<g:message code="question.statement.label" default="Statement" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="statement" cols="40" rows="5" maxlength="500" required="" value="${questionInstance?.statement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="question.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${questionInstance.constraints.status.inList}" required="" value="${questionInstance?.status}" valueMessagePrefix="question.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'options', 'error')} ">
	<label for="options">
		<g:message code="question.options.label" default="Options" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.options?}" var="o">
    <li><g:link controller="option" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="option" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'option.label', default: 'Option')])}</g:link>
</li>
</ul>

</div>

