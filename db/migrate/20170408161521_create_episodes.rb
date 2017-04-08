class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.references :season, foreign_key: true, index: true
      t.string :title
      t.text :plot
      t.integer :episode_in_season

      t.timestamps
    end
  end
end
