class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 0, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE users
          ADD CONSTRAINT positive_balance
          CHECK (balance >= 0)
        SQL
      end
    end
  end
end
