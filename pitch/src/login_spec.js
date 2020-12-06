describe('Login', function() {
    beforeEach(function() {
        cy.fixture("basic_user.json").as("user")
        cy.visit("/")
    });

    it('logs me in', function() {
        cy.get('nav').contains('a', 'Login').click();

        cy.get('input[name=email]').type(this.user.email);
        cy.get('input[name=password]').type('12345678');
        cy.contains('input', 'Login').click();

        cy.get('nav').should('contain', this.user.email);
    })
})
