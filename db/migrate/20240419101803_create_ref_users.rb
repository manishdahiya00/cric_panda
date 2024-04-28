class CreateRefUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :ref_users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :mobile_number
      t.string :location
      t.string :source_ip
      t.string :social_token
      t.string :social_imgUrl
      t.text :oauth_response
      t.string :social_type

      t.timestamps
    end
  end
end
