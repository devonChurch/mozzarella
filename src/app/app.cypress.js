describe("AppComponent", function() {
  it("should render title", function() {
    cy.visit("/");
    cy.get(".content span").contains("mozzarella app is running!");
  });
});
