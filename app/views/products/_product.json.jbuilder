json.extract! product, :id, :name, :pcolor, :country_of_origin_id, :pdate, :active_status, :sort_order, :created_at, :updated_at
json.url product_url(product, format: :json)
