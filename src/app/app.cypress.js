describe("My First Test", function() {
  it("Does not do much!", function() {
    cy.visit("http://localhost:4200/");
    cy.get("h2").contains("🌽");
  });
});
