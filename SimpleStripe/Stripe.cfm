<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1> Accepting Online Payments With Stripe </h1>
<form method="post" action="StripeAction.cfm">
	<label for="PersonName">Name:</label>
	<input id="PersonName" name="PersonName" value="John Doe">
	<label for="Email">Email:</label>
	<input type="email" id="Email" name="Email" value="JohnDoe@gmail.com">
	<label for="amount">amount:</label>
	<select id="amount" name="amount">
		<option value="100">$1.00</option>
		<option value="1000">$10.00</option>
		<option value="10000">$100.00</option>
		<option value="40000">$400.00</option>
		<option value="50000">$500.00</option>
	</select>

	<label>Credit Card:
		<input data-stripe="number" value="4242424242424242">
	</label>

	<label>Expiration:
		<input data-stripe="exp-month" size="2" value="12">
		<input data-stripe="exp-year" size="4" value="2015"> <em>(MM/YYYY)</em>
	</label>
	<label>Security Code:
		<input data-stripe="cvc" value="1234">
	</label>
	<p>
		<button type="button" name="Save">Make A Donation!</button>
	</p>
</form>
<a href="http://www.bennadel.com/blog/2286-Accepting-PCI-Compliant-Payments-Without-A-Merchant-Account-Using-Stripe-And-ColdFusion.htm">Blog post</a>
<cfinclude template="/Inc/foot.cfm">
<script src="https://js.stripe.com/v2/"></script>
<script src="Stripe.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>