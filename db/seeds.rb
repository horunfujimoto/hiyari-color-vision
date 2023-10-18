# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

Admin.create!(
  email: '0@0',
  password: '000000',
  company_password: '000000'
)

Member.create!([
  {email: '0@0',password: '000000',name: 'ヒヤリ太郎',company_password: '000000',company_password_confirmation: '000000',industry: 'IT',company: '会社'},
  {email: '1@1',password: '000000',name: 'ヒヤリ一郎',company_password: '000000',company_password_confirmation: '000000',industry: 'メーカー',company: '会社'},
  {email: '2@2',password: '000000',name: 'ヒヤリ二郎',company_password: '000000',company_password_confirmation: '000000',industry: '商社',company: '会社'},
  {email: '3@3',password: '000000',name: 'ヒヤリ三郎',company_password: '000000',company_password_confirmation: '000000',industry: '金融',company: '会社'},
  {email: '4@4',password: '000000',name: 'ヒヤリ四郎',company_password: '000000',company_password_confirmation: '000000',industry: 'サービス',company: '会社'},
  {email: '5@5',password: '000000',name: 'ヒヤリ五郎',company_password: '000000',company_password_confirmation: '000000',industry: '広告',company: '会社'},
  {email: '6@6',password: '000000',name: 'ヒヤリ六郎',company_password: '000000',company_password_confirmation: '000000',industry: '福祉',company: '会社'},
  {email: '7@7',password: '000000',name: 'ヒヤリ七郎',company_password: '000000',company_password_confirmation: '000000',industry: '医療',company: '会社'},
  {email: '8@8',password: '000000',name: 'ヒヤリ八郎',company_password: '000000',company_password_confirmation: '000000',industry: '公社',company: '会社'},
  {email: '9@9',password: '000000',name: 'ヒヤリ九郎',company_password: '000000',company_password_confirmation: '000000',industry: '小売',company: '会社'}
])

Tag.create!([
  { name: '労働安全' },
  { name: '交通安全' },
  { name: '食品安全' },
  { name: '製造業' },
  { name: '医療安全' },
  { name: 'ITセキュリティ' },
  { name: 'データ漏洩' },
  { name: '環境安全' },
  { name: '教育訓練' },
  { name: '安全規定' }
])

