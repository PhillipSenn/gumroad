<cfscript>
if (session.Usr.Online) {
	location('Online.cfm?ActSort=' & url.ActSort,false)
}
param name="url.Width" default=480;
include '/Inc/Paper.cfm'
request.fw.container = false
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="CarouselOfProgress.css">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<div class="row">
	<div class="col-sm-6">
		<cfif url.width EQ 640>
			<iframe width="640" height="360" src="//www.youtube.com/embed/CmrSiJTMf7s?rel=0" frameborder="0" allowfullscreen></iframe>
		<cfelse>
			<iframe width="560" height="315" src="//www.youtube.com/embed/CmrSiJTMf7s?rel=0" frameborder="0" allowfullscreen></iframe>
			<p>
				<a href="CarouselOfProgress.cfm?ActSort=#url.ActSort#&Width=640">640</a>
			</p>
		</cfif>
	</div>
	<div class="col-sm-6" id="transcript">
		<h1>Act 1: Spring</h1>
		<p>There's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			And tomorrow's just a dream away</p>
		<p>Man has a dream and that's the start<br>
			He follows his dream with mind and heart<br>
			And when it becomes a reality<br>
			It's a dream come true for you and me</p>
		<p>So there's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			Just a dream away</p>
		<p>John: It looks like  the robins are getting ready to celebrate Valentine's day today.<br>
			What years is it?  Oh, right around the turn of the century.<br>
			Believe me, things  couldn't be any better than they are today.<br>
			Yes sir, buildings  are towering now as high as 20 stories!<br>
			And movie pictures  flicker on a big screen.<br>
			We have almost  8,000 automobiles in this country, and we can travel by train from New York to  California in less than 7 days.<br>
			And even hear tell  about two brothers in North Carolina who are working on something – a flying  contraption. (Laughs) It'll never work.<br>
			Closer to home:  we've now got gas lamps, a telephone, and the latest design in cast iron  stoves.<br>
			And that reservoir  keeps 5 gallons of water hot with just 3 buckets of coal.<br>
			That sure beats  chopping wood.<br>
			And isn't our ice  box a beauty? Look at that! Holds 50 pounds of ice.<br>
			Milk doesn't sour  as quickly as it used to.<br>
			And our dog Rover  here keeps the water in the drip pan from overflowing.<br>
			It wasn't too long  ago, we had to carry water from a well.<br>
			But thanks to  progress, we've got a pump right here in the kitchen.<br>
			Of course, we keep  a bucket of water handy here to prime it with.<br>
			Yes sir! We've got everything we need to make life  easier.<br>
			Say mother!<br>
			Sarah: hmm?<br>
			John: I was reading  about a fellow named Tom Edison who's working on an idea for snap-on electric  lights.<br>
			Sarah: Electric  lights? No more kerosene! No more gas!<br>
			John: Sarah sure gets to the core of the apple.<br>
			Sarah: But we do  have this new wash day marvel. Now it  takes me only 5 hours to do the wash. Imagine! It used to take two days!<br>
			John: That's right  folks, now Sarah has tie for other things, like <br>
			Sarah: Like  canning? And cleaning the oven?<br>
			John: Yes dear.<br>
	Sarah: Ovens don't just clean themselves you know dear?<br>
			John: I know dear. (Laughs). And they  probably never will.<br>
	Sarah: Now if you'll  excuse me I've got to take the laundry off the line before it starts raining  cats and dogs.<br>
			Rover:  Woof! Woof!<br>
			John:  Ah, don't worry Rover, she didn't mean real dogs. Besides, it's not going to  rain today, my lumbago isn't acting up...(thunder)  All you have to do is put your wash on the line, right? Oh well, the cistern  was low anyway.<br>
			James:  Wow wee! Look at that! <br>
			John:  Now James, I thought I told you to ask my permission before using my new  stereoscope. It's not a toy. <br>
	James: Ooh la-la. So that's ... doing the Hoochie-Koochie  eh dad?<br>
			John:  She's the star of the new World's Fair in St. Louis and... You put that away  before you mother finds it.<br>
			James:  Ah dad.<br>
			John:  You heard me. We have one of those new talking machines. Now that is something,  it plays music right here in the home.<br>
			Parrot:  He keeps that thing on all day long. Rack!<br>
			Patricia:  Oh papa!<br>
			John:  Yes Patricia?<br>
			Patricia:  Papa! All these people! Why, I'm indecent! <br>
			John:  Don't worry Patricia: they're friends. That's our  teenage daughter. She's getting ready to go to a valentines dance across town,  on one of those new horseless trolleys.<br>
			Patricia:  I think it's very romantic you taking mother out for valentines dinner this  evening.<br>
			John:  Well, you know what kind of sport I am.<br>
			Patricia:  I only hope I have an evening as romantic as yours and mothers.<br>
			John:  Now you be home by 9 o'clock daughter, you hear me?<br>
			Patricia:  Yes papa.<br>
			John:  Oh well, with all this talking, I've worked up quite a thirst. I think I'll  take one of those newfangled trolleys down to the drug store soda fountain and  meet the boys for a cold sarsaparilla. Oh, I'm  sorry I forgot: we're drinking root beer now. Same kind of thing, different  name. Well, that's progress for you. And speaking of progress...</p>
		<br clear="all">
		<h1>Act  2: Summer</h1>
		<p>&nbsp;</p>
		<p>There's a great big  beautiful tomorrow<br>
			Shining at the end of every day</p>
		<p>There's  a great big beautiful tomorrow<br>
			And  tomorrow's just a dream away</p>
		<p>Man  has a dream and that's the start<br>
			He  follows his dream with mind and heart<br>
			And  when it becomes a reality<br>
			It's  a dream come true for you and me</p>
		<p>So  there's a great big beautiful tomorrow<br>
			Shining  at the end of every day<br>
			There's  a great big beautiful tomorrow<br>
			Just  a dream away</p>
		<p>John:  Whew boy! Hottest fourth of July  week we've had in years. We've come a  long way though since the turn of the century over 20 some odd years ago. You know that pilot fella? Charles Lindbergh? He's  about to fly a single wing airplane all the way across the Atlantic. (Laughs).  He's never going to make it. And sports stadiums are springing up all over.<br>
			And boy nobody hits that old horsehide like  that new fella Babe Ruth. Jazz music is the cat's meow, and there's been ads in  the paper for months for a movie starring Al Jolson he's going to talk and  sing! I've got to see that.<br>
			(Horn honks)<br>
			John: There goes Schwartz and his  automobile. He sure loves that horn. You know in my new Essex I've got an  electric starter! Now I don't have to crank. We can travel from New York to Los  Angeles by train in only three days! Now we've got a house full of new electrical  servants. Mr. Edison sure added life to our home. <br>
			Woah there! You'll blow a fuse! That's the 3rd  one this week. I buy fuses by the case, and I've blown the whole neighborhood  again.<br>
			He did it again. Go over and give that  neighbor of ours what for!<br>
			John: Easy Rover. Jimmy! Hurry up with that  fuse! Drat!<br>
			Jimmy: Shucks every time he ... he blows a  fuse. And guess who always has to change it.<br>
			John: I heard that young man. I heard that!<br>
			Sarah: Well, now that's more like it. John, yours is the last costume I've got to finish  before the parade starts.<br>
			John: Sarah's ladies club is responsible for  our towns 4th of July celebration tonight. She's got us all roped  into performing in their program.<br>
			Sarah: And I've decided we're going as  George and Marsha Washington.<br>
			John: Oh! The father of our country! That's  a role that really fits me. You know...<br>
	Sarah: I'm so  glad we installed an electric light fixture here on the porch. Because it's  just too darned hot to be sewing inside.<br>
			John: Yes, Sarah. You know next year, I'd  like to go as Benedict Arnold?<br>
			Sarah: Wait until you see what I have  planned for the firework show tonight!<br>
			Rover: Woof!<br>
			John: Rover! Don't interrupt while Sarah is  interrupting.<br>
			Sarah: And guess who volunteered to choose  the music for the program?<br>
			Jimmy: I did pop. Listen to this! (Plays  Stars and Stripes forever on the Victrola)<br>
			John: Well, that's a nice tune Jimmy. You  know with that new Crosswave radio set, we can get news and big time  entertainment from all over the country – even Pittsburg! Oh Patricia!<br>
			Patricia: Yes father!<br>
			John: Better get a move on. The radio says  folks are arriving downtown.<br>
			Patricia: Do I really have to go? If my new  boyfriend Theodore sees me in this, it'll scare him away.<br>
			John: (Laughs) Well dear, if that happens  you'll always have that torch you can carry for him.<br>
			Patricia: Oh father!<br>
			Rover: growls.<br>
			John: Calm down Rover, I was only kidding.  By the way, we have indoor plumbing now. Oh boy that's really great on cold  nights, especially for our perennial house guest, ole uncle Orville. Uncle  Orville's taken over the coolest spot in the house of course, and he's rigged  up a real clever contraption. He calls it: air cooling. Too bad he's not  reading the help wanted ads.<br>
			Uncle Orville: No privacy at all around this  place!<br>
			John: Sorry Orville! You know, considering  all the...<br>
			Sarah: George! Suppers ready!<br>
			John: Oh, coming Martha. As I was saying,  considering all the conveniences we now have, I'll say we're really on easy  street these days. It just can't get any better! It just goes to show that</p>
		<br clear="all">
		<h1>Act  3: Autumn</h1>
		<p></p>
		<p>There's  a great big beautiful tomorrow<br>
			Shining  at the end of every day<br>
			There's  a great big beautiful tomorrow<br>
			And  tomorrow's just a dream away</p>
		<p>Man  has a dream and that's the start<br>
			He  follows his dream with mind and heart<br>
			And  when it becomes a reality<br>
			It's  a dream come true for you and me</p>
		<p>So  there's a great big beautiful tomorrow<br>
			Shining  at the end of every day<br>
			There's  a great big beautiful tomorrow<br>
			Just  a dream away<br>
			John:  Well, it's another Halloween here in the fabulous forties. Everything is better  than ever now. And we've got some amazing new wonders around the house to prove  it. For instance, our refrigerator holds more food than ice cubes. And thanks  to our automatic dish washer, I don't have to dry the dishes any more after  suppers. Gives Rover and me more time to enjoy our evening stroll together.<br>
			Oh  and here's something else that's new. I just heard a new term today on the  radio. Fella says we've got something now called the &ldquo;rat race&rdquo;. Did you ever hear that one? It sure describes  my life. I'm involved something now commuting. I drive into the city for work  all day and then turn right around and drive all the way back, and the highways  is crowded with fellow rats doing the same thing.<br>
			Sarah:  That's what they call progress dear.<br>
			John:  Yes, I guess she's right. But we do have television. When it works. Gives you  something to do when you come home. I kind of like it, you know? A guy named  John Cameron Swayze gives you all the news. And then they have all the singing  and dancing. A lot of fluff, but it's fun.<br>
			You  know I predict a day when millions of people will learn Latin and Greek sitting  in front of their TV sets.<br>
			Snoring.<br>
			Are  you awake dear? (No reply). Changes the channel. Give him a left you big lug!<br>
			John:  Ah yes, a new age of electronic civilization is upon us.<br>
			Jimmy:  Hey dad! What do you think of my Jack O lantern?<br>
			John:  Oh boy! That's scary!<br>
			Jimmy:  That's because I'm using my beautiful sister Patty's picture for a model.<br>
			Rover:  Woof!<br>
			John:  Down Rover. Jim: Rover appreciates you joke.<br>
			Sarah:  Now, you're always kidding poor Patty. She's certainly prettier than either of  you.<br>
			(Both  howl)<br>
			John:  You hear that? My daughter Patty is using that old exercise machine she rescued  from the attic. It was all the rage in the twenties. Grandma of course had to  have one. Didn't work then, doesn't work  now. (Laughs). Consistent at least. Makes a lot of noise and blows fuses.<br>
			Patricia:  And as I was saying, I think college is really swell. You should give it a try.<br>
			Caller:  Oh Patty: are you going to the Halloween party tonight?<br>
			Patty:  I'm hoping to lose a few more inches by then...<br>
			John:  Poor Howard. I wonder what they said  about me when I was dating Sarah. (cuckoo clock  cuckoos).<br>
			Rover:  barks.<br>
			John:  You're lucky Rover, you don't have to date. Well, we're caught up in the  do-it-yourself craze these days. We're remodeling our basement into something  called a rumpus room? And we're looking forward to a few rumpuses I'll tell  you. As long as they don't get out of hand.<br>
			Sarah:  John, this papering is getting out of hand. I could use a little help.<br>
			John:  Now Sarah, didn't I setup the clever automatic paint stirring machine for you?  (whirring)<br>
			Sarah:  Yes John, you're a genius. Of course, this will ruin my food mixer, not that  you'd care.<br>
			John:  Oh, good ole Sarah, always the last laugh.<br>
			Whirring  increases.<br>
			Sarah:  Ack!<br>
			John:  What happened Sarah?<br>
			Sarah:  Oh you and your progress! That paint mixer of yours just sloshed paint across  my rump! Uh rumpus, uh room!<br>
			John:  How do you like that? I always say if you're going to to be married, marry a  girl with a sense of humor. Well, it's time to move on. Let's cheer up Sarah by  singing our song. Come on! Everybody:</p>
		<br clear="all">
		<h1>Act  4: New Year's Eve</h1>
		<p></p>
		<p>There's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			And tomorrow's just a dream away</p>
		<p>Man has a dream and that's the start<br>
			He follows his dream with mind and heart<br>
			And when it becomes a reality<br>
			It's a dream come true for you and me</p>
		<p>So there's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			Just a dream away<br>
			John: Isn't it a pleasant holiday? The turkeys in  the oven, it's peaceful and quiet.<br>
			Jimmy:  Yes! 300 points! My best score yet.<br>
			Sarah:  Well, it was peaceful until Santa brought that new virtual reality space pilot  game.<br>
			Jimmy:  It's your turn grandma. Let's switch the image over to the TV so the resident  flying ace can show you how it works. Now it's a little tricky. Just use your  game glove to fly behind the other guy and blast em with your laser blaster!<br>
			Grandma:  Well, I'll give it a try.<br>
			Jimmy:  Take a look around grandma! You're in the ship!<br>
			Grandma:  It feels like I'm really there!<br>
			Jimmy:  OK, get ready! You're about to blast off!<br>
			Grandma:  Here goes nothing!<br>
			Jimmy:  Alright, here it comes. Oh! You missed him!<br>
			Sarah:  Hey everybody. I'm now programming our new voice activation system.<br>
			John:  Now our household items will do anything we tell them to do.<br>
			Grandpa:  Great. Tell the refrigerator to bring me a root beer.<br>
			Sarah:  Well, it can't quite do that. But let me show you that it can do. (beep). Tree  lights 30% brighter.<br>
			Everyone:  Oooh. Wow.<br>
			Grandpa:  Ah, that's no big deal. Anybody can do that voice activated stuff. Watch this:  Rover! Speak!<br>
			Rover  barks.<br>
			Sarah:  John, the oven should be able to use voice commands now. Give it a try.<br>
			John:  OK, here goes. Temperature to 3 7 5.<br>
			Oven:  Temperature increased to 3 7 5.<br>
	Patricia: Look at that. It even talks back!<br>
			John:  Reminds me of certain people I know.<br>
			Patricia:  Yeah, right dad.<br>
			Jimmy:  You gotta lose em grandma. Bank to the right!<br>
			Patricia:  Remember dad's turkey last year?<br>
			Grandpa:  Yeah, that thing really smoked up the place when it burned, didn't it?<br>
			Patricia:  We ended up microwaving frozen pizzas.<br>
			Sarah:  Well, no need to worry about the turkey this year. Now with an oven that will  do anything your father tells it to do.<br>
			Jimmy:  Oh! Good shot! Dad! Grandma's up to 550 points!<br>
			John:  Did you say 550?<br>
			Oven:  Temperature increased to 5 5 0.<br>
			Grandpa:  I can't believe all the new gadgets they've got now. You know in my day...<br>
			Patricia:  Oh no. You're not going to tell us about the old days when you didn't even have  a car phone.<br>
			Grandpa:  For a while, we didn't even have a house phone. Not to mention laser discs and  High Def TV and...Everything is automated today, including (toilet flushes).  Well, including that.<br>
			Uncle  Orville: No privacy at all around this place.<br>
			Grandpa:  Sorry Orville. Anyway, you guys don't know how good you've got it nowadays. <br>
			Grandma:  You know my grandpa told me the very same thing when I was a kid? Take that you nincompoop!<br>
			Jimmy:  Hey check it out dad! Grandma's up to 975 points!<br>
			John:  Wow! Nine hundred and seventy five?<br>
			Oven:  Temperature increased to 9 7 5. Overload. <br>
			Sarah:  John! What's wrong with the oven?<br>
			Oven  door opens. <br>
			Oven:  Enjoy your meal.<br>
	Patricia: Anyone for pizza?<br>
			Sarah:  Oh! Another Christmas turkey ruined.<br>
			Grandma:  Looks like I'm resident flying ace now.<br>
			Jimmy:  Best two out of three grandma?<br>
			Grandma:  Later kid. Boy that was fun. What will they think of next?<br>
			Patricia:  Who knows? We've got a whole new century waiting for us out there.<br>
			Sarah:  Well, maybe sometime in the new century, your father will learn how to talk to  our oven.<br>
			John:  Well, maybe by then, ovens will read our minds. Hey as long as we're all here  and happy and together for the holidays, who cares if I burned our Christmas  turkey?<br>
			Grandma:  I do! I'm starving!<br>
			Everyone  laughs.<br>
			Jimmy:  Don't worry dad. Somebody, everything's going to be so automated, you won't  ever have to cook another Christmas turkey again.<br>
			Rover:  woofs.<br>
			There's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			And tomorrow's just a dream away</p>
		<p>Man has a dream and that's the start<br>
			He follows his dream with mind and heart<br>
			And when it becomes a reality<br>
			It's a dream come true for you and me</p>
		<p>So there's a great big beautiful tomorrow<br>
			Shining at the end of every day<br>
			There's a great big beautiful tomorrow<br>
			Just a dream away</p>
		<p>&nbsp;</p>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>