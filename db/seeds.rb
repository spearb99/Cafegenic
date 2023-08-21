# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
 email: ENV['ADMIN_MAIL'],
 password: ENV['ADMIN_PASS']
)

users = User.create!(
  [
    {email: ENV['USER_MAIL1'], name: 'Bini', password: ENV['USER_PASS'], introduction: '甘いもの大好き', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/Bini.jpg"), filename:"Bini.jpg")},
    {email: ENV['USER_MAIL2'], name: 'LeeKnow', password: ENV['USER_PASS'], introduction: 'プリン大好き', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/LeeKnow.jpg"), filename:"LeeKnow.jpg")},
    {email: ENV['USER_MAIL3'], name: 'I.N', password: ENV['USER_PASS'], introduction: '全国回ってます！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/I.N.jpg"), filename:"I.N.jpg")},
    {email: ENV['USER_MAIL4'], name: 'Chris', password: ENV['USER_PASS'], introduction: 'カフェ巡り大好き', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/Chris.jpg"), filename:"Chris.jpg")}
  ]
)

tags = CafeTag.create!(
  [
    {name: '新大久保' },
    {name: 'おしゃれ' },
    {name: '静か' },
    {name: '表参道' },
    {name: '神戸' },
    {name: '和風' },
    {name: '沖縄' },
    {name: '海' }
  ]
)


posts = Post.create!(
  [
    {shop_name: 'ScoopCoffee', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ScoopCoffee.jpg"), filename:"ScoopCoffee.jpg"), text: 'ワッフル美味しい！', address: '東京都新宿区大久保1丁目10-15 2階', user_id: users[0].id },
    {shop_name: 'ROZIcafe', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ROZIcafe.jpg"), filename:"ROZIcafe.jpg"), text: 'ケーキめっちゃ美味しいし静かでよかった', address: '東京都新宿区大久保2丁目32-6', user_id: users[0].id },
    {shop_name: 'Ralphs Coffee', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/RalphsCoffee.jpg"), filename:"RalphsCoffee.jpg"), text: 'クマかわいいしブラウニー美味しかった', address: '東京都渋谷区神宮前4丁目25-15', user_id: users[1].id },
    {shop_name: '浜辺の茶屋', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hamabenoteahouse.jpg"), filename:"hamabenoteahouse.jpg"), text: '海綺麗すぎて癒しのカフェだった', address: '沖縄県南城市玉城2-1', user_id: users[2].id },
    {shop_name: '猪名野茶房', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/inanosabou.jpg"), filename:"inanosabou.jpg"), text: '生わらび餅美味しかった', address: '兵庫県神戸市北区有馬町808 1階',user_id: users[3].id }
  ]
)

PostCafeTag.create!(
 [
  { post_id: posts[0].id, cafe_tag_id: tags[0].id },
  { post_id: posts[0].id, cafe_tag_id: tags[1].id },
  { post_id: posts[1].id, cafe_tag_id: tags[0].id },
  { post_id: posts[1].id, cafe_tag_id: tags[1].id },
  { post_id: posts[1].id, cafe_tag_id: tags[2].id },
  { post_id: posts[2].id, cafe_tag_id: tags[3].id },
  { post_id: posts[2].id, cafe_tag_id: tags[1].id },
  { post_id: posts[3].id, cafe_tag_id: tags[6].id },
  { post_id: posts[3].id, cafe_tag_id: tags[7].id },
  { post_id: posts[4].id, cafe_tag_id: tags[4].id },
  { post_id: posts[4].id, cafe_tag_id: tags[5].id }
 ]
)