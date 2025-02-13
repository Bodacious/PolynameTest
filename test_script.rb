new_subscription = Subscriptions::Subscription.create!

begin
  Payment.create! payable: new_subscription
rescue NameError => error
  puts "Couldn't create a Payment: #{error.message}"
end
begin
  Payment.create! payable_type: 'Subscription', payable_id: new_subscription.id
rescue NameError => error
  puts "Couldn't create a Payment: #{error.message}"
end

begin
  ApplicationRecord.connection.execute <<-SQL
  INSERT INTO payments (payable_id, payable_type, created_at, updated_at) values (#{new_subscription.id}, 'Subscription', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
  SQL
  payment = Payment.find(1)
  puts payment.reload.payable
rescue NameError => error
  puts "Couldn't create a Payment: #{error.message}"
end
