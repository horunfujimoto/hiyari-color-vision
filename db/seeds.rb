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
  { name: '製造業' },
  { name: '医療安全' },
  { name: 'ITセキュリティ' },
  { name: '環境安全' },
  { name: '教育訓練' },
  { name: '安全規定' }
])

# Post.create!([
#   { member_id: 1, tag_id: 1, title: "タイトル(全体公開)", body: "開発プロジェクトのスケジュールが遅れ、クライアントからの不満が高まっている。", place: "場所", level_status: 0, open_status: 2, image:File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 2, tag_id: 2, title: "タイトル(全体公開)", body: "品質管理が不十分で、不良品が市場に出回ってしまった。", place: "場所", level_status: 2, open_status: 0, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 3, tag_id: 3, title: "タイトル(全体公開)", body: "仕入れ先からのサプライチェーンの途中での遅延が発生し、在庫が足りない。", place: "", level_status: 1, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 4, tag_id: 4, title: "タイトル(全体公開)", body: "クレジットリスクの管理が不十分で、貸し倒れが急増している。", place: "場所", level_status: 2, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 5, tag_id: 5, title: "タイトル(全体公開)", body: "顧客からの不満が増加し、サービス品質が低下している。", place: "場所", level_status: 1, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 6, tag_id: 6, title: "タイトル(全体公開)", body: "クライアントの広告キャンペーンが予算を超過し、期待される成果が得られていない。", place: "場所", level_status: 0, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 7, tag_id: 7, title: "タイトル(全体公開)", body: "介護施設にて職員の人手不足から、利用者が転倒してしまった。", place: "場所", level_status: 2, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 8, tag_id: 8, title: "タイトル(全体公開)", body: "医療ミスが頻繁に発生しており、患者の安全が脅かされている。", place: "場所", level_status: 2, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 9, tag_id: 9, title: "タイトル(全体公開)", body: "公共インフラの保守不足により、安全性が懸念されている。", place: "場所", level_status: 0, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 10, tag_id: 10, title: "タイトル(全体公開)", body: "在庫管理が不確実で、品切れと在庫過剰が問題となっている。", place: "場所", level_status: 1, open_status: 2, image: File.open("./app/assets/images/no_image.jpg") },

#   { member_id: 1, tag_id: 1, title: "タイトル(社内公開)", body: "開発プロジェクトのスケジュールが遅れ、クライアントからの不満が高まっている。", place: "場所", level_status: 0, open_status: 1, image:File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 2, tag_id: 2, title: "タイトル(社内公開)", body: "品質管理が不十分で、不良品が市場に出回ってしまった。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 3, tag_id: 3, title: "タイトル(社内公開)", body: "仕入れ先からのサプライチェーンの途中での遅延が発生し、在庫が足りない。", place: "", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 4, tag_id: 4, title: "タイトル(社内公開)", body: "クレジットリスクの管理が不十分で、貸し倒れが急増している。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 5, tag_id: 5, title: "タイトル(社内公開)", body: "顧客からの不満が増加し、サービス品質が低下している。", place: "場所", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 6, tag_id: 6, title: "タイトル(社内公開)", body: "クライアントの広告キャンペーンが予算を超過し、期待される成果が得られていない。", place: "場所", level_status: 0, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 7, tag_id: 7, title: "タイトル(社内公開)", body: "介護施設にて職員の人手不足から、利用者が転倒してしまった。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 8, tag_id: 8, title: "タイトル(社内公開)", body: "医療ミスが頻繁に発生しており、患者の安全が脅かされている。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 9, tag_id: 9, title: "タイトル(社内公開)", body: "公共インフラの保守不足により、安全性が懸念されている。", place: "場所", level_status: 0, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 10, tag_id: 10, title: "タイトル(社内公開)", body: "在庫管理が不確実で、品切れと在庫過剰が問題となっている。", place: "場所", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },

