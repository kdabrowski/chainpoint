class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.timestamp :badge_issue_date
      t.uuid :uuid
      t.string :recipient_name
      t.string :return_hash
      t.string :hash_id_node

      t.timestamps
    end
  end
end
