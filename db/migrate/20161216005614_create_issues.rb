class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :issue_text
      t.string :domain
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :website, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
