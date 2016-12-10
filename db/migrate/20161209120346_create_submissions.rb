class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :domain
      t.string :type1
      t.string :type2
      t.string :type3
      t.string :website_type
      t.belongs_to :user, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
