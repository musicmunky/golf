class AddWebsiteToCourse < ActiveRecord::Migration
  def change
	  add_column :courses, :website, :string
  end
end
