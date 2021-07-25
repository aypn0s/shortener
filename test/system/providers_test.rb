require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  setup do
    @provider = providers(:one)
  end

  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit providers_url
    click_on "New Provider"

    check "Active" if @provider.active
    fill_in "Api token", with: @provider.api_token
    check "Api token required" if @provider.api_token_required
    check "Default" if @provider.default
    fill_in "Name", with: @provider.name
    fill_in "Shortened links count", with: @provider.shortened_links_count
    click_on "Create Provider"

    assert_text "Provider was successfully created"
    click_on "Back"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first

    check "Active" if @provider.active
    fill_in "Api token", with: @provider.api_token
    check "Api token required" if @provider.api_token_required
    check "Default" if @provider.default
    fill_in "Name", with: @provider.name
    fill_in "Shortened links count", with: @provider.shortened_links_count
    click_on "Update Provider"

    assert_text "Provider was successfully updated"
    click_on "Back"
  end

  test "destroying a Provider" do
    visit providers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provider was successfully destroyed"
  end
end
