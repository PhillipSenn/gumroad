<cfscript>
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
request.fw.container = false
Answer = new com.Pgm().LectureNotes(Guess)
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="../html/html.css">
<link rel="stylesheet" href="cssSave.css">
<cfinclude template="/Inc/body.cfm">
<form class="row" method="post">
	<div class="col-sm-5" id="columnA">
		<fieldset>
			<legend>HTML</legend>
			<textarea name="htmlCode" rows="5" spellcheck="false">#form.htmlCode#
			</textarea>
		</fieldset>
		<fieldset>
			<legend>CSS</legend>
			<textarea id="GuessName" name="GuessName" rows="10" autofocus spellcheck="false">#GuessName#</textarea>
			<input type="hidden" name="GuessID" value="#GuessID#">
		</fieldset>
	</div>
	<div class="col-sm-6" id="columnB">
		<fieldset id="result">
			<legend>Result</legend>
			<div id="output"></div>
		</fieldset>
	</div>
	<div class="col-sm-1">
		<a href="cssIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
		<button name="Save" type="submit">Save</button>
		<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Color</button>
	</div>
</form>
<div class="row">
	<div class="col-sm-5">
		<fieldset>
			<legend>Assignment</legend>
			#QuestionDesc#
		</fieldset>
	</div>
	<div class="col-sm-6">
		<fieldset id="LectureNotes">
			<legend>#QuestionName#</legend>
			#Answer.AnswerName#
		</fieldset>
	</div>
</div>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Named colors</h4>
		</div>
		<div class="modal-body">
			<ul class="list-unstyled">
				<li>AliceBlue</li>
				<li>AntiqueWhite</li>
				<li>Aqua</li>
				<li>Aquamarine</li>
				<li>Azure</li>
				<li>Beige</li>
				<li>Bisque</li>
				<li>Black</li>
				<li>BlanchedAlmond</li>
				<li>Blue</li>
				<li>BlueViolet</li>
				<li>Brown</li>
				<li>BurlyWood</li>
				<li>CadetBlue</li>
				<li>Chartreuse</li>
				<li>Chocolate</li>
				<li>Coral</li>
				<li>CornflowerBlue</li>
				<li>Cornsilk</li>
				<li>Crimson</li>
				<li>Cyan</li>
				<li>DarkBlue</li>
				<li>DarkCyan</li>
				<li>DarkGoldenRod</li>
				<li>DarkGray</li>
				<li>DarkGreen</li>
				<li>DarkKhaki</li>
				<li>DarkMagenta</li>
				<li>DarkOliveGreen</li>
				<li>DarkOrange</li>
				<li>DarkOrchid</li>
				<li>DarkRed</li>
				<li>DarkSalmon</li>
				<li>DarkSeaGreen</li>
				<li>DarkSlateBlue</li>
				<li>DarkSlateGray</li>
				<li>DarkTurquoise</li>
				<li>DarkViolet</li>
				<li>DeepPink</li>
				<li>DeepSkyBlue</li>
				<li>DimGray</li>
				<li>DodgerBlue</li>
				<li>FireBrick</li>
				<li>FloralWhite</li>
				<li>ForestGreen</li>
				<li>Fuchsia</li>
				<li>Gainsboro</li>
				<li>GhostWhite</li>
				<li>Gold</li>
				<li>GoldenRod</li>
				<li>Gray</li>
				<li>Green</li>
				<li>GreenYellow</li>
				<li>HoneyDew</li>
				<li>HotPink</li>
				<li>IndianRed </li>
				<li>Indigo </li>
				<li>Ivory</li>
				<li>Khaki</li>
				<li>Lavender</li>
				<li>LavenderBlush</li>
				<li>LawnGreen</li>
				<li>LemonChiffon</li>
				<li>LightBlue</li>
				<li>LightCoral</li>
				<li>LightCyan</li>
				<li>LightGoldenRodYellow</li>
				<li>LightGray</li>
				<li>LightGreen</li>
				<li>LightPink</li>
				<li>LightSalmon</li>
				<li>LightSeaGreen</li>
				<li>LightSkyBlue</li>
				<li>LightSlateGray</li>
				<li>LightSteelBlue</li>
				<li>LightYellow</li>
				<li>Lime</li>
				<li>LimeGreen</li>
				<li>Linen</li>
				<li>Magenta</li>
				<li>Maroon</li>
				<li>MediumAquaMarine</li>
				<li>MediumBlue</li>
				<li>MediumOrchid</li>
				<li>MediumPurple</li>
				<li>MediumSeaGreen</li>
				<li>MediumSlateBlue</li>
				<li>MediumSpringGreen</li>
				<li>MediumTurquoise</li>
				<li>MediumVioletRed</li>
				<li>MidnightBlue</li>
				<li>MintCream</li>
				<li>MistyRose</li>
				<li>Moccasin</li>
				<li>NavajoWhite</li>
				<li>Navy</li>
				<li>OldLace</li>
				<li>Olive</li>
				<li>OliveDrab</li>
				<li>Orange</li>
				<li>OrangeRed</li>
				<li>Orchid</li>
				<li>PaleGoldenRod</li>
				<li>PaleGreen</li>
				<li>PaleTurquoise</li>
				<li>PaleVioletRed</li>
				<li>PapayaWhip</li>
				<li>PeachPuff</li>
				<li>Peru</li>
				<li>Pink</li>
				<li>Plum</li>
				<li>PowderBlue</li>
				<li>Purple</li>
				<li>Red</li>
				<li>RosyBrown</li>
				<li>RoyalBlue</li>
				<li>SaddleBrown</li>
				<li>Salmon</li>
				<li>SandyBrown</li>
				<li>SeaGreen</li>
				<li>SeaShell</li>
				<li>Sienna</li>
				<li>Silver</li>
				<li>SkyBlue</li>
				<li>SlateBlue</li>
				<li>SlateGray</li>
				<li>Snow</li>
				<li>SpringGreen</li>
				<li>SteelBlue</li>
				<li>Tan</li>
				<li>Teal</li>
				<li>Thistle</li>
				<li>Tomato</li>
				<li>Turquoise</li>
				<li>Violet</li>
				<li>Wheat</li>
				<li>White</li>
				<li>WhiteSmoke</li>
				<li>Yellow</li>
				<li>YellowGreen</li>
			</ul>
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<script src="css.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>