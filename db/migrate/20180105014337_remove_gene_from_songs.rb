class RemoveGeneFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :gene, :string
  end
end
