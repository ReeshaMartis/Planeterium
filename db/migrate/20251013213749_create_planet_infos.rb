class CreatePlanetInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :planet_infos do |t|
      t.text :information
      t.references :planets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
