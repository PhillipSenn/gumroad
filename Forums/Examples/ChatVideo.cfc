component {
/*
function ExistingChats() {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	SELECT *
	FROM GuessView
	WHERE UsrID = @UsrID
	AND ActName like '%chat%'
	"
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
*/
function CommentsOnThisVideo(arg) {
	include "/Inc/newQuery.cfm"
	sql = '
	DECLARE @ActSort Int = #Val(arg.ActSort)#
	DECLARE @CourseID Int = #Val(session.Usr.qry.CourseID)#
	SELECT *
	FROM GuessView
	WHERE ActSort = @ActSort
	AND CourseID = @CourseID
	ORDER BY GuessID
	'
	include "/Inc/execute.cfm"
	return result
}

remote function Save(PaperID,GuessName) returnformat='plain' {
	include "/Inc/newQuery.cfm"
	sql = '
	DECLARE @PaperID Int = #Val(arguments.PaperID)#
	DECLARE @AnswerID Int
	DECLARE @Points Int
	DECLARE @GuessID Int

	UPDATE Guess SET
	 Earned = 0
	WHERE Guess_PaperID = @PaperID

	SELECT @AnswerID = AnswerID
	,@Points = Points
	FROM AnswerView
	WHERE ActID = (
		SELECT ActID
		FROM PaperView
		WHERE PaperID = @PaperID
	)
	INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,Earned,GradeDateTime) VALUES
	(@PaperID
	,@AnswerID
	,?
	,@Points
	,getdate()
	)
	SELECT @GuessID = Scope_Identity()

	DECLARE @AssignmentStop DateTime2
	DECLARE @QuestionSort Int
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#
	SELECT @AssignmentStop = AssignmentStop
	,@QuestionSort = ActSort
	FROM GuessView
	WHERE GuessID = @GuessID

	IF getdate() < @AssignmentStop BEGIN
		UPDATE Guess SET Earned = 100
		,GradeDateTime = getdate()
		WHERE GuessID = (
			SELECT GuessID
			FROM GuessView
			WHERE QuestionSort = @QuestionSort
			AND ActName like '%attendance%'
			AND UsrID = @UsrID
		)
	END
	'
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arguments.GuessName)
	include "/Inc/execute.cfm"
	// There's no compelling reason to insert into wrk yet.
	
	
	include "/Inc/newQuery.cfm"
	sql = "
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#
	DECLARE @PaperID Int
	DECLARE @AnswerID Int
	SELECT @PaperID = PaperID
	,@AnswerID=AnswerID
	FROM GuessView
	WHERE ActName like '%chat%'
	AND UsrID = @UsrID
	INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,GradeDateTime) VALUES
	(@PaperID
	,@AnswerID
	,?
	,getdate()
	)
	"
	local.Paper = new com.Paper().Read(arguments)
	local.GuessName = '<a href="ChatVideo.cfm?ActSort=#local.Paper.qry.ActSort#">#local.Paper.qry.ActName#</a>: #arguments.GuessName#'
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.GuessName)
	include "/Inc/execute.cfm"
}
}