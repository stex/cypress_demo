describe('Post Creation', function () {
  beforeEach(function () {
    cy.factory('account', ['verified']).as('account1')
    cy.factory('account', ['verified']).as('account2')
    cy.fixture('beaver_post.json').as('post')
  })

  context('when logged out', function () {
    it('does not let me create a post', function () {
      cy.visit('/')
      cy.get('#post_title').should('not.exist')
      cy.get('#post_content').should('not.exist')

      cy.visit('/posts/new')
      cy.get('#post_title').should('not.exist')
      cy.get('#post_content').should('not.exist')
      cy.get('body').should('contain', 'Login')
    })
  })

  context('when logged in', function () {
    it('lets me create a post', function () {
      cy.login(this.account1)
      cy.visit('/')

      cy.get('#post_title').type(this.post.title)
      cy.get('#post_content').type(this.post.content)
      cy.get('#post_content').selectFile(this.post.image, { action: 'drag-drop' })

      cy.contains('Create Post').click()

      cy.get('#post_title').should('be.empty')
      cy.get('#post_content').should('be.empty')

      cy.get('#posts').should('contain', this.post.title).should('contain', this.post.content)
    })
  })
})
