# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tags = [
  '重い',
  '普通',
  '軽い',
  '勉強',
  '仕事',
  '就活',
  '家事',
  '趣味',
  '運動',
  '人間関係',
  '健康',
  'クリエイティブ',
  'その他'
]

tags.each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end
