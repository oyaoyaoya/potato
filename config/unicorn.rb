# app_path = '/var/www/potato'
#
# worker_processes 1

# working_directory "#{app_path}/current"
# pid "#{app_path}/shared/tmp/pids/unicorn.pid"
# stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
# stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

# listen 3000
# timeout 100

$worker  = 2
$timeout = 30
$app_dir = "/var/www/potato/current"
$listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
$pid     = File.expand_path '/var/www/potato/shared/tmp/pids/unicorn.pid'
$std_log = File.expand_path 'log/unicorn.log', $app_dir

worker_processes  $worker
working_directory $app_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid

preload_app true

GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

#fork前に行うことを定義。後述
  before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
    old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        Process.kill "QUIT", File.read(old_pid).to_i
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
  end

#fork後に行うことを定義。後述
  after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  end
