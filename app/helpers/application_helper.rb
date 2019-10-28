module ApplicationHelper

    def navbar
        if logged_in? && current_user.worker_number != nil
            render "layouts/logged_in_employee_navebar"
        elsif logged_in?
            render "layouts/logged_in_navbar"
        else
            render "layouts/logged_out_navbar"
        end
    end
    
end
