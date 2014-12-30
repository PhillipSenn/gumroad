<cfscript>
Paper = new com.Paper().Create(url)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(url)
new com.Attendance().Create(AttPaper)
</cfscript>