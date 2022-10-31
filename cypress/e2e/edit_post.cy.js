describe('Editing Posts', function () {
  beforeEach(function () {
    cy.factory('account', ['verified']).as('account1').then(account => {
      cy.factory('post', [], {account_identifier: account.gid}).as('account1Post')
      cy.login(account)
    })
    cy.factory('account', ['verified']).as('account2').then(account => {
      cy.factory('post', [], {account_identifier: account.gid}).as('account2Post')
    })

    cy.visit('/')
  })

  context('when a post belongs to me', function () {
    it('lets me edit it', function () {
      cy.get(`#post_${this.account1Post.id}`).contains('Edit').click()

      cy.get(`#edit_post_${this.account1Post.id}`).find('input[type=text]').clear().type('The Beavers!')
      cy.get(`#edit_post_${this.account1Post.id}`).find('trix-editor').clear().type('They are coming! Wait for it!')
      cy.get(`#edit_post_${this.account1Post.id}`).contains('Update Post').click()

      cy.get(`#post_${this.account1Post.id}`).should('contain', 'The Beavers!')
    })
  })

  context('when a post does not belong to me', function () {
    it('does not let me edit it', function () {
      cy.get(`#post_${this.account2Post.id}`).should('not.contain', 'Edit')
    })
  })
})
