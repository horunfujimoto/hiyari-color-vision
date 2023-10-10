class ShowPdf < Prawn::Document

  def initialize(post) #ここでインスタンス(@post)の値を受け取る
    super(page_size: 'A4') #A4サイズのPDFを新規作成
    stroke_axis # 座標を表示
    @post = post #受け取った値をインスタンス変数として定義

    # ↓追記（日本語フォントの読み込み）
    font_families.update('JP' => {
                            normal: 'app/assets/fonts/ipaexm.ttf',
                            bold: 'app/assets/fonts/ipaexg.ttf'
                        })
    font 'JP'

    #-------- ここからコードを記述する ----------
    text "ヒヤリハット報告書", size: 20, align: :center
    move_down 20

    text @post.title, size: 14
    move_down 10

    schedule = [
      ["作成者氏名", @post.member.name],
      ["発生日時or作成日時", @post.created_at.strftime("%Y年%m月%d日 %H時%M分")],
      ["発生場所", @post.place],
      ["重度", @post.level_status_i18n],
      ["ヒヤリハット詳細", @post.body],
      ["改善案", "@post.vision.improvement"],
      ["確認者", "@post.vision.double_check"],
      ["改善締切日", "@post.vision.closing_day"]
    ]

    table schedule, cell_style: {height: 30},
    column_widths: [120, 400] do
      cells.size = 10
      row(0).border_top_width = 2
      row(0).border_bottom_width = 2
      columns(0).row(0..5).border_left_width = 2
      columns(-1).row(0..5).border_right_width = 2
      row(-1).border_bottom_width = 2

      row(5).height = 5 * row(5).height # ヒヤリハット詳細の高さ5倍
      row(6).height = 5 * row(6).height # 改善案の高さ5倍
    end

  end

end