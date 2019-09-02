const WAIT = 10;

describe("AppComponent", function() {
  it("should match previous snapshot", function() {
    cy.visit("/");

    cy.get("app-root").then(() => {
      // Wait a few CPU ticks to ensure that the fonts are rendered correctly.
      cy.wait(WAIT);
      cy.matchImageSnapshot("application-home-page");
    });
  });
});
