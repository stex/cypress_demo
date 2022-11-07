describe('Editing Posts', function () {
  beforeEach(function () {
    // Create an account, a post by said account
    // and log the account in
    cy.factory('account', ['verified']).as('account1').then(account => {
      cy.factory('post', [], {account_identifier: account.gid}).as('account1Post')
      cy.login(account)
    })
    // Create a second account with a post so we can test
    // that we are not allowed to edit another user's content
    cy.factory('account', ['verified']).as('account2').then(account => {
      cy.factory('post', [], {account_identifier: account.gid}).as('account2Post')
    })

    cy.visit('/')
  })

  context('when a post belongs to me', function () {
    it('lets me edit it', function () {
      cy.get(`#post_${this.account1Post.id}`).contains('Edit').click()

      cy.get(`#edit_post_${this.account1Post.id}`).then(post => {
        cy.wrap(post).find('input[type=text]').clear().type('The Beavers!')
        cy.wrap(post).find('trix-editor').clear().type('They are coming! Wait for it!')
        cy.wrap(post).contains('Update Post').click()
      })

      cy.get(`#post_${this.account1Post.id}`).should('contain', 'The Beavers!')
    })
  })

  context('when a post does not belong to me', function () {
    it('does not let me edit it', function () {
      cy.get(`#post_${this.account2Post.id}`).should('not.contain', 'Edit')
    })
  })
})
