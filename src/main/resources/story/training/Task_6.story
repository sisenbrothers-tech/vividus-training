Meta:
@requirementId=TRAINING-06
@group=practice

Scenario: 4.1 Log In (Examples)
When I Navigate to the SauceDemo website homepage
When I Login as user `<username>` with password `<password>`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I click on element located by `id(react-burger-menu-btn)`
When I wait until element located by `id(inventory_sidebar_link)` appears
When I click on element located by `id(logout_sidebar_link)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
Examples:
| username            | password        |
| ${swagGoodUserName} | ${swagPassword} |
| ${swagSlowUserName} | ${swagPassword} |

Scenario: 4.2 Add item to the shopping cart
When I Navigate to the SauceDemo website homepage
When I Login as user `${swagGoodUserName}` with password `${swagPassword}`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I click on element located by `id(<itemPageId>)`
When I click on element located by `id(add-to-cart)`
Then number of elements found by `xpath(//*[@data-test="shopping-cart-badge" and text()='<binIncrement>'])` is equal to `1`
When I click on element located by `id(back-to-products)`
Examples:
| itemName                | itemPageId        | addToCartButtonId                   |binIncrement|
| Sauce Labs Backpack     | item_4_title_link | add-to-cart-sauce-labs-backpack     |1           |
| Sauce Labs Bike Light   | item_0_title_link | add-to-cart-sauce-labs-bike-light   |2           |
| Sauce Labs Bolt T-Shirt | item_1_title_link | add-to-cart-sauce-labs-bolt-t-shirt |3           |

Scenario: 4.3 Validate the number of items in the shopping cart
When I Navigate to the SauceDemo website homepage
When I Login as user `${swagGoodUserName}` with password `${swagPassword}`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `xpath(//span[contains(@class,'shopping_cart_badge') and text()='3'])` is equal to `1`

Scenario: 4.4 Log Out and Reset
When I Navigate to the SauceDemo website homepage
When I Login as user `${swagGoodUserName}` with password `${swagPassword}`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I click on element located by `id(react-burger-menu-btn)`
When I wait until element located by `id(inventory_sidebar_link)` appears
When I click on element located by `id(reset_sidebar_link)`
When I click on element located by `id(logout_sidebar_link)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`