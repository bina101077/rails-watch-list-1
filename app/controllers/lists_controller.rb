class ListsController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :find_list, only: [:show, :create, :destroy]

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
    @list = List.new
    @list = List.create(list_params)
    if @list.save
      redirect_to new_list_path(@list), notice: 'List was successfully created.'
      else
        render :new
    end
  end

  def destroy
    #@list = List.find(params[:id])
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
