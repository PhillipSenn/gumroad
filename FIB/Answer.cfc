component {

function Save(arg) {
	include "/Inc/newQuery.cfm";
	sql = "
	DECLARE @Earned Int = #Val(arg.Earned)#;
	DECLARE @GuessID Int = #Val(arg.GuessID)#;
	DECLARE @AnswerID Int = (
		SELECT AnswerID
		FROM GuessView
		WHERE GuessID=@GuessID
	)
	
	SELECT @Earned = #Val(arg.Earned)#
	UPDATE Guess SET
	 Earned = @Earned
	,GradeDateTime = getdate()
	,GuessDateTime = getdate()
	WHERE GuessID = @GuessID;
	";
	// INSERT INTO Wrk(Wrk_GuessID,Wrk_AnswerID) VALUES(@GuessID,@AnswerID)
	include '/Inc/queryExecute.cfm';
	return result;
}

}