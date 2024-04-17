class CreateAppBanners < ActiveRecord::Migration[7.1]
  def change
    create_table :app_banners do |t|
      t.text :image_url
      t.text :redirect_url
      t.boolean :status,default: false

      t.timestamps
    end
  end
end
