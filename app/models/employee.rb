class Employee

    def initialize(attributes = {})
        @id = attributes[:id]
        @username = attributes[:username]
        @password = attributes[:password]
        @role = attributes[:role]
    end
end