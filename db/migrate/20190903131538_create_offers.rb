class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :price
      t.references :bar, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
