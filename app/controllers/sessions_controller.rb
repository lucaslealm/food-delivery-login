require_relative '../views/sessions_view'

class SessionsController
    def initialize(employee_repository)
        @employee_repository = employee_repository
        @sessions_view = SessionsView.new
    end

    def login
        # Get the username
        username = @sessions_view.ask_user_for("What's your username?")
        # Get the password
        password = @sessions_view.ask_user_for("What's your password?")
        # Get the employee by the username
        employee = @employee_repository.find_by_username(username)
        # Check if the user's password matches the password informed
        if employee && employee.password == password
            return employee
        else
            @sessions_view.wrong_credentials
            login # Recursive method call
        end
    end
end