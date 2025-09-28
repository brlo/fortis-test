# Очищаем существующие данные
Product.destroy_all
Category.destroy_all

# Создаем категории
categories = Category.create!([
  { name: 'Электроника' },
  { name: 'Одежда' },
  { name: 'Книги' }
])

# Создаем продукты
products_data = [
  { name: 'КрабФон 5S', price: 999.99, category: categories[0] },
  { name: 'Квантовый компьютер', price: 1999.99, category: categories[0] },
  { name: 'Футболка', price: 29.99, category: categories[1] },
  { name: 'Джинсы', price: 79.99, category: categories[1] },
  { name: 'Всё о рыболовных снастях', price: 39.99, category: categories[2] },
  { name: 'Как приготовить омаров', price: 49.99, category: categories[2] }
]

products_data.each do |product_data|
  Product.create!(product_data)
end

puts "Создано #{Category.count} категорий и #{Product.count} продуктов"
