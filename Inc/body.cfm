</head>
<body>
<cfoutput>
<cfif request.fw.navbar NEQ "none">
	<nav class="nav navbar-default #request.fw.navbar#">
		<div class="navbar-inverse">
			<cfif IsDefined("session.Usr")>
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand glyphicon glyphicon-home" href="#request.fw.home#"
						data-toggle="tooltip" data-placement="bottom" title="#session.Usr.CourseDesc#"></a>
					</div>
					<ul class="nav navbar-nav">
						<li><a href="#request.fw.home#/Status/Progress.cfm" data-toggle="tooltip" data-placement="bottom" title="Report">Progress</a></li>
						<li><a href="#request.fw.home#/Calendar/Calendar.cfm">Calendar</a></li>
						<cfif session.Usr.isAdmin>
							<li><a href="#request.fw.home#/Admin/Admin.cfm">Admin</a></li>
							<li><a href="#request.fw.home#/DevVsProd.cfm">#request.fw.DataSource#</a></li>
						</cfif>
					</ul>
					<div class="navbar-collapse collapse">
						<div class="navbar-right">
							<ul class="nav navbar-nav">
								<li class="dropdown">
									<a href="##" class="dropdown-toggle" data-toggle="dropdown">#session.Usr.FirstName# <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#request.fw.home#/Profile/Profile.cfm">Profile</a></li>
										<li class="divider"></li>
										<li><a href="#request.fw.home#?logout">Logout</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			<cfelse>
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand glyphicon glyphicon-home" href="http://lr.edu"
						data-toggle="tooltip" data-placement="bottom" title="lr.edu"></a>
					</div>
				</div>
			</cfif>
		</div>
		<cfif request.fw.mod NEQ "none">
			<div class="msg container<cfif request.fw.msg NEQ ''> #request.fw.mod#</cfif>">
				#request.fw.msg#
			</div>
		</cfif>
	</nav>
	<cfif IsDefined("request.fw.ShowProgress") AND request.fw.ShowProgress>
		<div class="container progress<cfif Paper.PctComplete GE 100> active progress-striped</cfif>">
			<div class="progress-bar" style="width: #Int(Paper.PctComplete)#%"></div>
		</div>
	</cfif>
</cfif>
<main role="main" class="<cfif request.fw.container>container<cfelse>container-fluid</cfif>">
</cfoutput>
