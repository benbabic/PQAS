<%@ page import="pqas.Option" %>



<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="option.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${optionInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="option.answer.label" default="Answer" />
		
	</label>
	<g:checkBox name="answer" value="${optionInstance?.answer}" />
</div>

<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="option.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${pqas.Question.list()}" optionKey="id" required="" value="${optionInstance?.question?.id}" class="many-to-one"/>
</div>

