class HardWorker
  include Sidekiq::Worker

  def perform(*args) # *args initially
  	case args[0]
  	when "easy"
  		sleep 5
  		puts "easy"
  	when "hard"
  		sleep 10
  		puts "that was hard"
  	else
  		sleep 15
  		puts "Super hard" 
  	end
    # Do something
  end
end
