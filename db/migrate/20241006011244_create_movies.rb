class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.text :synopsis
      t.string :country_of_origin
      t.integer :duration

      t.timestamps
    end
  end
end
