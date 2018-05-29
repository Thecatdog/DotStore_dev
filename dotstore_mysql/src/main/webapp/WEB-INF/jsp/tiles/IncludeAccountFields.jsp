<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<hr class="account-hr" />

<table class="n13" align="center">
  <tr>
    <td class="label">First name</td>
    <td><form:input path="account.firstName" class="form-control" />
      <form:errors path="account.firstName" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Last name</td>
    <td><form:input path="account.lastName" class="form-control" /> 
      <form:errors path="account.lastName" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Email</td>
    <td><form:input path="account.email" class="form-control" />
      <form:errors path="account.email" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Phone</td>
    <td><form:input path="account.phone" class="form-control" /> 
      <form:errors path="account.phone" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Address 1</td>
    <td><form:input path="account.address1" class="form-control"/>
      <form:errors path="account.address1" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Address 2</td>
    <td><form:input path="account.address2" class="form-control"/>
      <form:errors path="account.address2" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">City</td>
    <td><form:input path="account.city" class="form-control"/> 
      <form:errors path="account.city" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">State</td>
    <td><form:input path="account.state" class="form-control"/> 
      <form:errors path="account.state" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Zip</td>
    <td><form:input path="account.zip" class="form-control"/> 
      <form:errors path="account.zip" cssClass="error" /></td>
  </tr>
  <tr>
    <td class="label">Country</td>
    <td><form:input path="account.country" class="form-control"/>
      <form:errors path="account.country" cssClass="error" /></td>
  </tr>
</table>
<hr class="account-hr" />
<table class="n13" align="center">
	<tr>
		<td colspan="2">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text" for="language-select">Language
						Preference</label>
				</div>
				<form:select class="custom-select" id="language-select"
					path="account.languagePreference" items="${languages}" />
				<form:errors path="account.languagePreference" cssClass="error" />
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text" for="fav-cate-select">Favourite Category</label>
				</div>
				<form:select class="custom-select" id="fav-cate-select" path="account.favouriteCategoryId"
				items="${categories}" /> <form:errors
				path="account.favouriteCategoryId" cssClass="error" />
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2"><form:checkbox path="account.listOption"
				label="Enable MyList" /> <form:errors path="account.listOption"
				cssClass="error" /></td>
	</tr>
	<tr>
		<td colspan="2"><form:checkbox path="account.bannerOption"
				label="Enable MyBanner" /> <form:errors path="account.bannerOption"
				cssClass="error" /></td>
	</tr>
</table>