class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "----------------------"
    puts "My Crystals Diary App"
    puts "----------------------"

    while @running
      display_actions
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then controller.list
    when 2 then controller.create
    when 3 then controller.edit!
    when 4 then controller.destroy!
    when 5 then controller.stop
    else
      puts "Please select 1/2/3/4/5"
    end
  end

  def stop
    @running = false
    puts "Bye!"
  end

  def display_actions
    puts ""
    puts "1 - List all crystals"
    puts "2 - Add a new crystal"
    puts "3 - Update existing crystal"
    puts "4 - Remove a crystal"
    puts "5 - Stop and exit the app"
  end
end
