describe("Actioncable Ping channel", function() {
  beforeEach(() => {
    cy.app("clean"); // have a look at cypress/app_commands/clean.rb
    cy.visit("/pages/hello");
  });

  it("performs actioncable roundtrip when clicking hello", function() {
    cy.get('[data-target="hello.output"]')
      .contains("subscribed")
      .get("button")
      .contains("Hello")
      .click()
      .get('[data-target="hello.output"]')
      .contains("ACK: clicked hello");
  });
});
