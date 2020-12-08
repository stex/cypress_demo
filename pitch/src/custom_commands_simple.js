Cypress.Commands.add('login', user => {
  cy.visit("/")
  cy.get('nav').contains('a', 'Login').click();
  cy.get('input[name=email]').type(user.email);
  cy.get('input[name=password]').type('12345678');
  cy.contains('input', 'Login').click();
});

Cypress.Commands.overwrite('visit', (originalFn, url) => {
  return originalFn(
    "https://custom_host.com?original_url=" + url
  );
});