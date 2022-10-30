describe('Login and Logout', function () {
  beforeEach(function () {
    cy.appScenario('basic_account').as('account')
  })

  it('allows me to log in and out', function () {
    cy.visit('/login')

    cy.get('input[name=login]').type(this.account.email)
    cy.get('input[name=password]').type('12345678')
    cy.contains('input', 'Login').click()

    cy.get('#navbarNav').should('contain', 'Logout')

    cy.contains('button', 'Logout').click()

    cy.contains('.nav-link', 'Login')
  })
})
