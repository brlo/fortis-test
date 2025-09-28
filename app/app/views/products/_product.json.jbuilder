json.extract! product, :id, :name, :price, :category_id, :created_at, :updated_at
json.location product_url(product, format: :html)
