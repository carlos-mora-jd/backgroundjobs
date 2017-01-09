class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv {
        @message = Message.new(message: 'Export in progres')
        if @message.save 
          Resque.enqueue(ExportWorker, @message.id)
          send_data @users.to_csv
        end        
     }
    end
  end

  def import    
    @user = User.last
    result =  User.import(params[:file])
    if result.empty?
      redirect_to root_url,  flash:{ danger:  "Invalid CSV file format."}
    else
      puts " -------  -- - --   #{result.inspect}"
      puts " -------  -- - --   #{result.unsuccess}"
      puts " -------  -- - --   #{result.success}"
      Resque.enqueue(ImportWorker, params[:file].original_filename ,result.unsuccess, result.success)
      redirect_to root_url , flash:{ success:  "Successfully import."} 
    end
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
    @user = User.new(user_params)
    puts "hola mundo ******  #{@user.inspect}"
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
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end
