class ListsController < ApplicationController
  #before_action :set_list, only: [:new, :create]
  before_action :find_list, only: [:show, :create, :edit, :update, :destroy]
  before_action :list_params, only: [:create, :update]
  def index
    @lists = List.all
  end

  def show
    #@lists = List.find(params[:id])
    #@lists = List.where(id: params[:id])
  end

  def  new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #@list = List.create(list_params)
    @list.save
      redirect_to list_path(@lists), notice: 'List was successfully created.'
  end


  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end

  def set_list
    @list = List.new
  end
end
