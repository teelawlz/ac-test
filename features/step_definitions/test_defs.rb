##########
# Givens #
##########

Given /a user at '(.*)'/ do |url|
	page.driver.visit url
end


##########
# Whens #
##########

When /the user logs in$/ do
	find("a[data-rf-test-name='SignInLink']").click
	find('.emailSignInButtonWrapper .signInText').click
	fill_in('emailInput', :with => 'tltest100@mailinator.com')
	fill_in('passwordInput', :with => 'Ohlookanacorn@123')
	find("button.submitButton").click
end

When /the user searches for a home in zip code '(.*)'$/ do |zip|
	page.find('.home-hero-inner .search-input-box').send_keys(zip)
end

When /selects the top result$/ do
	sleep 2 #lazy I know!
	page.find_all('div.ExpandedResults a')[0].click
end

When /clicks on the filter button$/ do
	page.find('button.wideSidepaneFilterButton').click
	@filters = {}
end

When /sets to a (min|max) of (\d+) beds$/ do |minmax, beds|
	find(".#{minmax}Beds").click
	find(".#{minmax}Beds .flyout .option", :text => beds).native.click
	@filters["#{minmax}Beds"] = beds.to_i
end

When /chooses (\d*)\+ bathrooms$/ do |baths|
	find(".baths").click
	find(".baths .flyout .option", :text => "#{baths}+").native.click
	@filters["baths"] = baths.to_i
end

When /sets a min of (.*) square feet$/ do |sqft|
	find(".sqftMin").click
	find(".sqftMin .flyout .option", :text => sqft).native.click
	@filters['sqftMin'] = sqft.delete(',').to_i
end

When /filters to (.*) property type$/ do |property|
	find("#propertyTypeFilter span", :text => property).click
	@filters["property_type"] = property
end

When /applies the filters$/ do
	find(".applyButton").native.click
end


##########
# Thens #
##########

Then /the user should appear logged in/ do
	expect(page.find('#userMenu').text).to include('TLTest')
end

Then /all results meet (.*) requirements$/ do |filter|
	case filter
	when "bedroom"
		sleep 1 #Unfamiliarity with page is kind of driving me to these hacks. Sorry =\
		br_counts = find_all(".HomeStatsLabel.first .value").map{|v| v.text.to_i}

		expect(br_counts.all? do |c|
			c >= @filters["minBeds"] if @filters["minBeds"]
			c <= @filters["maxBeds"] if @filters["maxBeds"]
		end).to be_truthy

	when "bathroom"
		br_counts = find_all(".HomeStatsLabel .label").select{|e| e.text=="Baths"}.map do |e|
			#No good target outside of xpath to parent element it seems
			e.find(:xpath, "./../div[contains(@class, 'value')]").text.to_i
		end

		expect(br_counts.all? do |c|
			c >= @filters["baths"]
		end).to be_truthy

	end
end
