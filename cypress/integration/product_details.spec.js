//  Cypress Product Page handling

describe('Jungle home page', () =>  {
  it("visits the home page first", () => {
    cy.visit('http://localhost:3000/')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Clicking on a product name allows you to navigate to that product's page", () => {
    cy.contains("Scented Blade").click();
  });
})