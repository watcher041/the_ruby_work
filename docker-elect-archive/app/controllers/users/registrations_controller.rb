# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def update

    # 画像をバイナリ画像で保存する
    if  params[:user][:image].present?
      params[:user][:image] = params[:user][:image].read
    end
    
    # ユーザー情報を更新する。
    super

  end

  # DELETE /resource
  def destroy

    # アカウントに紐づいているpostのタグのチェックを行う。
    current_user.posts.each do |post|
      Tag.checkEmpty(post)
    end

    # アカウントの削除を行う
    super

  end

   # バイナリー画像を変換して表示
   def get_image
    binding.pry
    tmpbin = User.find(params[:id])
    send_data(tmpbin.image, :disposition => "inline", :type => "image/png")
  end

end
