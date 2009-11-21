:cron_log, "/var/www/lucien/shared/cron.log"

every 2.hours do
  rake "thinking_sphinx:index", :cron_log => "/dev/null"
end

every :reboot do
  rake "thinking_sphinx:start"
end