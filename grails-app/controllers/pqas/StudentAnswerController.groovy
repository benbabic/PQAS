package pqas

import org.springframework.dao.DataIntegrityViolationException

class StudentAnswerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [studentAnswerInstanceList: StudentAnswer.list(params), studentAnswerInstanceTotal: StudentAnswer.count()]
    }

    def create() {
        [studentAnswerInstance: new StudentAnswer(params)]
    }

    def save() {
        def studentAnswerInstance = new StudentAnswer(params)
        if (!studentAnswerInstance.save(flush: true)) {
            render(view: "create", model: [studentAnswerInstance: studentAnswerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), studentAnswerInstance.id])
        redirect(action: "show", id: studentAnswerInstance.id)
    }

    def show(Long id) {
        def studentAnswerInstance = StudentAnswer.get(id)
        if (!studentAnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "list")
            return
        }

        [studentAnswerInstance: studentAnswerInstance]
    }

    def edit(Long id) {
        def studentAnswerInstance = StudentAnswer.get(id)
        if (!studentAnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "list")
            return
        }

        [studentAnswerInstance: studentAnswerInstance]
    }

    def update(Long id, Long version) {
        def studentAnswerInstance = StudentAnswer.get(id)
        if (!studentAnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (studentAnswerInstance.version > version) {
                studentAnswerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studentAnswer.label', default: 'StudentAnswer')] as Object[],
                          "Another user has updated this StudentAnswer while you were editing")
                render(view: "edit", model: [studentAnswerInstance: studentAnswerInstance])
                return
            }
        }

        studentAnswerInstance.properties = params

        if (!studentAnswerInstance.save(flush: true)) {
            render(view: "edit", model: [studentAnswerInstance: studentAnswerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), studentAnswerInstance.id])
        redirect(action: "show", id: studentAnswerInstance.id)
    }

    def delete(Long id) {
        def studentAnswerInstance = StudentAnswer.get(id)
        if (!studentAnswerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "list")
            return
        }

        try {
            studentAnswerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
            redirect(action: "show", id: id)
        }
    }
}
