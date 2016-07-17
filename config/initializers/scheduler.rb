require 'rufus-scheduler'

s = Rufus::Scheduler.new

s.cron '0 24 * * 1-7' do
  system("rake namespace:todo")
end
