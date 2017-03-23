Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: %w( edit update show) do
    collection do
      get :faculty_select
      get :department_select
      get :sold_list
      get :bought_list
    end
  end
  resources :courses, only: %w{ show index } do
    collection do
      get 'search'
    end
  end
  resources :textbooks, only: %w( show ), shallow: true do
    resources :items do
      member do
        resource :contract, only: %w( create show update )
      end
    end
  end
  resource :message, only: %w( create )
end

# ユーザーの流れ
# topから、(lessons/search)授業名検索 → (lessons/index)授業名一欄 → (lessons/show)授業詳細 (@textbooks = Textbook.where( cource_id: @cource.id)出品ボタン or (@items = Item.where(cource_id: @cource.id))出品アイテム一欄 )
# 出品コース → (item/new)(@textbook = Textbook.where(cource_id: params[:cource][:id]))教科書詳細 ＋ (@item = Item.new, @item.cource_id = params[:cource][:id], @item.textbook = params[:textbook][:id])出品情報記入 [インスタンスとして、@textbook = Textbook.where()textbookの情報]
# 購入コース → (items/:id)教科書詳細　→ 購入ボタン → (items/:id/contract)購入完了 → (contract/:id/messages) → メッセージのやりとり。
# メッセージ一欄 → ユーザーに紐づくメッセージ一欄(contracs)(@contracts = Contracs.)
