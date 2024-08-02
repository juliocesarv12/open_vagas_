module CompaniesHelper
    def dynamic_url_company
        if current_user.company.nil? && current_user.company.try(:id).present?
            new_company_path
        else 
            edit_company_path(current_user.company)
        end
    end
end
