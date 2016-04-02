class AddSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :user, index: true
      t.string :session_id, index: true
      t.datetime :expires
    end
  end
end
