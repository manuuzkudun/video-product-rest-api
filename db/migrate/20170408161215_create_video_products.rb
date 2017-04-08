class CreateVideoProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :video_products do |t|
      t.string :title
      t.text :plot
      t.string :type

      t.timestamps
    end
  end
end
