class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    sanitised_params = user_params
    org_name = sanitised_params[:organisation]    
    sanitised_params.delete(:organisation)
    @user = User.new(sanitised_params)
    @user.organisation_id = get_organisation_id(org_name)
    @user.is_admin = is_admin(sanitised_params[:is_admin])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:forename, :surname, :email, :password, :password_confirmation, :is_admin, :organisation)
    end

    def get_organisation_id(name)
      org = Organisation.where(:name => name).first
      if org
        return org.id
      else
        add_organisation(name)
        get_organisation_id(name)
      end
    end

    def add_organisation(name)
      new_org = Organisation.new(:name => name)
      new_org.save
    end

    def is_admin(checkbox_value)
      if checkbox_value.to_i == 0 and User.all.last
        return 0
      else
        return 1
      end
    end
      
end
