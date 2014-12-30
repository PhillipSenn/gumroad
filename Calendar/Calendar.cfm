<cfscript>
TermStart = session.Usr.TermStart
while (DayOfWeek(TermStart) != 1) { /* Sunday */
	TermStart = DateAdd("d",-1,TermStart)
}
for (Today=TermStart;Today <= session.Usr.FinalGradesDue+7; Today++) {
	i = datediff('d',TermStart,Today)+1
	arr[i] = '<ul class="list-group">'
}
Assignment = new Calendar().WhereCourseID(session.Usr)
for(qry in Assignment) {
	i = DateDiff('d',TermStart,qry.AssignmentStart)+1
	arr[i] &= '<li class="list-group-item"><a class="' 
	& qry.ActSort & '" href="' & request.fw.home & "/" & qry.ActLink 
	& '?ActSort=' & qry.ActSort & '">' & qry.ActName & '</a></li>'
}
for (qry in Assignment) {
	i = DateDiff('d',TermStart,qry.AssignmentStop)+1
	arr[i] &= '<li class="list-group-item btn-danger"><a class="' 
	& qry.ActSort & '" href="' & request.fw.home & "/" & qry.ActLink 
	& '?ActSort=' & qry.ActSort & '">' & qry.ActName & '</a></li>'
}

i = DateDiff('d',TermStart,session.Usr.FinalGradesDue)+1
arr[i] = '<ul class="list-group"><li>Grades Due by 10am</li></ul>'

for (Today=TermStart;Today<=session.Usr.FinalGradesDue;Today++) {
	i = DateDiff('d',TermStart,qry.AssignmentStart)+1
	if (arr[i] EQ '<ul class="list-group">') {
		arr[i] = ""
	} else {
		arr[i] &= "</ul>"
	}
}
request.fw.container = false
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Calendar.css">
<cfinclude template="/Inc/body.cfm">
<cfloop from="#TermStart#" to="#session.Usr.FinalGradesDue#" index="Today" step="7">
	<cfset i = DateDiff('d',TermStart,Today)+1>

	<div class="week row">
		<div class="Sun col-sm-3">
			<div class="date">
				<header class="bg text-center">Sun #DateFormat(Today+0,"mm/dd")#</header>
				<div>#arr[i+0]#</div>
			</div>
		</div>
		<div class="Mon col-sm-3">
			<div class="date">
				<header class="bg text-center">Mon</header>
				<div>#arr[i+1]#</div>
			</div>
		</div>
		<div class="Tue col-sm-1">
			<div class="date">
				<header class="bg text-center">Tue</header>
				<div>#arr[i+2]#</div>
			</div>
		</div>
		<div class="Wed col-sm-1">
			<div class="date">
				<header class="bg text-center">Wed</header>
				<div>#arr[i+3]#</div>
			</div>
		</div>
		<div class="Thr col-sm-1">
			<div class="date">
				<header class="bg text-center">Thr</header>
				<div>#arr[i+4]#</div>
			</div>
		</div>
		<div class="Fri col-sm-1">
			<div class="date">
				<header class="bg text-center">Fri</header>
				<div>#arr[i+5]#</div>
			</div>
		</div>
		<div class="Sat col-sm-2">
			<div class="date">
				<header class="bg text-center">Sat #DateFormat(Today+6,"mm/dd")#</header>
				<div>#arr[i+6]#</div>
			</div>
		</div>
	</div>
</cfloop>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>