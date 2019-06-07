class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :email_id
      t.string :sender
      t.string :recipient
      t.datetime :date
      t.text :message
      t.string :subject
      t.string :message_id
      t.string :in_reply_to
      t.string :action
      t.string :subsystem
      t.string :subject_original 
    end
  end
end