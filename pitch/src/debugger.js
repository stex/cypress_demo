it('lets me debug like a fiend', () => {
  cy.visit('/my/page/path')
  cy.get('.selector-in-question')

  debugger
});

it('lets me debug after the command executes', () => {
  cy.visit('/my/page/path')

  cy.get('.selector-in-question')
    .then(($selectedElement) => {
      debugger
    })
})