<%@ page import="pqas.StudentAnswer" %>



<div class="fieldcontain ${hasErrors(bean: studentAnswerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="studentAnswer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${pqas.Question.list()}" optionKey="id" required="" value="${studentAnswerInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentAnswerInstance, field: 'answer', 'error')} required">
	<label for="answer">
		<g:message code="studentAnswer.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="answer" name="answer.id" from="${pqas.Option.list()}" optionKey="id" required="" value="${studentAnswerInstance?.answer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentAnswerInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="studentAnswer.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${pqas.User.list()}" optionKey="id" required="" value="${studentAnswerInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentAnswerInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="studentAnswer.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comment" name="comment.id" from="${pqas.Comment.list()}" optionKey="id" required="" value="${studentAnswerInstance?.comment?.id}" class="many-to-one"/>
</div>

