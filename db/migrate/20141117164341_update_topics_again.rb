class UpdateTopicsAgain < ActiveRecord::Migration
  def change
    remove_column :topics, :pubic
    add_column :topics, :public, :boolean, default: true
  end
end
