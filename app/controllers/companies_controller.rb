class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def new
    if current_user.company
      redirect_to edit_company_path(current_user.company), alert: 'Você já possui uma empresa. Você pode editá-la aqui.'
    else
    @company = current_user.build_company
    end
  end

  def edit
    @company = current_user.company
  end
  def create
    @company = current_user.build_company(company_params)
    if @company.save
      flash[:notice] = 'Empresa cadastrada com sucesso.'
      redirect_to root_path
    else
      flash[:error] = 'Erro ao cadastrar a empresa.'
      render :new
    end
    
  end
  def update
  end

  private

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end

end
