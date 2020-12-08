Cypress.Commands.add('tree', () => "🌲");

beforeEach(function() {
  cy.tree().as('myTree');
})

it('logs a tree', function() {
  cy.log(this.myTree);
  cy.tree().then(tree => {
    cy.log(tree);
  })
})