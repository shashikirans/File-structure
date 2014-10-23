class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    if user_signed_in?
      
  #show only root folders (which have no parent folders)
  @folders = current_user.folders.roots 
  
     #show only root files which has no "folder_id"
     @assets = current_user.assets.where("folder_id is NULL").order("uploaded_file_file_name desc")    
   end
 end



  #this action is for viewing folders
  def browse
    #get the folders owned/created by the current_user
    @current_folder = current_user.folders.find(params[:folder_id])  

    if @current_folder

      #getting the folders which are inside this @current_folder
      @folders = @current_folder.children

      #We need to fix this to show files under a specific folder if we are viewing that folder
      @assets = @current_folder.assets.order("uploaded_file_file_name desc") 

      render :action => "index"
    else
      flash[:error] = "Don't be cheeky! Mind your own folders!"
      redirect_to root_url
    end
  end

  # GET /welcomes/1
  # GET /welcomes/1.json
  def show
  end

  # GET /welcomes/new
  def new
    @welcome = Welcome.new
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes
  # POST /welcomes.json
  def create
    @welcome = Welcome.new(welcome_params)

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
        format.json { render action: 'show', status: :created, location: @welcome }
      else
        format.html { render action: 'new' }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /welcomes/1
  # PATCH/PUT /welcomes/1.json
  def update
    respond_to do |format|
      if @welcome.update(welcome_params)
        format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome.destroy
    respond_to do |format|
      format.html { redirect_to welcomes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params[:welcome]
    end
  end
