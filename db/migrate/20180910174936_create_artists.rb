class CreateArtists < ActiveRecord::Migration
  def change
    add_column :artists do |t|
      t.string :name
    end
  end
end
