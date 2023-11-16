class TrucsController < ApplicationController

   before_action :set_truc, only: [:show, :edit, :update, :destroy]

  def index
    @trucs = Truc.all
  end

  def show
  end

  def new
    @truc = Truc.new
  end

  def create
    @truc = Truc.new(truc_params)
      if @truc.save
        
        respond_to do |format|
          format.html { redirect_to truc_url(@truc), notice: "Truc was successfully created." }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @truc.update(truc_params)
      respond_to do |format|
        format.html { redirect_to truc-url(@truc), notice: "Truc was successfully destroyed." }
        format.turbo_stream 
      end  
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @truc.destroy
    redirect_to trucs_path, notice: "Truc was successfully destroyed."
  end

#   private

  def set_truc
    @truc = Truc.find(params[:id])
  end

  def truc_params
    params.require(:truc).permit(:name)
  end

end
