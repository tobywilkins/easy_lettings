require 'spec_helper'

describe Property, type: :model  do
  it 'builds a postcode' do
    expect(Property.generate_google_maps_url("R11GB","1234")).to eq "https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=600x600&key=1234&markers=R11GB"
  end
end
