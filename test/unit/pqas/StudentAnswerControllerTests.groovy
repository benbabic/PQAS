package pqas



import org.junit.*
import grails.test.mixin.*

@TestFor(StudentAnswerController)
@Mock(StudentAnswer)
class StudentAnswerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/studentAnswer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studentAnswerInstanceList.size() == 0
        assert model.studentAnswerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.studentAnswerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.studentAnswerInstance != null
        assert view == '/studentAnswer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/studentAnswer/show/1'
        assert controller.flash.message != null
        assert StudentAnswer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAnswer/list'

        populateValidParams(params)
        def studentAnswer = new StudentAnswer(params)

        assert studentAnswer.save() != null

        params.id = studentAnswer.id

        def model = controller.show()

        assert model.studentAnswerInstance == studentAnswer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAnswer/list'

        populateValidParams(params)
        def studentAnswer = new StudentAnswer(params)

        assert studentAnswer.save() != null

        params.id = studentAnswer.id

        def model = controller.edit()

        assert model.studentAnswerInstance == studentAnswer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAnswer/list'

        response.reset()

        populateValidParams(params)
        def studentAnswer = new StudentAnswer(params)

        assert studentAnswer.save() != null

        // test invalid parameters in update
        params.id = studentAnswer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/studentAnswer/edit"
        assert model.studentAnswerInstance != null

        studentAnswer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/studentAnswer/show/$studentAnswer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        studentAnswer.clearErrors()

        populateValidParams(params)
        params.id = studentAnswer.id
        params.version = -1
        controller.update()

        assert view == "/studentAnswer/edit"
        assert model.studentAnswerInstance != null
        assert model.studentAnswerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/studentAnswer/list'

        response.reset()

        populateValidParams(params)
        def studentAnswer = new StudentAnswer(params)

        assert studentAnswer.save() != null
        assert StudentAnswer.count() == 1

        params.id = studentAnswer.id

        controller.delete()

        assert StudentAnswer.count() == 0
        assert StudentAnswer.get(studentAnswer.id) == null
        assert response.redirectedUrl == '/studentAnswer/list'
    }
}
