class UpdatesController < ApplicationController
  before_filter :require_login  
   before_filter :limit_update_access, :except =>[:index, :new, :create]
   
    # GET /updates
  # GET /updates.json
  def index
    @updates = Update.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    @update = Update.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    @update = Update.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/1/edit
  def edit
    @update = Update.find(params[:id])
  end

  # POST /updates
  # POST /updates.json
  def create
    @goal = Goal.find(params[:goal_id])
    @update = Update.new(params[:update])

    respond_to do |format|
      if @update.save
        format.html { redirect_to @goal, notice: 'Update was successfully created.' }
      else
        format.html { redirect_to @goal, notice: 'Nope. Didnt work' }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
      format.json { head :no_content }
    end
  end
  
  protected

  # only the user can edit their own goals
	def limit_update_access
	  @update = Update.find(params[:id])
		if @update.user_id != current_user.id
			render :text => "Hey what are you doing here. You do not have permission to access this update"
		end
	end
  
end
