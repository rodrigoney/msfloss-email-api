class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :email_id
      t.string :sender
      t.string :recipient
      t.datetime :date
      t.text :message
    end
  end
end