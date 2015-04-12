json.array!(@customer_orders) do |customer_order|
  json.extract! customer_order, :id, :order_no, :order_date, :customer_name
  json.url customer_order_url(customer_order, format: :json)
end
