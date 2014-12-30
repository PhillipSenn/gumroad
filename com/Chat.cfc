component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	DECLARE @PaperID Int
	DECLARE @ActID Int = (
		SELECT ActID
		FROM Act
		WHERE ActName like '%chat%'
	)
	IF NOT EXISTS (SELECT * FROM PaperView WHERE ActID=@ActID AND UsrID=@UsrID) BEGIN
		INSERT INTO Paper(Paper_UsrID,Paper_AssignmentID)
		SELECT @UsrID,AssignmentID
		FROM AssignmentView
		WHERE ActID = @ActID
		AND CourseID = (
			SELECT CourseID
			FROM UsrView
			WHERE UsrID = @UsrID
		)
	END
	SELECT @PaperID = PaperID
		FROM PaperView
		WHERE ActID = @ActID
		AND UsrID = @UsrID
	DECLARE @AnswerID Int = (
		SELECT AnswerID
		FROM AnswerView
		WHERE ActID = @ActID
	)
	
	INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime) VALUES(
		 @PaperID
		,@AnswerID
		,?
		,getdate()
	)
	"
	local.GuessName = '<div><span class="heading QuestionID#Val(arg.QuestionID)#">#arg.QuestionDesc#</span></div>#arg.GuessName#'
	if (arg.GuessComment != '') {
		local.GuessName &= '<div class="comment">&mdash; #arg.GuessComment#</div>'
	}
	params = [
		 session.Usr.UsrID
		,local.GuessName
	]
	include '/Inc/queryExecute.cfm'
}
}
