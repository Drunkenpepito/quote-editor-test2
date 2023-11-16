class CreateTrucs < ActiveRecord::Migration[7.1]
  def change
    create_table :trucs do |t|
      t.string :name

      t.timestamps
    end
  end
end
