class BooksController < ApplicationController

    # before_actionはコントローラの関数(edit、updateなど)が処理される直前に「railsから自動で呼び出されたい処理を挟む」ための機能
    # そのあと、Member.find(params[:id])とするためこれを 「set_member」という関数で共通化
    before_action :set_member, only: [:edit, :update, :destroy]

    def index

        @message="図書貸し出し管理システム"
        
        @members = Member.all.order(id: "DESC") ## idの降順

    end

    # new関数で変数@member(空のMemberインスタンス)を定義 これをビューで参照
    def new
        @member = Member.new
    
    end

    def edit
    
    end

    #更新
    def update
        if @member.update(member_params)
            flash[:success] = "登録しました"
            # 一覧画面へ遷移
            redirect_to root_path
        else
            render confirm
        end
    end

    #削除
    def destroy
        @member.destroy
        redirect_to root_path
    end

    def confirm
        # Member.newにmember_paramsで取得できるパラメータ情報を渡す
        # 渡した後に、ビューに渡して、ユーザが入力した情報表示
        @member = Member.new(member_params)
    end

    def create
        # save member_paramsメソッドを引数で呼ぶ
       @member = Member.new(member_params)

        # インスタンスの保存
        if @member.save
 
            flash[:success] = "登録しました"
       
            redirect_to root_path
       
        else 
            render confirm
       
        end
    end

    private

    # set_memberを複数実行してもfindは1回しか呼ばれないようにするため
    def set_member
        # 「||=」は「@memberがnil(=null)の時だけ、Member.find(param[:id])を代入。
        @member ||= Member.find(params[:id])
    end

    def member_params
        # requireでPOSTで受け取る値のキーを設定
        # permitメソッドで許可するカラムを設定
        # 悪意のあるリクエスト（指定した以外のデータを送ってくる等）を受けた際に、
        # permitメソッドで許可していない項目については変更されず、データの扱いがより安全にする
        params.require(:member).permit(:id, :name, :book_name, :book_status)
    end


end
