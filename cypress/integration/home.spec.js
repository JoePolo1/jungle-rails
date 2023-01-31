//  Cypress Home Page handling

describe('Jungle home page', () =>  {
  it("visits the home page on load", () => {
    cy.visit('http://localhost:3000/')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})