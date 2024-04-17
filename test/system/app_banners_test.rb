require "application_system_test_case"

class AppBannersTest < ApplicationSystemTestCase
  setup do
    @app_banner = app_banners(:one)
  end

  test "visiting the index" do
    visit app_banners_url
    assert_selector "h1", text: "App banners"
  end

  test "should create app banner" do
    visit app_banners_url
    click_on "New app banner"

    fill_in "Image url", with: @app_banner.image_url
    fill_in "Redirect url", with: @app_banner.redirect_url
    check "Status" if @app_banner.status
    click_on "Create App banner"

    assert_text "App banner was successfully created"
    click_on "Back"
  end

  test "should update App banner" do
    visit app_banner_url(@app_banner)
    click_on "Edit this app banner", match: :first

    fill_in "Image url", with: @app_banner.image_url
    fill_in "Redirect url", with: @app_banner.redirect_url
    check "Status" if @app_banner.status
    click_on "Update App banner"

    assert_text "App banner was successfully updated"
    click_on "Back"
  end

  test "should destroy App banner" do
    visit app_banner_url(@app_banner)
    click_on "Destroy this app banner", match: :first

    assert_text "App banner was successfully destroyed"
  end
end
