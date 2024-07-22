class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def edit
  end
  def create
  end
  def update
  end

end
