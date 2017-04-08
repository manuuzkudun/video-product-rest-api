class CreatePurchaseOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_options do |t|
      t.monetize :price
      t.string :video_quality

      t.timestamps
    end
  end
end
