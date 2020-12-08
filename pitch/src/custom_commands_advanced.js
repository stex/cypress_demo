Cypress.Commands.add('insertImage', { 
  prevSubject: 'element' 
}, (subject, imageData) => {
  let myImage = new Image();
  myImage.src = imageData;
  subject.drawImage(myImage, 0, 0);
});

cy.fixture("images/beaver.jpg").then(beaver => {
  cy.get('#myCanvas').insertImage(beaver)
  cy.wrap([]).fillWithMarkdown(beaver);
})