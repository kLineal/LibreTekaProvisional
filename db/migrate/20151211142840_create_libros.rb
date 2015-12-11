class CreateLibros < ActiveRecord::Migration
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :autor
      t.string :editorial
      t.string :isbn

      t.timestamps null: false
    end
  end
end
