class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :domain
      t.string :website_type
      t.text :notes

      t.timestamps null: false
    end
  end
end
