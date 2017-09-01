Given /a user at the redfin home page$/ do
  @site = Site.new
  @site.home.load
end

#=============================

When /the user logs into their account$/ do
  @site.home.sign_in_link.click
  @site.home.sign_in_panel.email_sign_in_button.click
  @site.home.sign_in_panel.email_field.set "tltest100@mailinator.com"
  @site.home.sign_in_panel.password_field.set "Ohlookanacorn@123"
  @site.home.sign_in_panel.submit_button.click
end

When /the user enters '(.*)' in the search field$/ do |search_term|
  @site.home.search_field.set search_term
end

When /(?:the user )?clicks on the first result in the dropdown menu$/ do
  @site.home.wait_for_search_results
  @site.home.search_results.first.click
end

When /clicks on the expand filter button$/ do
  @site.results.filter_toggle_button.click
  @filters = {}
end

When /sets a (min|max) of (\d+) beds$/ do |minmax, beds|
  @site.results.filters_menu.send("#{minmax}_beds_button").click
  @site.results.filters_menu.send("#{minmax}_bed_option", :text => beds).native.click
  @filters["#{minmax}Beds"] = beds.to_i
end

When /sets to (\d+)\+ bathrooms$/ do |baths|
  @site.results.filters_menu.baths_button.click
  @site.results.filters_menu.baths_option(:text => "#{baths}+").native.click
  @filters["baths"] = baths.to_i
end

When /sets a (.*) square feet minimum$/ do |min_value|
  @site.results.filters_menu.root_element.click
  @site.results.filters_menu.min_sqft_button.click
  @site.results.filters_menu.min_sqft_option(:text => /\A#{min_value}\z/).native.click
  @filters["minSqft"] = min_value.delete(',').to_i
end

When /applies filters$/ do
  @site.results.apply_filters_button.click
end

#=============================

Then /they are logged in$/ do
  expect(@current_page.user_account_button).to have_text("TLTest")
end

Then /results meet (.*) requirements$/ do |filter|
	case filter
	when "bedroom"
		@site.results.wait_for_details_texts
		br_counts = @site.results.bedroom_counts.map{|v| v.text.to_i}
		expect(br_counts.all? do |c|
			c >= @filters["minBeds"] if @filters["minBeds"]
			c <= @filters["maxBeds"] if @filters["maxBeds"]
		end).to be true

	when "bathroom"
    expect(@site.results.bathroom_counts.map{|v| v.text.to_i}.all? do |c|
      c >= @filters["baths"]
    end).to be true

  when 'square footage'
    expect(@site.results.sqft.map{|v| v.text.delete(',').to_i}.all? do |c|
      c >= @filters["minSqft"]
    end).to be true
  else
    raise "dude!"
	end
end
