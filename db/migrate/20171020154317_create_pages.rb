class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :slug, null: false
      t.string :h1, null: false
      t.text :content, null: false
      t.datetime :published_at, null: false
      t.integer :priority, null: false

      t.timestamps
    end
  end
end
