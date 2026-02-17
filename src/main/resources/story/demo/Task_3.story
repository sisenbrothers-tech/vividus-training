Scenario: Login and check inventory for all users
Given Open SauceDemo homepage
When Login as user ${user.login} with password ${user.password}
Then the number of elements located by css selector ".inventory_item" is equal to 6
