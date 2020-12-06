[drag=100, drop=0, bg=assets/img/title.jpg]

[drag=20 10, drop=bottomleft, set=text-gray, fit=0.5]
Stefan Exner | [stex.codes](https://stex.codes)

[drag=50 20, drop=bottomright, set=text-white, fit=2]

Cypress on Rails

Note:

- Who worked with cypress before?

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

[drag=50 10, drop=bottomright]

@[1,16]()
@[2-5]()
@[7-15]

Note:

! `cy.type` verhält sich tatsächlich wie ein Nutzer, capybara war nicht in der lage, einfach in das `div` des richtext editors zu tippen

---

## Cypress Functionality

- Fixtures
- Own cy.commands (example: login-helper)
- Chainers
- (stubbing, etc)

## Integration with Rails

- `cypress-on-rails` gem for middleware
  - `__cypress__/command` endpoint
  - Just `eval`s ruby scripts
- cypress command to call this endpoint
- AppCommands and AppScenarios

## Own Extensions

* AppScenario Wrapper (+ Helpers)
* FactoryBot Helper