class SessionsView
    def ask_user_for(question)
        puts "#{question}"
        return gets.chomp
    end

    def wrong_credentials
        puts "NOT TODAY. Try again!"
    end
end
