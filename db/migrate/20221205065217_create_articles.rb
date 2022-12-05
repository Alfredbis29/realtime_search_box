class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
    t.string :text

      t.timestamps
    end
    add_reference :articles, :user, foreign_key: {to_table: :users}
  end
end
