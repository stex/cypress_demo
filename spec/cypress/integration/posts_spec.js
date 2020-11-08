describe("Post Creation", function() {
    beforeEach(function() {
        cy.appScenario('basic_user').then(user => {
            cy.login(user);
        });
    })

    it('works with rich text', function() {
        cy.get("h1 a[title='Add Post']").click()

        cy.get('#post_title').type('The Happy Beaver Society');
        cy.get('#post_body').type('Happy Beavers everywhere - ');
        cy.get('button[title=Bold]').click();
        cy.get('#post_body').type('Look out!');
        cy.get('#post_body').attachFile('images/beaver_happy.png', { subjectType: 'drag-n-drop' });

        // Necessary for the upload to happen...
        cy.wait(2000);

        cy.get("input[type=submit]").click();

        cy.contains('.card-header', 'The Happy Beaver Society').should('exist')
    })
})
