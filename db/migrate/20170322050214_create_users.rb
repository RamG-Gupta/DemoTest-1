class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :dob
      t.string :state
      t.string :country
      t.string :name
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :ouath_expires_at

      t.timestamps
    end
  end
end
