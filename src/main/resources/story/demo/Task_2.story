GivenStories: demo/Homepage_Demo.story

Scenario: Login and check inventory
When I navigate to the page with the URL '${web.url}'
And I enter '${user.login}' into the element located by xpath "//input[@data-test='username']"
And I enter '${user.password}' into the element located by xpath "//input[@data-test='password']"
And I click on the element located by xpath "//input[@data-test='login-button']"
Then the page title is equal to "Swag Labs"
And the number of elements located by xpath "//div[@class='inventory_item']" is equal to 6
And I take screenshot
