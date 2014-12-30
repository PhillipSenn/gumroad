<cfscript>
include '/Inc/Paper.cfm'
Guess2 = new Picture().PhotoBy(Paper)
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Picture.css">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
     	<img src="Pictures/IMG_0001.jpg">

      <div class="carousel-caption">
        Martin Luther
      </div>
    </div>
    <div class="item">
      <img src="Pictures/IMG_1699.jpg">
      <div class="carousel-caption">
        Javelin
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1702.jpg">
      <div class="carousel-caption">
		Soccer
      </div>
    </div>


    <div class="item">
      <img src="Pictures/IMG_1704.jpg">
      <div class="carousel-caption">
		Lacrosse
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1705.jpg">
      <div class="carousel-caption">
		Lacrosse
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1706.jpg">
      <div class="carousel-caption">
		Basketball
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1707.jpg">
      <div class="carousel-caption">
		Volleyball
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1711.jpg">
      <div class="carousel-caption">
		Little bear
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1712.jpg">
      <div class="carousel-caption">
		The Charge
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1713.jpg">
      <div class="carousel-caption">
		Baseball
      </div>
    </div>

    <div class="item">
      <img src="Pictures/IMG_1715.jpg">
      <div class="carousel-caption">
		Softball
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="##carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="##carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
<table>
	<thead>
		<tr>
			<th class="num">Row</th>
			<th>Description</th>
			<th class="num">Points</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td class="num">#currentRow#</td>
				<td>#QuestionName#
				<cfif QuestionDesc NEQ "">
					<br>&mdash; #QuestionDesc#
				</cfif>
				</td>
				<td class="num">#Points#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<form enctype="multipart/form-data" action="PictureAction.cfm" method="post">
	<label for="PaperName">Heading:</label>
	<input spellcheck="false" name="PaperName" value="#PaperName#" placeholder="Hey Everybody!">
	<label for="PaperDesc">Article:</label>
	<textarea spellcheck="false" rows="10" name="PaperDesc" placeholder="Introduce yourself but also include some research about the landmark">#PaperDesc#</textarea>
	<p>
		<input type="file" name="Attachment">
	</p>
	<p>
		<label for="GuessName">Photo by:</label>
		<input name="GuessName" value="#Guess2.GuessName#">
	</p>
	<p>
		<button name="Save" type="submit">Save</button>
	</p>
	<input type="hidden" name="PaperID" value="#PaperID#">
	<input type="hidden" name="GuessID" value="#Guess2.GuessID#">
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>