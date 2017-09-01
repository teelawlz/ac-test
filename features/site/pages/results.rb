class ResultsPage < SitePrism::Page

  element :filter_toggle_button, "button.wideSidepaneFilterButton"
  element :apply_filters_button, ".applyButton"

  elements :details_texts, ".HomeStatsLabel"

  elements :bedroom_counts, ".HomeStatsLabel.first .value"
  elements :bathroom_counts, "[class='HomeStatsLabel inline-block'] value"
  elements :sqft, ".HomeStatsLabel.last .value"

  section :filters_menu, FiltersMenu, "#filterContent"
end
