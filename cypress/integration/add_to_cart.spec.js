//  Cypress Home Page Cart Incrementer handling

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

  it("The cart should have zero items in it before adding an item", () =>  {
    cy.get('.end-0 > .nav-link').contains("My Cart (0)");
  })

  it("Allows you to click on an in-stock item's *Add* button", () =>  {
    cy.viewport(1024, 768)
    cy.get('.button_to > .btn').click();
  })

  it("The cart should now have one item in it", () =>  {
    cy.get('.end-0 > .nav-link').contains("My Cart (1)");
  })
})