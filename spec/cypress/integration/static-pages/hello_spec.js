import Color from "color";

let teal = Color("#2c7a7b")
  .rgb()
  .string();

describe("Hello page loads with tailwind styles", function() {
  beforeEach(() => {
    cy.app("clean"); // have a look at cypress/app_commands/clean.rb
  });

  it("loading all fixtures", function() {
    cy.visit("/pages/hello");
    cy.contains("button", "Hello").should($button => {
      expect($button).to.have.css("color", teal); // test that tailwind styles got compiled
    });
  });
});
