class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :plot

      t.timestamps null: false
    end

    add_column :users, :age, :integer
    add_column :users, :plan, :string
    add_column :users, :currently_rented, :integer
  end
end
