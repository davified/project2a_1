class CreateStatics < ActiveRecord::Migration[5.0]
  def change
    create_table :statics do |t|
      t.string :home
      t.string :faq
      t.string :contact

      t.timestamps
    end
  end
end
