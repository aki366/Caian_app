require 'rails_helper'

RSpec.describe "Posts Request", type: :request do
  let(:post) { create(:post) }

  describe 'GET #new' do
    subject { get new_post_path(user.id) }
    let!(:user) { create(:user) }
    include_context 'login_as_user'
    it '新規投稿画面に遷移できること' do
      subject
      expect(response).to be_successful
    end
  end
  
  describe 'POST #create' do
    subject { post posts_path }
    context 'パラメータが正常なとき' do
      before do
        @post = create(:post)
      end
      it '新規投稿できること' do
        subject
        expect(response).to have_http_status(:redirect)
      end
      # it 'メッセージが表示されること' do
      #   expect(response.body).to include '投稿を作成しました'
      # end
    end
  end

  describe 'GET #index' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
      end
    end
  end

  describe 'GET #show' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン状態のとき' do
      before 'ユーザーIDをセッションから取り出せるようにする' do
      end
      it 'リクエストが成功すること' do
        # expect(response.status).to eq 200
      end
      it 'ユーザー名が表示されていること' do
        # get edit_user_url takashi
        # expect(response.body).to include 'Takashi'
      end
    end
  end

  describe 'PUT #update' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログイン状態のとき' do
      it 'リクエストが成功すること' do
      end
      it 'メッセージが表示されること' do
        # expect(response.body).to include '投稿を削除しました'
      end
    end
  end
end
