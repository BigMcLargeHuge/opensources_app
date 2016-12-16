class AddNotesToWebssite < ActiveRecord::Migration
  def change
    add_column :websites, :notes, :text
  end
end
