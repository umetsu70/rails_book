# encoding: utf-8

class TopController < ApplicationController
    def index
logger.debug("indexの中に入りました")
      @message="図書貸し出し管理システム"
      
      @members = Member.all.order(id: "DESC") ## idの降順
      
logger.debug("indexの中 end前") 
    end

    def create
      logger.debug("createの中に入りました")
             # save member_paramsメソッドを引数で呼ぶ
            @member = Member.new(name: params[:name],book_name: params[:book_name],book_status: params[:book_status])

          # インスタンスの保存
          if @member.save
            logger.debug("saveの中に入りました")
      
            flash[:success] = "登録しました"
            
            redirect_to root_path
            
          else 
            logger.debug("elseの中に入りました")
            logger.debug @member.errors.full_messages
            render confirm
            
          end
      logger.debug("createの中　end前")
          end
  private




  private

    def tiny_format(text)
      h(text).gsub("¥n","<br ¥>").html_safe
    end

    def borrow
logger.debug("borrowの中に入りました")
    # 新規レコードのためのモデルインスタンスを作成
      @members = Member.new
logger.debug("borrowの中 end前")
    end

# 確認画面
    def confirm
logger.debug("confirmの中に入りました")
      # renderメソッド:リクエスト元へ直接出力を行なう テキストを出力
      render:text=>"利用者名: = #{params[:name]},書名: = #{params[:book_name]},本の状態: = #{params[:book_status]}"
logger.debug("confirmの中 end前")


    end

    def member_params
logger.debug("member_paramsの中に入りました")
logger.debug params.inspect
    # permitメソッドで変更を加えられるキーを指定
    # 悪意のあるリクエスト（指定した以外のデータを送ってくる等）を受けた際に、
    # permitメソッドで許可していない項目については変更されず、データの扱いがより安全にする
      params.require(:members).permit(:name, :book_name, :book_status)
    end


    def new
logger.debug("newの中に入りました")
    end

# 編集
    def edit
logger.debug("editの中に入りました")
    # レコード特定
    @member = Member.find(params[:id])
    
    end

    def show
logger.debug("showの中に入りました")
    # レコード特定
    @member = Member.find(params[:id])
    end

# 更新
    def update
logger.debug("updateの中に入りました")
      @member = Member.find(params[:id])
      @member.update(member_params)
      redirect_to root_path

    end

# 削除
    def destroy
logger.debug("destroyの中に入りました")
    # レコード特定
    @member = Member.find(params[:id])
    @member.destroy
    # 一覧画面へ
    redirect_to root_path
    end

end