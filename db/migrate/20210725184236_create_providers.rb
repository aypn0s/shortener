class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.boolean :active, default: false
      t.string :api_token
      t.boolean :api_token_required, default: false
      t.boolean :default, default: false
      t.integer :shortened_links_count, default: 0

      t.timestamps
    end
  end
end
