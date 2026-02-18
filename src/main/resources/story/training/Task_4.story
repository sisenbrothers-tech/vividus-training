Scenario: Navigate to the website homepage
Given I am on main application page
When I ESTABLISH baseline with name "homepage"
Then visual difference for "homepage" is less than 0.01


Scenario: Log in as a User
Given I am on main application page
When I enter '${user.login}' into the element located by css selector "#user-name"
And I enter '${user.password}' into the element located by css selector "#password"
And I click on the element located by css selector "#login-button"
When I ESTABLISH baseline with name "inventory"
Then visual difference for "inventory" is less than 0.01