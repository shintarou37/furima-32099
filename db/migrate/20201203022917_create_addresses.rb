class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string        :address,           null: false
      t.string        :post,              null: false
      t.string        :town,              null: false
      t.string        :build
      t.string        :phone,             null: false
      t.references    :order,             null: false,foreign_key: true
      t.integer       :prefecture_id,     null: false
      t.timestamps
    end
  end
end
