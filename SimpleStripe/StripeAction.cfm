<cfscript>
if (!Len(form.PersonName)) {
	request.fw.msg = 'Custom msg: Please enter your name.'
}
if (!isValid('email', form.email)) {
	request.fw.msg = 'Custom msg: Please enter a valid Email.'
}
if (form.amount < 1) {
	request.fw.msg = 'Custom msg: Please select an amount.'
}
if (IsDefined('form.card')) {
	if (!Len(form.card)) {
		request.fw.msg = 'Custom msg: Something went wrong with your credit card information. Please double-check it.'
	}
} else {
	request.fw.msg = 'Custom msg: Missing form.card.'
}
include 'Passwords.cfm'
</cfscript>

<cfif (request.fw.msg == '')>
	<cfhttp 
		method="post"
		url="https://api.stripe.com/v1/charges"
		username="#Stripe.SecretKey#">
		<cfhttpparam type="formfield" name="amount" value="#form.amount#">	<!--- in cents --->
		<cfhttpparam type="formfield" name="currency" value="usd">
		<cfhttpparam type="formfield" name="card" value="#form.card#"> <!--- This was populated by JavaScript --->
		<!---
		A description of the transaction to show up in OUR records for tracking purposes. 
		It is considered a good practice to add the Email address here in order to follow up if necessary. 
		--->
		<cfhttpparam type="formfield" name="description" value="Phillip Senn and Scott. (#form.email#).">
	</cfhttp>
	<cfset response = deserializeJSON(cfhttp.fileContent)>
</cfif>
<cfscript>
if (IsDefined('response.error')) {
	request.fw.msg = response.error.message
}
if (request.fw.msg != '') {
	request.fw.mod = 'label-danger'
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif IsDefined('response.id')>
	<table>
		<tr>
			<td>response.id</td>
			<td>#response.id#</td>
		</tr>
		<tr>
			<td>response.object</td>
			<td>#response.object#</td>
		</tr>
		<tr>
			<td>response.created</td>
			<td>#response.created#</td>
		</tr>
		<tr>
			<td>response.livemode</td>
			<td>#response.livemode#</td>
		</tr>
		<tr>
			<td>response.paid</td>
			<td>#response.paid#</td>
		</tr>
		<tr>
			<td>response.amount</td>
			<td>#response.amount#</td>
		</tr>
		<tr>
			<td>response.currency</td>
			<td>#response.currency#</td>
		</tr>
		<tr>
			<td>response.refunded</td>
			<td>#response.refunded#</td>
		</tr>



		<tr>
			<td>response.captured</td>
			<td>#response.captured#</td>
		</tr>

		<tr>
			<td>response.balance_transaction</td>
			<td>#response.balance_transaction#</td>
		</tr>

		<tr>
			<td>response.failure_code</td>
			<td>#response.failure_code#</td>
		</tr>

		<tr>
			<td>response.description</td>
			<td>#response.description#</td>
		</tr>

		<tr>
			<td>response.dispute</td>
			<td>#response.dispute#</td>
		</tr>

		<tr>
			<td>response.disputed</td>
			<td>#response.disputed#</td>
		</tr>

		<tr>
			<td colspan="2">response.metadata</td>
		</tr>

		<tr>
			<td>response.statement_description</td>
			<td>#response.statement_description#</td>
		</tr>

		<tr>
			<td>response.receipt_email</td>
			<td>#response.receipt_email#</td>
		</tr>

		<tr>
			<td>response.receipt_number</td>
			<td>#response.receipt_number#</td>
		</tr>

		<tr>
			<td>response.fee</td>
			<td>#response.fee#</td>
		</tr>
	</table>

	<table>
		<cfloop from="1" to="#ArrayLen(response.fee_details)#" index="i">
			<tr>
				<td>response.fee_details[#i#].amount</td>
				<td>#response.fee_details[i].amount#</td>
			</tr>

			<tr>
				<td>response.fee_details[#i#].currency</td>
				<td>#response.fee_details[i].currency#</td>
			</tr>

			<tr>
				<td>response.fee_details[#i#].type</td>
				<td>#response.fee_details[i].type#</td>
			</tr>

			<tr>
				<td>response.fee_details[#i#].description</td>
				<td>#response.fee_details[i].description#</td>
			</tr>

			<tr>
				<td>response.fee_details[#i#].application</td>
				<td>#response.fee_details[i].application#</td>
			</tr>

			<tr>
				<td>response.fee_details[#i#].amount_refunded</td>
				<td>#response.fee_details[i].amount_refunded#</td>
			</tr>
		</cfloop>
	</table>
	<table>
		<tr>
			<td>response.card.id</td>
			<td>#response.card.id#</td>
		</tr>
		<tr>
			<td>response.card.object</td>
			<td>#response.card.object#</td>
		</tr>
		<tr>
			<td>response.card.last4</td>
			<td>#response.card.last4#</td>
		</tr>
		<tr>
			<td>response.card.brand</td>
			<td>#response.card.brand#</td>
		</tr>
		<tr>
			<td>response.card.funding</td>
			<td>#response.card.funding#</td>
		</tr>
		<tr>
			<td>response.card.exp_month</td>
			<td>#response.card.exp_month#</td>
		</tr>
		<tr>
			<td>response.card.exp_year</td>
			<td>#response.card.exp_year#</td>
		</tr>
		<tr>
			<td>response.card.fingerprint</td>
			<td>#response.card.fingerprint#</td>
		</tr>
		<tr>
			<td>response.card.country</td>
			<td>#response.card.country#</td>
		</tr>
		<tr>
			<td>response.card.address_city</td>
			<td>#response.card.address_city#</td>
		</tr>
		<tr>
			<td>response.card.cvc_check</td>
			<td>#response.card.cvc_check#</td>
		</tr>
		<tr>
			<td>response.card.customer</td>
			<td>#response.card.customer#</td>
		</tr>
		<tr>
			<td>response.card.type</td>
			<td>#response.card.type#</td>
		</tr>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>