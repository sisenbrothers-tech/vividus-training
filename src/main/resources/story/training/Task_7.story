Meta:
    @group Training
    @requirementId MyTask-0007

Scenario: 4.1 Log In (Examples)
When I Navigate to the SauceDemo website homepage
When I Login as user `<username>` with password `<password>`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I click on element located by `id(react-burger-menu-btn)`
When I wait until element located by `id(inventory_sidebar_link)` appears
Examples:
| username            | password        |
| ${swagGoodUserName} | ${swagPassword} |

Scenario: 4.2 Add item to the shopping cart
When I click on element located by `id(<itemPageId>)`
When I click on element located by `id(add-to-cart)`
Then number of elements found by `xpath(//*[@data-test="shopping-cart-badge" and text()='<binIncrement>'])` is equal to `1`
When I click on element located by `id(back-to-products)`
Examples:
| itemName                | itemPageId        | addToCartButtonId                   |binIncrement|
| Sauce Labs Backpack     | item_4_title_link | add-to-cart-sauce-labs-backpack     |1           |
| Sauce Labs Bike Light   | item_0_title_link | add-to-cart-sauce-labs-bike-light   |2           |
| Sauce Labs Bolt T-Shirt | item_1_title_link | add-to-cart-sauce-labs-bolt-t-shirt |3           |

Scenario: 4.3 Populate checkout data
When I click on element located by `className(shopping_cart_link)`
When I click on element located by `id(checkout)`
When I enter `#{generate(Name.firstName)}` in field located by `id(first-name)`
When I enter `#{generate(regexify '[A-Z]{3}[a-z]{3}')}` in field located by `id(last-name)`
When I enter `#{generate(regexify '[A-Z]{3}-\d{5}')}` in field located by `id(postal-code)`
When I take screenshot
When I click on element located by `id(continue)`

Scenario: 4.4 Complete checkout process
When I click on element located by `id(finish)`
When I save text of element located by `className(complete-header)` to scenario variable `actualMessage`
And I initialize scenario variable `expectedMessage` with value `#{loadResource(/data/message.txt)}`
Then `#{eval("${actualMessage}".trim() == "${expectedMessage}".trim())}` is true