#   { member_id: 1, tag_id: 1, title: "タイトル(非公開)", body: "開発プロジェクトのスケジュールが遅れ、クライアントからの不満が高まっている。", place: "場所", level_status: 0, open_status: 1, image:File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 2, tag_id: 2, title: "タイトル(非公開)", body: "品質管理が不十分で、不良品が市場に出回ってしまった。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 3, tag_id: 3, title: "タイトル(非公開)", body: "仕入れ先からのサプライチェーンの途中での遅延が発生し、在庫が足りない。", place: "", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 4, tag_id: 4, title: "タイトル(非公開)", body: "クレジットリスクの管理が不十分で、貸し倒れが急増している。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 5, tag_id: 5, title: "タイトル(非公開)", body: "顧客からの不満が増加し、サービス品質が低下している。", place: "場所", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 6, tag_id: 6, title: "タイトル(非公開)", body: "クライアントの広告キャンペーンが予算を超過し、期待される成果が得られていない。", place: "場所", level_status: 0, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 7, tag_id: 7, title: "タイトル(非公開)", body: "介護施設にて職員の人手不足から、利用者が転倒してしまった。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 8, tag_id: 8, title: "タイトル(非公開)", body: "医療ミスが頻繁に発生しており、患者の安全が脅かされている。", place: "場所", level_status: 2, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 9, tag_id: 9, title: "タイトル(非公開)", body: "公共インフラの保守不足により、安全性が懸念されている。", place: "場所", level_status: 0, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
#   { member_id: 10, tag_id: 10, title: "タイトル(非公開)", body: "在庫管理が不確実で、品切れと在庫過剰が問題となっている。", place: "場所", level_status: 1, open_status: 1, image: File.open("./app/assets/images/no_image.jpg") },
# ])

# Vision.create!([
#   { member_id: 1, post_id: 1, improvement: "スケジュール管理を改善し、リアルタイムで進捗をモニタリングするプロジェクト管理ツールの導入や、アジャイル開発方法の採用を行う。", closing_day: "", double_check: "Aさん" },
#   { member_id: 2, post_id: 2, improvement: "品質管理プロセスの強化と監視を行い、製品の品質を向上させる。また、トレーサビリティを確保し、不良品の追跡とリコール手続きを迅速に行う。", closing_day: "", double_check: "Aさん" },
#   { member_id: 3, post_id: 3, improvement: "サプライチェーンの可視性を向上させ、リアルタイムで在庫と供給状況をモニタリングするためのテクノロジーを導入。予測モデルを使用して在庫レベルを最適化する。", closing_day: "", double_check: "Aさん" },
#   { member_id: 4, post_id: 4, improvement: "より厳格なクレジットリスク評価モデルを採用し、貸し倒れのリスクを最小限に抑える。また、ポートフォリオの多様化を検討し、リスク分散を図る。", closing_day: "", double_check: "Aさん" },
#   { member_id: 5, post_id: 5, improvement: "顧客フィードバックを積極的に収集し、サービス品質の改善に反映する仕組みを構築。トレーニングとスキル向上の機会を提供し、スタッフの満足度を向上させる。", closing_day: "", double_check: "Aさん" },
#   { member_id: 6, post_id: 6, improvement: "クライアントとのコミュニケーションを強化し、クリアな目標と予算を設定。広告キャンペーンの成果を定期的にモニタリングし、最適化を行う。", closing_day: "", double_check: "Aさん" },
#   { member_id: 7, post_id: 7, improvement: "職員の不足を解消するため、新しいスタッフを採用し、既存のスタッフのトレーニングを強化します。特に、転倒予防と応急処置のトレーニングを重点的に行う。", closing_day: "", double_check: "Aさん" },
#   { member_id: 8, post_id: 8, improvement: "医療スタッフのトレーニングと認証プロセスを強化し、医療手続きの品質管理を改善。エラーレポートの分析を通じて問題箇所を特定し、改善策を実施する。", closing_day: "", double_check: "Aさん" },
#   { member_id: 9, post_id: 9, improvement: "ルーチンな保守スケジュールを策定し、インフラの状態を監視。必要に応じて修理とメンテナンスを実施し、安全性を確保する。", closing_day: "", double_check: "Aさん" },
#   { member_id: 10, post_id: 10, improvement: "販売予測の改善とリアルタイム在庫監視システムの導入。在庫の効率的な管理と供給チェーンの最適化を行い、在庫問題を軽減する。", closing_day: "", double_check: "Aさん" }
# ])

# 9.times do |n|
#   Comment.create!(
#     member_id: n+1,
#     post_id: n+1,
#     comment: "コメント"
#   )
# end