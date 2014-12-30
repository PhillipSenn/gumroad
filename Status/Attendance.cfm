<cfscript>
Act = new com.Act().Where('ActSort',url)
Question = new com.Question().Where('ActID',Act.ActID)
Question = new com.Question().get(Question.QuestionSort) // QuestionSort = QuestionID of the assignment that this is the attendance for
location(request.fw.home & '/' & Question.ActLink & '?ActSort=' & Question.ActSort,false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>