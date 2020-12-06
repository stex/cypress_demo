describe('Likes', function() {
    beforeEach(function() {
        cy.appScenario('basic_user').as('user');
        cy.factory('user').as('author');
    })

    context('when I already liked a post', function() {
        beforeEach(function() {
            cy.factory('post', [], { author_identifier: this.author.gid, liking_users_identifiers: [this.user.gid] }).as('post');
            cy.login(this.user);
        })

        it('shows a heart icon on the post', function() {
            cy.get(`#post_${this.post.id}`).get('a[title="Remove Like"]').should('exist');
        });

        it('lets me remove the like', function() {
            cy.get("a[title='Remove Like']").click();
            cy.get(`#post_${this.post.id}`).get("a[title='Like Post']").should('exist');
        })
    })
})
