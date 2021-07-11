class SetDefaultValueToNoOfClick < ActiveRecord::Migration[5.2]
  def change
    change_column :urls, :no_of_click, :integer, :default => 0 
  end
end
