const { Given, When, Then } = require('cucumber')
const { client } = require('nightwatch-api')

Given('the user has browsed to the login page', function () {
	return client.page.loginPage().navigate();
});

When('user logs in with username {string} and password {string}', function (username, password) {
	return client.page.loginPage().userLogsInWithUsernameAndPassword(username, password);
});

Then('the user should be directed to the homepage', function () {
	return client.page.loginPage().successfulLogin();
});

Then('the user should not be able to login', function () {
	return client.page.loginPage().unsuccessfulLogin();
});

Then('error message {string} should be displayed in the webUI', function (errormessage) {
	return client.page.loginPage().loginErrorDisplayed(errormessage);
});

// When('user browses to the forgotten password page', function () {
//    return client.page.loginPage().userBrowsesToForgottenPassword();
// });

// When('the user enters login {string} and the security code', function (username) {
//     return client.page.loginPage().userEntersSecurityCode(username);
//
// });
//
// Then('the message {string} should be displayed in the webUI', async function (codeMessage) {
// await client.page.loginPage().messageForSecurityCode(codeMessage);
// });





