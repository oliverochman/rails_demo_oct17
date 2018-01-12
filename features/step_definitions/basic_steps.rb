Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Given("the following articles exists") do |table|
  table.hashes.each do |article|
  binding.pry
  FactoryBot.create(:article, article)
  end
end

When("I click {string} link") do |new_article|
  click_link new_article
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click {string} button") do |create_article|
  click_button create_article
end

Then("I should be on {string} page") do |article_title|
  article = Article.find_by(title: article_title)
  expect(page.current_path).to eq "/articles/#{article.id}"
end

Given("I am on the show page for article {string}") do |article_title|
  article = Article.find_by(title: article_title)
  visit article_path(article)
end

Then("I should be on the show page for article {string}") do |article_title|
  article = Article.find_by(title: article_title)
  expect(page.current_path).to eq "/articles/#{article.id}"
end

Given("show me the page") do
  save_and_open_page
end

When("I am on the landing page") do
  visit '/'
end
