GivenStories: demo/Homepage_Demo.story

Scenario: Login and check inventory
When I login as a good user
Then the inventory page is loaded
And there are 6 inventory items on the page
And I take a screenshot of the loaded page

