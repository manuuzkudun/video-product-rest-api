class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true, index: true
      t.references :video_product, foreign_key: true, index: true
      t.references :purchase_option, foreign_key: true, index: true
      t.datetime :expiration

      t.timestamps
    end
  end
end
