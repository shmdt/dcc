Given('I am on the {string}') do |string|
  visit string
end

When('fill in search with {string}') do |string|
  fill_in 'q', with: "#{string}\n"
end

Then('I should see {string}') do |string|
  expect(page).to have_text(string)
end
