class CreateQueryStores < ActiveRecord::Migration[6.0]
  def change
    create_table :query_stores do |t|
      t.string :query_string
      t.datetime :run_at

      t.timestamps
    end
  end
end
