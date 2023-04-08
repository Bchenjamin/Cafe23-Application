class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  
  def index
    @active_stores = Store.active.all
    @inactive_stores = Store.inactive.all
  end

  def show
    @current_employees = @store.employees
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @store.update(store_params)
      flash[:notice] = "Updated store information for #{@store.name}."
      redirect_to @store
    else
      render action: 'edit'
    end
  end

  def destroy
    begin
      raise ActionController::UrlGenerationError
    end
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :active)
    end  
end

