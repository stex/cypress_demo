// fixtures/basic_user.json
cy.fixture("basic_user.json").as("user");
cy.fixture("basic_user.json").then(user => {
  cy.log(user);
});

// fixtures/images/beaver.jpg
cy.fixture("images/beaver.jpg").then(beaver =>  {
  // base64 representation of the image
});
cy.fixture("images/beaver.jpg", "binary").then(beaver =>  {
  // binary representation of the image
});
