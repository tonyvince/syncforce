require 'rails_helper'

RSpec.describe 'Dealers', type: :system, js: true do
  it 'it shows dealer data on map' do
    visit root_path
    expect(page).to have_text I18n.t('dealers.map')
  end
end
