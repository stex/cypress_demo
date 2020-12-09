[drag=100, drop=0, bg=assets/img/title.jpg]

[drag=20 10, drop=bottomleft, set=text-gray, fit=0.5]
Stefan Exner | [stex.codes](https://stex.codes)

[drag=50 20, drop=bottomright, set=text-white, fit=2]

Cypress on Rails

Note:

- Who worked with cypress before?

---

# Introduction to Cypress

[drag=75 10, drop=bottom, fit=0.8]

(You'll need this to understand the Rails integration later)

---

[drag=100 25, drop=top]

## What is Cypress?

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
- Website agnostic end-to-end testing framework
- Runs completely in the browser / doesn't need Selenium
- Tests are written in pure Javascript (on top of Mocha, Chai and others)
- Supports Electron, Firefox and Chromium based browsers like the new Edge
@ul

[drag=25 100, drop=left]

![](assets/img/cypress-lights-0.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-1.png)
![](assets/img/cypress-lights-2.png)
![](assets/img/cypress-lights-3.png)
![](assets/img/cypress-lights-4.png)

---

[drag=100 25, drop=top]

## Other Features

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
- Live-Reload on file system changes
- Step-By-Step DOM snapshots
- Request and browser API stubbing
- Full Dev-Tools and `debugger` support
- Video recording in CI
@ul

---

## @fa[internet-explorer] Demonstration

Note:

- Show Demo-Application
- Show Corresponding Cypress-Tests

---

[drag=100 25, drop=top]

## Writing a Basic Test

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/login_spec.js)

[drag=75 10, drop=25 90]

@[1,16]
@[2-5](`before()`, `beforeEach()`, `after()` and `afterEach()` are available)
@[7-15](Aliased (`.as()`) values are available as `this.ALIAS`)

Note:

! `cy.type` verhält sich tatsächlich wie ein Nutzer, capybara war nicht in der lage, einfach in das `div` des richtext editors zu tippen

---

[drag=100 25, drop=7 0]

## Asynchronous Execution

[drag=25 100, drop=topleft]

![](assets/img/cypress-lights-0.png)

[drag=25 25, drop=topleft]

@fa[exclamation-triangle]

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/debugger.js)

[drag=75 10, drop=25 85]

@[1-6]
@[2,3](`cy` commands immediately return `Chainer` objects and are queued for later execution)
@[5](The `debugger` command is executed before either of the above are actually ran)
@[8-15]
@[11-14](`Chainer` objects provide their result by calling `then()` on them. Looks familiar?)

---

[drag=100 25, drop=7 0]

## Commands aren't Promises

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
- Fully synchonous execution of commands
- No `return` (and searching for a missing one for hours)
- No `.catch` (as cypress has its own error handling)
@ul

---

[drag=100 25, drop=top]

## Fixtures

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/fixtures.js)

[drag=75 10, drop=25 85]

@[1-5](Almost every file can be used as fixture, some are automatically validated)
@[7-10](Some file types have custom default representation formats)
@[11-13](The default format can be changed by providing a second argument)

---

[drag=100 25, drop=7 0]

## Custom `cy` Commands

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/custom_commands_simple.js)

[drag=75 10, drop=25 85]

@[1-7](Own commands are available as `cy.COMMAND_NAME`)
@[9-13](Existing commands can be overwritten / overloaded)

---

[drag=100 25, drop=7 0]

## Custom `cy` Commands

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/custom_commands_advanced.js)

[drag=75 10, drop=25 85]

@[1-2](`prevSubject` lets the command receive the previous chain result)
@[1-3](The type of `subject` is validated based on the value of `prevSubject`)
@[3-7](`subject` is guaranteed to be an element, e.g. coming from `cy.get`)
@[9,10,12](Works as `subject` is an element)
@[9,11,12](Raises a validation error as `subject` is not an element)

---

[drag=100 25, drop=7 0]

## Custom `cy` Commands

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 25](src/custom_commands_chainer.js)

[drag=75 10, drop=25 85, fit=0.7]

Own commands return `Chainer` instances just like the predefined ones.

---

[drag=100 25, drop=7 0]

## Additional Goodies

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
- Integrated mechanisms for parallel execution*
- Automatic retries per test
- Pretty good automatic timeouts for almost everything
- Request-Stubbing
@ul

[drag=50 5, drop=25 90, fit=0.5, flow=stack, sync=true, set=text-gray]

*Requires using the Cypress Dashboard (and probably paying for it)

---

[drag=100 25, drop=7 0]

## Additional Goodies

[drag=75 10, drop=15 15]

#### Request-Stubbing

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 100, drop=25 35](src/request_stubbing.js)

[drag=65 20, drop=25 55, fit=0.7]

In theory, the complete backend can be stubbed out in cypress tests  
by using `cy.intercept` and specifying the expected response.

It can also be used to modify requests before they are sent.

---

# Using Cypress with Rails

---

[drag=93 25, drop=7 0]

## Capybara Pros & Cons

[drag=15 100, drop=left]

![](assets/img/capybara.png)

@ul[list-spaced-bullets, drag=75 75, drop=15 25, sync=true]
- **Pros**
  - Access to the whole Rails application inside E2E tests
  - Generating test data on the fly when it's required
