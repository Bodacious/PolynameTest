class CreateSubscriptionsSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions_subscriptions do |t|
      t.timestamps
    end
  end
end
