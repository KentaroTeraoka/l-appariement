class UsersController < ApplicationController


  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id:params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(name:params[:name],
                   user_id:params[:user_id],
                   sex:params[:sex],
                   password:params[:password])
    if @user.save
      session[:login_user]=@user.user_id
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "登録完了"
    else
      render("users/signup_error")
    end
  end

  def signup_error
  end

  def update
    @user=User.find_by(id:params[:id])
      @user.name=params[:name]
      @user.user_id=params[:user_id]
      @user.sex=params[:sex]
      @user.password=params[:password]
    if @user.save
      flash[:notice] = "編集完了"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit_error")
    end
  end

  def edit
    @user=User.find_by(id:params[:id])
  end

  def edit_error
  end

  def login
    @user=User.find_by(user_id:params[:user_id],
                       password:params[:password])
    if @user
      session[:login_user]=@user.user_id
      flash[:notice]="ログイン成功"
      redirect_to("/users/index")
    else
      render("users/login_error")
    end
  end

  def login_error
  end

  def logout
    session[:login_user]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end


end



