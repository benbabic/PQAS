<%@ page import="pqas.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'mark', 'error')} required">
	<label for="mark">
		<g:message code="comment.mark.label" default="Mark" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mark" type="number" value="${commentInstance.mark}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="comment.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${pqas.User.list()}" optionKey="id" required="" value="${commentInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="comment.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${commentInstance?.content}"/>
</div>

