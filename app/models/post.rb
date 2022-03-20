class Post < ApplicationRecord
  validates :content, {presence: true,length: {maximum: 140}}
  validates :user_id, {presence: true}

  #TODO: ActiveStorage用のカラムをpostモデルに追加する
  #TODO: この記述で、@post.imageで画像を呼び出すことができる
  has_one_attached :image

  #TODO: Userモデルとのアソシエーションを作成
  #TODO: Postモデルのインスタンスがuserメソッドを使えるようになる
  #TODO: @post.user
  belongs_to :user
  
  def user
    return User.find_by(id: self.user_id)
  end

end
