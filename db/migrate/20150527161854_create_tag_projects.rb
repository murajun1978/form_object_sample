class CreateTagProjects < ActiveRecord::Migration
  def change
    create_table :tag_projects do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
