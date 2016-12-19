class AddTagToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :tag_text, :string
  end
end
