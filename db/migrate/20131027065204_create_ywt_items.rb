class CreateYwtItems < ActiveRecord::Migration
  def change
    create_table :ywt_items do |t|
      t.string :item_type
      t.text :body
      t.references :page, index: true

      t.timestamps
    end
  end
end
