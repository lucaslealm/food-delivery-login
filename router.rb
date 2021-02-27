class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          print_manager_menu
          choice = gets.chomp.to_i
          print `clear`
          route_manager_action(choice)
        else
          print_delivery_guy_menu
          choice = gets.chomp.to_i
          print `clear`
          route_delivery_guy_action(choice)
        end
      end
    end
  end

  private

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add new order"
    puts "6. List all undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then p "To Do"
    when 6 then p "To Do"
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def print_delivery_guy_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Mark my order as delivered"
    puts "2. List my undelivered orders"
    puts "3. Logout"
    puts "4. Exit"
    print "> "
  end

  def route_delivery_guy_action(choice)
    case choice
    when 1 then p "To Do"
    when 2 then p "To Do"
    when 3 then logout!
    when 4 then stop!
    else puts "Try again..."
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    @current_user = nil
    @running = false
  end
end
