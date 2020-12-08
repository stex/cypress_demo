cy.fixture('users').then((json) => {
  cy.intercept('GET', '/users/**', json)
})