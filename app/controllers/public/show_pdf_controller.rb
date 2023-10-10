class Public::ShowPdfController < ApplicationController

  def index
    @post = Post.find(params[:post_id]) #ここは(params[:post_id])じゃないとダメ
    respond_to do |format|
      format.pdf do #pdf形式での出力処理を do ~ end 間で行う
        pdf = ShowPdf.new(@post) #インスタンスの生成
          send_data pdf.render, filename: "report.pdf", type: "application/pdf", disposition: "inline" #PDFをブラウザ上に出力する際に必要なオプション
      end
    end
  end

end