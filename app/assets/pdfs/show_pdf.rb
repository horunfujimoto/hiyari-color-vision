class ShowPdf < Prawn::Document

  def initialize(post,vision) #ここでインスタンス(@post)の値を受け取る
    super(page_size: 'A4') #A4サイズのPDFを新規作成
    #stroke_axis # 座標を表示
    @post = post #受け取った値をインスタンス変数として定義
    @vision = vision

    # ↓追記（日本語フォントの読み込み）
    font_families.update('JP' => {
                            normal: 'app/assets/fonts/ipaexm.ttf',
                            bold: 'app/assets/fonts/ipaexg.ttf'
                        })
    font 'JP'

    #-------- ここからPDFに記載したい内容のコードを記述する ----------
    text "ヒヤリハット報告書", size: 20, align: :center
    move_down 20

    text @post.created_at.strftime("%Y年%m月%d日"), size: 11, align: :right
    move_down 5

    text @post.member.name, size: 11, align: :right
    move_down 20

    text @post.title, size: 14
    move_down 10

    schedule = [
      ["発生日時", @post.occurrence_at.strftime("%Y年%m月%d日 %H時%M分")],
      ["発生場所", @post.place],
      ["重度", @post.level_status_i18n],
      ["ヒヤリハット詳細", @post.body],
      ["改善案", @vision.improvement],
      ["確認者", @vision.double_check],
      ["改善締切日", @vision.closing_day.strftime("%Y年%m月%d日 %H時%M分")]
    ]

    table schedule, cell_style: {height: 30},
    column_widths: [120, 400] do
      cells.size = 10
      row(0).border_top_width = 2
      row(0).border_bottom_width = 2
      columns(0).row(0..5).border_left_width = 2
      columns(-1).row(0..5).border_right_width = 2
      row(-1).border_bottom_width = 2

      row(3).height = 8 * row(3).height # ヒヤリハット詳細の高さ5倍
      row(4).height = 8 * row(4).height # 改善案の高さ5倍
    end

  end

end