- **Cons**
  - Debugging in the browser is difficult
  - It's not fun writing tests (Browser closing/opening, no intelligent auto-reruns, etc.)
  - Very flaky with SPAs
@ul

---

[drag=93 25, drop=7 0]

## Capybara to Cypress

[drag=15 100, drop=left]

![](assets/img/capybara.png)

@code[javascript, fit=0.65, drag=75 100, drop=20 25](src/login_spec.rb)

[drag=75 10, drop=25 85]

@[1-2](🤷‍♀️)
@[1-5](`cy.visit("/")`)
@[1-6](`cy.contains("Login").click()`)
@[1-14](There is a cypress equivalent for all remaining commands)
@[2](So, how do we get test data into our Rails application on-the-fly?)

---

[drag=100 25, drop=7 0]

## Cypress on Rails

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)
![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
- **The `cypress-on-rails` gem**
  - Adds a `rack` middleware to send requests to the Rails server
  - Provides conventions on how to run code on the server from within Cypress
- **Own Extensions**
  - Flexible `FactoryBot` integration with association support
  - Scenario-Wrapper to adjust JSON responses
@ul

---

[drag=100 25, drop=7 0]

## `cypress-on-rails`

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
* Adds a helper file that's ran before any cypress command
* Adds the `"/_\_cypress__/command"` endpoint to the application
* This endpoint `eval`s  a requested Ruby file (in the application context) and responds with its return value as JSON
@ul

---

[drag=100 25, drop=7 0]

## `cypress-on-rails`

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=75 65, drop=25 20]

```text
 📂 spec
 |- 📂 cypress
    |- 📃 cypress_helper.rb
    |- 📂 app_commands
       |- 📃 clean.rb
       |- 📃 factory_bot.rb
       |- ...
    |- 📂 integration
       |- 📃 login_spec.js
    |- 📂 fixtures
```

[drag=75 10, drop=25 85]

@[3](Is ran once at server start)
@[4-7]Contains Ruby files to be `eval`'d through the new endpoint)
@[8-10](Normal cypress folder structure)

---

[drag=100 25, drop=7 0]

## Using the `command` endpoint

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 75, drop=25 20](src/app_command.js)

[drag=75 10, drop=25 85]

@[1-9](Basic POST request to the Rails server)
@[11-14](Convenience helper to issue a command)
@[16](`eval`ing `spec/cypress/app_commands/factory_bot.rb`)

---

[drag=100 25, drop=7 0]

## Cleaning between Tests

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[ruby, fit=0.7, drag=75 75, drop=25 25](src/clean.rb)

[drag=75 25, drop=25 75, fit=0.7]

```js
// spec/cypress/support/index.js
beforeEach(function() {
  cy.app("clean");
})
```

---

[drag=100 25, drop=7 0]

## Capybara to Cypress

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=75 65, drop=25 20, fit=0.7]

```ruby
RSpec.describe "Logging in" do
  let!(:user) { FactoryBot.create(:user) }
  ...
end
```

```js
cy.describe("Logging in", function() {
  beforeEach(function() {
    cy.app("factory_bot", ["create", "user"]).as("user");
  })
});
```

[drag=75 10, drop=25 85]

Creating data on-the-fly is now possible!

---

[drag=100 25, drop=7 0]

## FactoryBot Integration v2

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=75 65, drop=25 20, fit=0.7]

```ruby
# /app/models/post.rb
has_many :likes
has_many :liking_users, through: :likes, class_name: "User"

# /spec/feature/liking_spec.rb
RSpec.describe "Liking" do
  let(:user) { create(:user) }
  let(:post) { create(:post, liking_users: [user]) }
  ...
end
```

[drag=75 10, drop=25 85]

@[1-3]
@[5-10](While `post.liking_user_ids=` is available here, this wouldn't work with polymorphic associations. So, again: 🤷‍♀️)

---

[drag=100 25, drop=7 0]

## FactoryBot Integration v2

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

@code[javascript, fit=0.65, drag=75 75, drop=25 20](src/gids.js)

[drag=75 10, drop=25 85]

@[1-4](Everything created by the `factory_bot` app command contains a Global ID)
@[6-12](Every parameter that ends with `_identifier(s)` will be converted to an AR instance)

---

[drag=100 25, drop=7 0]

## Conclusion

[drag=25 100, drop=left]

![](assets/img/cypress-lights-4.png)

[drag=25 100, drop=left, flow=stack, sync=true]

![](assets/img/cypress-lights-w2.png)
![](assets/img/cypress-lights-w3.png)
![](assets/img/cypress-lights-w1.png)

@ul[list-spaced-bullets, drag=75 75, drop=25 25, sync=true]
* On-The-Fly Test data generation ☑️
* Database Cleaning between tests ☑️
* Server-Side stubbing (e.g. Geocoder), etc. ☑️
* Everything I could do with Capybara ☑️
@ul

---

[drag=100, drop=0, bg=assets/img/title.jpg]

## Additional Topics

- AppCommands and AppScenarios (v2)
- Usage in CI (with paralellization)
- How to organize/build spec files
- Something else?

---

[drag=100, drop=0, bg=assets/img/title.jpg]

The demo application can be found at https://github.com/stex/cypress_demo
It contains the same test suite once in Capybara (if possible) and in Cypress

---

[drag=100, drop=0, bg=assets/img/capybara.png]

# Thanks!
