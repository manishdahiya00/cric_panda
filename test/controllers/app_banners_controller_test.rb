require "test_helper"

class AppBannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_banner = app_banners(:one)
  end

  test "should get index" do
    get app_banners_url
    assert_response :success
  end

  test "should get new" do
    get new_app_banner_url
    assert_response :success
  end

  test "should create app_banner" do
    assert_difference("AppBanner.count") do
      post app_banners_url, params: { app_banner: { image_url: @app_banner.image_url, redirect_url: @app_banner.redirect_url, status: @app_banner.status } }
    end

    assert_redirected_to app_banner_url(AppBanner.last)
  end

  test "should show app_banner" do
    get app_banner_url(@app_banner)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_banner_url(@app_banner)
    assert_response :success
  end

  test "should update app_banner" do
    patch app_banner_url(@app_banner), params: { app_banner: { image_url: @app_banner.image_url, redirect_url: @app_banner.redirect_url, status: @app_banner.status } }
    assert_redirected_to app_banner_url(@app_banner)
  end

  test "should destroy app_banner" do
    assert_difference("AppBanner.count", -1) do
      delete app_banner_url(@app_banner)
    end

    assert_redirected_to app_banners_url
  end
end
