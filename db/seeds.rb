# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { name: '重い', tag_type: 'mood' },
  { name: '普通', tag_type: 'mood' },
  { name: '軽い', tag_type: 'mood' },
  { name: '勉強', tag_type: 'category' },
  { name: '仕事', tag_type: 'category' },
  { name: '就活', tag_type: 'category' },
  { name: '家事', tag_type: 'category' },
  { name: '趣味', tag_type: 'category' },
  { name: '運動', tag_type: 'category' },
  { name: '人間関係', tag_type: 'category' },
  { name: '健康', tag_type: 'category' },
  { name: 'クリエイティブ', tag_type: 'category' },
  { name: 'その他', tag_type: 'category' }
].each do |tag|
  record = Tag.find_or_initialize_by(name: tag[:name])
  record.update!(tag_type: tag[:tag_type])
end

Tag.select(:name).distinct.each do |tag|
  Tag.where(name: tag.name).offset(1).destroy_all
end