class AddCompleteToTodoos < ActiveRecord::Migration
  def change
  	add_column :todoos, :completed, :boolean
  end
end
