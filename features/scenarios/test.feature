Feature: Test Acorns

Scenario: User can log in
	Given a user at the redfin home page
	When  the user logs into their account
	Then  they are logged in

Scenario: User can run a search and filter by bed, bath, and square footage
	Given a user at the redfin home page
	When  the user enters '92626' in the search field
	And   clicks on the first result in the dropdown menu
	And   clicks on the expand filter button
	And   sets a min of 3 beds
	And   sets a max of 4 beds
	And   sets to 2+ bathrooms
	And   sets a 750 square feet minimum
	And   applies filters
	Then  results meet bedroom requirements
	And   results meet bathroom requirements
	And   results meet square footage requirements
