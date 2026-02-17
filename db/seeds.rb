# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Tag.create([
  { name: '重い' },
  { name: '普通' },
  { name: '軽い' },
  { name: '勉強' },
  { name: '就活' },
  { name: '家事' },
  { name: '仕事' },
  { name: '趣味' },
  { name: '運動' },
  { name: '人間関係' },
  { name: '健康' },
  { name: 'クリエイティブ' },
  { name: 'その他' },
])