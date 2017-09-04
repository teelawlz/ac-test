require 'my_car'

module EdmundsTestHelpers
  def parse_json(response_body)
    JSON.load(response_body)
  end

  def get_info_by_make_model_year(make, model, year)
    CONN.get "#{make}/#{model}/#{year}",
             {:fmt => 'json', :api_key => API_KEY}
  end

  def get_style_names_from(json_response)
    json_response['styles'].map{|style| style['name']}
  end

###############


# Another consideration: Fetch a style to verify make, model, and year match
# The initial request's data. I just badly wanted to avoid double calls due
# to CPD limits by Edmunds.
  def get_style_by_id(style_id)
    CONN.get "styles/#{style_id}",
             {:fmt => 'json', :api_key => API_KEY}
  end

  # Making an unsafe assumption all listed styles provide the same info,
  # but request limits kind of prevent thoroughness for this assignment.
  def get_first_style_id_from(json_response)
    json_response['styles'][0]['id'].to_s
  end

  def get_make_model_year_from_style_response(json_response)
    [
      json_response['make']['niceName'],
      json_response['model']['niceName'],
      json_response['year']['year'].to_s
    ]
  end

  def fetch_make_model_year(json_response)
    first_style_id = get_first_style_id_from(json_response)
    get_make_model_year_from_style_response(
      parse_json get_style_by_id(first_style_id).body
    )
  end
end
