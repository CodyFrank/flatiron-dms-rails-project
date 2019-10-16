module ApplicationHelper

    def navbar
        if logged_in?
            render "layouts/logged_in_navbar"
        else
            render "layouts/logged_out_navbar"
        end
    end
    
end
