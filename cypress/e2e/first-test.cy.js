describe('template spec', () => {

  beforeEach(() => {
    cy.resetRailsDatabase();
  });

  it('passes', () => {
    cy.visit('localhost:3000/transeasy');
    cy.get('li').should('have.length', 2);
  })
})