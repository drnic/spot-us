Then /^I should see a tag of "(.*)" with "(.*)"$/ do |tag, text|
  response.should have_tag(tag, /#{text}/i)
end

Then /^I should see an? "(.*)" link$/ do |text|
  response.should(have_tag("a", /#{text}/i))
end

Then /^I should see an? "(.*)" titled link$/ do |text|
  response.should have_tag("a[title=?]", text)
end

Then /^I should not see an? "(.*)" titled link$/ do |text|
  response.should_not have_tag("a[title=?]", text)
end

Then /^I should see a Show\/Hide handle$/ do
  response.should have_tag("a[class*=?]", "open-close")
end


Then /^I should see an? "(.*)" action$/ do |text|
  response.should have_tag("a[class*=?]", /#{text.parameterize.wrapped_string}/)
end

Then /^I should not see an? "(.*)" link$/ do |text|
  response.should_not have_tag("a", text)
end

Then /^I should see an? "(.*)" link to "(.*)"$/ do |text, href|
  response.should have_tag("a[href=?]", href, text)
end

Then /^I should not see an? "(.*)" link to "(.*)"$/ do |text, href|
  response.should_not have_tag("a[href=?]", href, text)
end

Then /^I should see "(.*)" inside a text field$/ do |text|
  current_dom.should have_tag('input[type=text][value=?]', text)
end

Then /^I should see an? "(.*)" text field$/ do |field_name|
  response.should have_tag('input[type=text][name*=?]', /#{field_name}/i)
end

Then /^I should see an? "(.*)" check box$/ do |field_name|
  response.should have_tag('input[type=checkbox][name*=?]', /#{field_name}/i)
end

Then /^I should see a "(.*)" dropdown$/ do |text|
  response.should have_tag("select option", text)
end

Then /^I should not see a "(.*)" dropdown$/ do |text|
  response.should_not have_tag("select option", text)
end

Then /^the "(.*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end

When /^I visit the ([\w -]+?) ?page$/ do |name|
  visit(human_route(name))
end

When /^I view the current ([\w -]+?) ?page$/ do |name|
  visit(human_route_for_current(name))
end

# Then /^I should be on the (.*?) page$/ do |path|
#   action, controller = path.split(/\s/)
#   controller.gsub!('::', '/')
#   response.should render_template("#{controller.pluralize}/#{action}")
# end
# 
# Given /^I am on the (.*)$/ do |fragment|
#   When "I visit the #{fragment}"
# end
# 
When /^I save the form$/ do
  When 'I press "Submit"'
end

Given /^I am at the new blog post page for my pitch$/ do
  visit(new_pitch_post_path(@pitch))
end
