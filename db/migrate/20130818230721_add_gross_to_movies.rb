class AddGrossToMovies < ActiveRecord::Migration
  def change    
    add_column :movies, :gross, :integer
  end
end
