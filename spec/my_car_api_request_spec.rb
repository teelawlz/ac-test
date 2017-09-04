require 'spec_helper'

describe 'Edmunds Vehicle API Test with Faraday' do

	context 'Requesting info on my car' do
		before(:all) {@resp = get_info_by_make_model_year(MyCar::MAKE, MyCar::MODEL, MyCar::YEAR)}

		it 'returns the correct response code' do
			expect(@resp.status).to eq(200)
		end

		it 'gathers accurate data on styles of my car' do
			expect(get_style_names_from parse_json @resp.body).to eq(MyCar.styles)
		end

		it 'matches the make, model, and year of the first style option' do
			expect(fetch_make_model_year(parse_json @resp.body)).to eq(
				[MyCar::MAKE, MyCar::MODEL, MyCar::YEAR]
			)
		end
	end
end
