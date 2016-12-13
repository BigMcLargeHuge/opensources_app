class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_text
      t.text :notes
      t.belongs_to :website, index: true, foreign_key: true
      t.belongs_to :submission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
