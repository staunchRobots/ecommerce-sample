class AddSearchIndexToProducts < ActiveRecord::Migration
  def up
    execute "create index products_name on products using gin(to_tsvector('english', name))"
    execute "create index products_description on products using gin(to_tsvector('english', description))"
  end

  def down
    execute "drop index products_name"
    execute "drop index products_content"
  end
end
