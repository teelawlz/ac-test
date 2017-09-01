class FiltersMenu < SitePrism::Section
  element :min_beds_button, ".minBeds"
  element :min_bed_option, ".minBeds .flyout .option"

  element :max_beds_button, ".maxBeds"
  element :max_bed_option, ".maxBeds .flyout .option"

  element :baths_button, ".baths"
  element :baths_option, ".baths .flyout .option"

  element :min_sqft_button, ".sqftMin"
  element :min_sqft_option, ".sqftMin .flyout .option"

  elements :property_types, ".propertyTypeButton"
end
