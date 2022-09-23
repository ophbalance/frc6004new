class ComputersController < ApplicationController
  before_action :set_computers, only: [:show, :edit, :update, :destroy]

  # GET /colleges
  def index
    @computers = Computer.all
  end

  # GET /colleges/1
  def show
  end

  # GET /colleges/new
  def new
    @computers = Computer.new
    
  end

  # GET /colleges/1/edit
  def edit
  end

  # POST /colleges
  def create
    @computers = Computer.new(computer_params)

    if @computers.save
      redirect_to @computers, notice: 'Asset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /colleges/1
  def update
    if @computers.update(computer_params)
      redirect_to @computers, notice: 'Asset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /colleges/1
  def destroy
    @computers.destroy
    redirect_to colleges_url, notice: 'Asset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers
      @computers = Computer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def computer_params
      params.require(:computer).permit(:name, :user_id, :asset_id, :archive)
    end
end
