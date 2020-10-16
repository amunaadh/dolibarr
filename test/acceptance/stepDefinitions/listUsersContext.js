const { When, Then } = require('cucumber');
const { client } = require('nightwatch-api');
const fetch = require('node-fetch');
const { getDolApiKey } = require('../setup');
let response;
const assert = require('assert');

When('the administrator browses to the list of users page using the webUI', function () {
	return client.page.homePage().browsedToListOfUsers();
});

Then('following users should be displayed in the users list', function (dataTable) {
	return client.page.listUsersPage().listOfUsersDisplayed(dataTable);
});

Then('the number of created users should be {int}', function (number) {
	return client.page.listUsersPage().numberOfUsersDisplayed(number);
});

When('the admin gets the list of all users using the API', function ()
{
	return getUsers();
});

Then('the users list returned by API should be following:', async function (dataTable){
	await usersShouldBe(dataTable);
});

When('user {string} with password {string} tries listing all users using the API', async function (login, password)
{
	const userDolApiKey = await getDolApiKey(login, password);
	console.log(userDolApiKey);
});

const getUsers = async function () {
	const header = {};
	const url = client.globals.backend_url + 'api/index.php/users';
	const users = {};
	header['Accept'] = 'application/json';
	header['DOLAPIKEY'] = client.globals.dolApiKey;
	await fetch(url, {
		method: 'GET',
		headers: header
	})
		.then(async (response) => {
			client.globals.response = response;
	});
};

const usersShouldBe = async function (dataTable) {
	const expectedUsers = dataTable.hashes();
    const users = {};
	const json_response = await client.globals.response.json();
	for (const user of json_response) {
		let found = false;
		users["login"] = user.login;
		users["last name"] = user.lastname;

		for(const expectedUser of expectedUsers){
			if(expectedUser.login === users.login && expectedUser["last name"] === users["last name"]){
				found = true;
			}
		}
		assert.strictEqual(found, true);
	}
};
