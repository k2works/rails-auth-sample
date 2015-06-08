class CreateBelongs < ActiveRecord::Migration
  def change
    create_table :belongs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
