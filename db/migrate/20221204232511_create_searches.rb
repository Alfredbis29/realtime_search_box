class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :search_term

      t.timestamps
    end
    add_reference :searches, :user, foreign_key: {to_table: :users}
  end
end
