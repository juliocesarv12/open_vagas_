class PositionsController < ApplicationController
  before_action :set_company
  before_action :set_position, only: [:edit, :show, :update]

  def index
    if @company.present?
      @positions = @company.positions
    else
      @positions = []
      flash[:alert] = "Company not found"
    end
  end

  def new
    @position = @company.positions.new
  end

  def edit
  end

  def show
  end

  def update
    # Your update action logic here
  end

  private

  def set_company
    if current_user.company.nil?
      redirect_to new_company_path
    else
      @company = current_user.company
    end
  end

  def set_position
    @position = Position.find(params[:id])
  end
end
