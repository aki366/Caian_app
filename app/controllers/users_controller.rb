class UsersController < ApplicationController

  before_action :forbid_login_user,{only:[:new, :create]}
  before_action :ensure_correct_user,{only:[:edit, :update]}
  before_action :set_user, {only:[:show, :edit, :update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = @user.posts.includes(:user)
    # 各ユーザーが持つroomのid一覧を配列で取得
    @current_user_rooms = @current_user.rooms.pluck(:id)
    @another_user_rooms = @user.rooms.pluck(:id)

    # 取得した配列の積集合を取る
    @room_ids = @current_user_rooms & @another_user_rooms
    if @user.id == @current_user.id
    else
      # 空でない場合は既に共通のroom idが存在する=ルーム作成済みと判定
      @isRoom = !@room_ids.empty?
      if @isRoom
        @roomId = @room_ids.first
      else
        @room = Room.new
        @room_user = RoomUser.new
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    image = params[:user][:user_image]
    hash = SecureRandom.hex(10)
    @user.user_image = "#{@user.name}_#{hash}.jpg" if image
    if @user.save
      write_image(@user.user_image, image) if image
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to user_path(@user.id)
    else
      @user.user_image = image if image
      render :new
    end
  end

  def edit
  end

  def update
    redirect_to user_path(@user.id) and return if @user.guest?

    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    image = params[:image]
    hash = SecureRandom.hex(10)
    @user.user_image = "#{@user.name}_#{hash}.jpg" if image
    if @user.save
      #もしイメージがパラメーターに含まれていれば、write_imageメソッドを呼び出す。
      # user情報編集は理解しやすいよう、かたまりで上にまとめて、保存に成功した時点で画像をファイルに書き込みます。
      write_image(@user.user_image, image) if image
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path(@user.id)
    else
      @user.user_image = image
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "アカウントを削除しました"
    redirect_to root_path
  end

  def likes
    # 仮に/users/1/likesというリクエストを受取った場合
    # id:'1'を取得し、User.find_by(id:1)となる
    @user = User.find_by(id: params[:id])
    # @userで取得したidに関連するlikesを取得
    # likesに紐づくpost:(関連1)を紐付け
    # 関連1に紐づく、:user(関連2)の情報を取得
    @likes = @user.likes.includes(post: :user)
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    # write_imageメソッドは第一引数に画像ファイル名, 第二引数にイメージを必要とする
    #（file_name == @user.user_image, image == params[:image]）
    def write_image(file_name, image)
      File.binwrite("public/user_images/#{file_name}",image.read)
    end

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice]= "権限がありません"
        redirect_to posts_path
      end
    end

    def user_params
      # ストロングパラメーター
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
