beforeEach(function() {
  cy.factory("user").as("author");
  cy.factory("user").as("user");
});

it("creates a post", function() {
  cy.factory('post', [], {
    body: "I am a post!",
    author_identifier: this.author.gid,
    liking_users_identifiers: [this.user.gid]
  }).as('post');
});
