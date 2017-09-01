class HomePage < SitePrism::Page
  set_url 'http://www.redfin.com/'

  element :sign_in_link, "a[data-rf-test-name='SignInLink']"
  element :user_account_button, "#userMenu"
  element :search_field, ".home-hero-inner .search-input-box"
  element :search_menu, ".ExpandedResults"

  elements :search_results, ".item-row.clickable"

  section :sign_in_panel, SignIn, ".guts"
end
