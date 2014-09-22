class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.text :body
      t.string :status
    end
  end
end
