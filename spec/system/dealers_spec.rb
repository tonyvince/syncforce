require 'rails_helper'

RSpec.describe 'Hello', type: :system, js: true do
  it 'it says hello' do
    visit root_path
    expect(page).to have_text('Hello Svelte!')
  end
end
