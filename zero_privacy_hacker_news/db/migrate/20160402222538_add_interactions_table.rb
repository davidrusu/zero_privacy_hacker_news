class AddInteractionsTable < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.belongs_to :user
      t.integer :hn_item, index: true
    end
  end
end
