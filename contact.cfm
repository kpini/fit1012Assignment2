<!--- Header --->
<cfif IsDefined("Form.contactName")>
    <cfmail
        from="#Form.contactEmail#"
        to="pkra4@student.monash.edu"
        subject="#Form.contactSubject#">
    
    #Form.contactName# says: #Form.contactMessage#, contact phone is #Form.contactPhone#
    
    </cfmail>
</cfif>
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="index.cfm">Fitness Movement</a></li>
        <li><a href="contact.cfm">Contact</a></li>
    </ul>
</div>

<h2 id="page-title">Contact Us</h2>

<div id="page-wrap">

<div id="contact-details">
	<p>Here are some of the ways you can contact us. Alternatively, you can send us an email using the contact form.</p>
	<h3>Telephone Support</h3>
	<dl>
		<dt>Customer Enquiries</dt>
		<dd>1300 123 456</dd>
		<dt>Complaints</dt>
		<dd>1300 123 567</dd>
		<dt>Corporate</dt>
		<dd>(03) 9555 1234</dd>
	</dl>
	<h3>Locations</h3>
	<dl>
		<dt>Head Office</dt>
		<dd>
			123 Fake Street, <br />
			Melbourne, <br />
			<abbr name="Victoria">VIC</abbr>, 3000
		</dd>
		<dt>Sydney Office</dt>
		<dd>
			Lv 12, 1 George Street, <br />
			Sydney, <br />
			<abbr name="New South Wales">NSW</abbr>, 2000
		</dd>
	</dl>
</div>

<div id="contact-form">
	<h3>Send us an Email</h3>
	<form action="" method="post" onsubmit="validateContactForm(this); return false;">
		<p id="requiredAlert" class="note">All fields are required to be filled.</p>
		<p>
			<label for="contactName">Name</label>
			<input name="contactName" id="contactName" type="text" />
		</p>
		<p>
			<label for="contactEmail">E-Mail Address</label>
			<input name="contactEmail" id="contactEmail" type="text" />
		</p>
		<p>
			<label for="contactPhone">Contact Number</label>
			<input name="contactPhone" id="contactPhone" type="text" />
		</p>
		<p>
			<label for="contactSubject">Subject</label>
			<select name="contactSubject" id="contactSubject">
				<option value="" selected="">Please select one...</option>
				<option value="Product Enquiry">Product Enquiry</option>
				<option value="Sales Support">Sales Support</option>
				<option value="Website Feedback">Website Feedback</option>
				<option value="Complaints and Returns">Complaints and Returns</option>
				<option value="Other">Other</option>
			</select>
		</p>
		<p>
			<label for="contactMessage">Enquiry Description</label>
			<textarea name="contactMessage" id="contactMessage"></textarea>
		</p>
		<p>
			<button id="sendEmail" type="submit">Send Message</button>
			<button id="resetForm" type="reset">Reset Form</button>
		</p>
	</form>
</div>

</div>

<cfinclude template="footer.cfm" />