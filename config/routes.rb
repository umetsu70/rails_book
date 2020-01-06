Rails.application.routes.draw do

  root 'books#index'

  # resourcesは、複数のリソースに対するCRUD処理を行うためのルーティングを自動生成
  # collection ブロックには全てのデータを対象としたアクションを記述 追加アクション
  resources :books do # /books
    collection do
      post :confirm # 確認画面
    end
  end
end
