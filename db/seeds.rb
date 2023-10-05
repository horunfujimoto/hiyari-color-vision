# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: '0@0',
  password: '000000',
  company_password: '000000'
)

# Member.create!(
#   name: '0さん',
#   email: '0@0',
#   password: '000000',
#   company_password: '000000'
# )

Tag.create([
  { name: '労働安全' },
  { name: '交通安全' },
  { name: '製造業' },
  { name: '医療安全' },
  { name: 'ITセキュリティ' },
  { name: '環境安全' },
  { name: '教育訓練' },
  { name: '安全規定' }
])