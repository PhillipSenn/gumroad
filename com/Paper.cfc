component extends='com' {
Variables.fw.TableName = 'Paper'

function Create(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT AssignmentID
	FROM AssignmentView
	WHERE CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = ?
	)
	AND ActSort = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]
	include '/Inc/queryExecute.cfm'
	if (!result.recordCount) {
		echo("There's no assignment for this activity.")
		abort;
	}

	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @AssignmentID Int = ?
	IF NOT EXISTS(
		SELECT PaperID
		FROM PaperView
		WHERE UsrID = @UsrID
		AND AssignmentID = @AssignmentID
	) BEGIN
		INSERT INTO Paper(Paper_UsrID,Paper_AssignmentID) VALUES(@UsrID,@AssignmentID)
	END
	'
	params = [
		 session.Usr.UsrID
		,result.AssignmentID
	]
	include '/Inc/queryExecute.cfm'
	return WhereActSort(arg)
}

function WhereActSort(arg) {
	include '/Inc/newQuery.cfm'
	// Earned is used as a reward if equal to 100
	sql = '
	DECLARE @UsrID Int = ?
	SELECT PaperID,PaperName,PaperDesc
	,ActName,ActDesc,ActLink,ActOnline,ActID,ActSort,Questions
	,AssignmentID,AssignmentStart,AssignmentStop
	,CourseName,CourseSort
	,PersonName
	,isNull(Earned,0) AS Earned
	,isNull(100.0*Answered/Questions,0) AS PctComplete
	FROM PaperView
	LEFT JOIN (
		SELECT
		 Guess_PaperID
		,Sum(Earned) AS Earned
		FROM GuessView
		GROUP BY Guess_PaperID
	) Guess
	ON Guess_PaperID = PaperID
	LEFT JOIN (
		SELECT
		 PaperID AS A_PaperID
		,Count(*) AS Answered
		FROM GuessView
		WHERE GuessDateTime is not null
		GROUP BY PaperID
	) A
	ON A_PaperID = PaperID
	WHERE UsrID = @UsrID
	AND ActSort = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Upload(arg) {
	//WriteOutput('Len(arg.Attachment): ' & Len(arg.Attachment) & '<br>')
	if (Len(arg.Attachment)) {
		local.response = fileUpload(getTempDirectory())
		//WriteOutput('response.fileWasSaved: ' & response.fileWasSaved & '<br>')
		if (local.response.fileWasSaved) {
			local.sourcefile  = local.response.ServerDirectory & '\' & local.response.serverFile
	
			// Move it into their subfolder
			local.PersonName = Replace(session.Usr.PersonName,' ','','all')
			local.relativePath = request.fw.home & '/Students/' 
				& session.Usr.CourseName & '.' 
				& session.Usr.CourseSort & '/' 
				& local.PersonName
			local.ServerPath = ExpandPath(local.relativePath)
			local.newFile = ''
			for (var i=1; i <= Len(local.response.serverFile); i++) {
				if (FindNoCase(Mid(local.response.serverFile,i,1),'abcdefghijklmnopqrstuvwxyz1234567890._')) {
					local.newFile &= Mid(local.response.serverFile,i,1)
				}
			}
			if (local.newFile == '') {
				local.newfile = 'x'
			}
			local.destination = local.ServerPath & '\' & local.newfile // & '.' & local.response.serverFileExt
			if (!DirectoryExists(local.ServerPath)) {
				DirectoryCreate(local.ServerPath)
			}
			//WriteOutput('FileMove(' & sourcefile & ',' & destination & '<br>')
			FileMove(local.sourcefile, local.destination) 
	
			// Paper.Attachment is the name of the file.
			include '/Inc/newQuery.cfm'
			sql = '
			UPDATE Paper SET
			 Attachment = ?
			,StudentFileName = ?
			WHERE PaperID = ?
			'
			params = [
				 local.newFile
				,local.response.serverFile
				,arg.PaperID
			]
			include '/Inc/queryExecute.cfm'

			include '/Inc/newQuery.cfm'
			sql = '
			UPDATE Guess
			SET Earned=(
				SELECT Points
				FROM GuessView
				WHERE GuessID = Guess.GuessID
			)
			,GradeDateTime=null
			,GuessDateTime=getdate()
			WHERE Guess_PaperID=?
			'
			params = [
				arg.PaperID
			]
			include '/Inc/queryExecute.cfm'
		}
	}
}

function WherePaperID(arg) {
	include '/Inc/newQuery.cfm'

	sql = '
	SELECT PaperView.*
	,isNull(Earned,0) AS Earned
	FROM PaperView
	LEFT JOIN (
		SELECT
		 Guess_PaperID
		,Sum(Earned) AS Earned
		FROM GuessView
		GROUP BY Guess_PaperID
	) Guess
	ON Guess_PaperID = PaperID
	WHERE PaperID = ?
	'
	params = [
		 arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
