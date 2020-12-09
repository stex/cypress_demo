Cypress.Commands.add('appCommands', function(body) {
  return cy.request({
    method: 'POST',
    url: "/__cypress__/command",
    body: JSON.stringify(body),
  }).then((response) => {
    return response.body;
  });
});

Cypress.Commands.add('app', function(name, command_options) {
  return cy.appCommands({name: name, options: command_options})
    .then(response => response[0]);
});

cy.app("factory_bot", ["create", "post"]);
