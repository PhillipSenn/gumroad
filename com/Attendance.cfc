component extends="com" {
Variables.fw.TableName = 'Attendance'
Variables.fw.TableSort = 'UsrName'

function InsertAssignment(arg) {
	// Get the Act that we need to insert into Paper
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT ActID
	FROM AssignmentView
	WHERE CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = ?
	)
	AND ActID = (
		SELECT Att_ActID
		FROM AttView
		WHERE For_ActSort = ?
	)
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]
	include '/Inc/queryExecute.cfm'
	
	if (!result.recordCount) {
		echo("There's no attendance assignment for this activity.")
		dump(result)
		abort;
	}

	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @ActID Int = ?
	IF NOT EXISTS(
		SELECT PaperID
		FROM PaperView
		WHERE UsrID = @UsrID
		AND ActID = @ActID
	) BEGIN
		INSERT INTO Paper(Paper_AssignmentID,Paper_UsrID)
		SELECT AssignmentID,@UsrID
		FROM AssignmentView
		WHERE CourseID = (
			SELECT CourseID
			FROM UsrView
			WHERE UsrID = @UsrID
		)
		AND ActID = @ActID
	END
	SELECT *	
	FROM PaperView
	WHERE UsrID = @UsrID
	AND ActID = @ActID
	'
	params = [
		 session.Usr.UsrID
		,result.ActID // The attendance activity
	]
	include '/Inc/queryExecute.cfm'
	return result
}


function Create(arg) {
	include '/Inc/newQuery.cfm'
	// arg.PaperID is the PaperID for the attendance assignment, not the PaperID for the original assignment.
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @PaperID Int = ?
	DECLARE @For_ActID Int
	DECLARE @Att_ActID Int
		
	IF NOT EXISTS(
		SELECT GuessID
		FROM GuessView
		WHERE PaperID = @PaperID
	) BEGIN

		SELECT @Att_ActID = ActID
		FROM PaperView
		WHERE PaperID = @PaperID

		SELECT @For_ActID = For_ActID
		FROM Att
		WHERE Att_ActID = @Att_ActID

		INSERT INTO Guess(Guess_PaperID,Guess_AnswerID)
		SELECT @PaperID,Att_AnswerID
		FROM GuessView
		JOIN (
			SELECT
			 AnswerID AS Att_AnswerID
			,QuestionSort AS Att_QuestionSort
			FROM AnswerView
			WHERE ActID = @Att_ActID
		) Answer
		ON Att_QuestionSort = QuestionID
		WHERE UsrID = @UsrID
		AND ActID = @For_ActID
	END
	'
	params = [
		 session.Usr.UsrID
		,arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	// Find the ActID And QuestionID for what was just answered.
	// Find the attendance ActID For this ActID
	// Update Guess for the attendance activity whose QuestionSort is the QuestionID that was just answered.
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @GuessID Int = ?
	DECLARE @ActID Int
	DECLARE @QuestionID Int
	DECLARE @Att_ActID Int
	DECLARE @Att_GuessID Int
	
	SELECT
	 @ActID = ActID
	,@QuestionID = QuestionID
	FROM GuessView
	WHERE GuessID = @GuessID
	SELECT @Att_ActID = Att_ActID
	FROM Att
	WHERE For_ActID = @ActID

	SELECT @Att_GuessID = GuessID
	FROM GuessView
	WHERE ActID = @Att_ActID
	AND QuestionSort = @QuestionID
	AND UsrID = @UsrID

	UPDATE Guess SET
	 GuessDateTime = getdate()
	,GradeDateTime = getdate()
	WHERE GuessID = @Att_GuessID
	
	UPDATE Guess SET
	 Guess.Earned=Points
	FROM Guess
	JOIN GuessView
	ON Guess.GuessID = GuessView.GuessID
	WHERE Guess.GuessID = @Att_GuessID
	AND DateDiff(hour,getdate(),AssignmentStop) > -23
	'
	// Reminder: QuestionSort = @QuestionID
	params = [
		 session.Usr.UsrID
		,arg.GuessID
	]
	include '/Inc/queryExecute.cfm'
}

}