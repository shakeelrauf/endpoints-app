class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.integer :code
      t.text :headers
      t.string :body
      t.references :endpoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