Post.create!([
  { member_id: 1, tag_id: 1, title: "労働安全(全体公開)", body: "工場内で転倒事故発生。床が滑りやすかった。", place: "場所", level_status: "mild", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 2, tag_id: 2, title: "交通安全(全体公開)", body: "駐車場で接触事故。表示が不足していた。", place: "場所", level_status: "moderate", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 3, tag_id: 3, title: "食品安全(全体公開)", body: "賞味期限切れの商品販売。消費者に注意された。", place: "場所", level_status: "moderate", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 4, tag_id: 4, title: "製造業(全体公開)", body: "生産ラインで機械の故障。生産停止につながった。", place: "場所", level_status: "severe", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 5, tag_id: 5, title: "医療安全(全体公開)", body: "医療記録の紛失。患者情報の機密性が危険にさらされた。", place: "場所", level_status: "severe", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 6, tag_id: 6, title: "ITセキュリティ(全体公開)", body: "フィッシング攻撃により社内情報流出。機密情報が漏洩。", place: "場所", level_status: "severe", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 7, tag_id: 7, title: "データ漏洩(全体公開)", body: "従業員が誤って機密データを誤送信。データ漏洩が発生。", place: "場所", level_status: "severe", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 8, tag_id: 8, title: "環境安全(全体公開)", body: "化学物質の誤った廃棄。地元環境への悪影響が懸念された。", place: "場所", level_status: "moderate", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 9, tag_id: 9, title: "教育訓練(全体公開)", body: "社内トレーニングの効果が不足。知識不足の問題が残っている。", place: "場所", level_status: "mild", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 10, tag_id: 10, title: "安全規定(全体公開)", body: "緊急避難プロセスが不明瞭。従業員が混乱した。", place: "場所", level_status: "mild", open_status: "full_disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },

  { member_id: 1, tag_id: 1, title: "労働安全(社内公開)", body: "工場内で転倒事故発生。床が滑りやすかった。", place: "場所", level_status: "mild", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 2, tag_id: 2, title: "交通安全(社内公開)", body: "駐車場で接触事故。表示が不足していた。", place: "場所", level_status: "moderate", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 3, tag_id: 3, title: "食品安全(社内公開)", body: "賞味期限切れの商品販売。消費者に注意された。", place: "場所", level_status: "moderate", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 4, tag_id: 4, title: "製造業(社内公開)", body: "生産ラインで機械の故障。生産停止につながった。", place: "場所", level_status: "severe", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 5, tag_id: 5, title: "医療安全(社内公開)", body: "医療記録の紛失。患者情報の機密性が危険にさらされた。", place: "場所", level_status: "severe", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 6, tag_id: 6, title: "ITセキュリティ(社内公開)", body: "フィッシング攻撃により社内情報流出。機密情報が漏洩。", place: "場所", level_status: "severe", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 7, tag_id: 7, title: "データ漏洩(社内公開)", body: "従業員が誤って機密データを誤送信。データ漏洩が発生。", place: "場所", level_status: "severe", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 8, tag_id: 8, title: "環境安全(社内公開)", body: "化学物質の誤った廃棄。地元環境への悪影響が懸念された。", place: "場所", level_status: "moderate", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 9, tag_id: 9, title: "教育訓練(社内公開)", body: "社内トレーニングの効果が不足。知識不足の問題が残っている。", place: "場所", level_status: "mild", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 10, tag_id: 10, title: "安全規定(社内公開)", body: "緊急避難プロセスが不明瞭。従業員が混乱した。", place: "場所", level_status: "mild", open_status: "disclosure", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },

  { member_id: 1, tag_id: 1, title: "労働安全(非公開)", body: "工場内で転倒事故発生。床が滑りやすかった。", place: "場所", level_status: "mild", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 2, tag_id: 2, title: "交通安全(非公開)", body: "駐車場で接触事故。表示が不足していた。", place: "場所", level_status: "moderate", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 3, tag_id: 3, title: "食品安全(非公開)", body: "賞味期限切れの商品販売。消費者に注意された。", place: "場所", level_status: "moderate", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 4, tag_id: 4, title: "製造業(非公開)", body: "生産ラインで機械の故障。生産停止につながった。", place: "場所", level_status: "severe", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 5, tag_id: 5, title: "医療安全(非公開)", body: "医療記録の紛失。患者情報の機密性が危険にさらされた。", place: "場所", level_status: "severe", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 6, tag_id: 6, title: "ITセキュリティ(非公開)", body: "フィッシング攻撃により社内情報流出。機密情報が漏洩。", place: "場所", level_status: "severe", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 7, tag_id: 7, title: "データ漏洩(非公開)", body: "従業員が誤って機密データを誤送信。データ漏洩が発生。", place: "場所", level_status: "severe", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 8, tag_id: 8, title: "環境安全(非公開)", body: "化学物質の誤った廃棄。地元環境への悪影響が懸念された。", place: "場所", level_status: "moderate", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 9, tag_id: 9, title: "教育訓練(非公開)", body: "社内トレーニングの効果が不足。知識不足の問題が残っている。", place: "場所", level_status: "mild", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") },
  { member_id: 10, tag_id: 10, title: "安全規定(非公開)", body: "緊急避難プロセスが不明瞭。従業員が混乱した。", place: "場所", level_status: "mild", open_status: "unopened", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg") }
])

Vision.create!([
  { member_id: 1, post_id: 1, improvement: "床に滑り止めマットを敷く。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 2, post_id: 2, improvement: "駐車場に追加の交通標識を設置する。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 3, post_id: 3, improvement: "商品の賞味期限を厳密に管理し、期限切れ品を撤去する。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 4, post_id: 4, improvement: "定期的なメンテナンススケジュールを導入し、機械の故障を予防する。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 5, post_id: 5, improvement: "電子健康記録システムを導入して、データのセキュリティを向上させる。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 6, post_id: 6, improvement: "従業員にセキュリティトレーニングを提供し、セキュリティ意識を高める。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 7, post_id: 7, improvement: "データ送信前に二重確認プロセスを導入し、誤送信を防ぐ。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 8, post_id: 8, improvement: "廃棄物管理プロセスを見直し、環境への影響を最小限に抑える。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 9, post_id: 9, improvement: "カスタマイズされたトレーニングプログラムを開発し、スキル向上を促進する。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" },
  { member_id: 10, post_id: 10, improvement: "緊急避難手順を改善し、全従業員にトレーニングを提供する。", closing_day: "2024-01-11 00:00:00", double_check: "Aさん" }
])

# 9.times do |n|
#   Comment.create!(
#     member_id: n+1,
#     post_id: n+1,
#     comment: "コメント"
#   )
# end