
def logged_in?()
    if session[:user_id]
        return true
    else 
        return false
    end
end

def current_user()
    user = find_user_by_id(session[:user_id])

    if user
        return user
    else
        return {}
    end
end

