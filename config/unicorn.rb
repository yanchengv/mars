worker_processes 5

APP_PATH = "/home/balawo/deploy/mars/current"
preload_app true
timeout 20
working_directory APP_PATH

#/tmp/unicorn.prometheus.sock;  这个sock来自 nginx的配置
listen "/tmp/unicorn.mars.sock", :backlog => 64 #这个sock来自 nginx的配置
#listen 8009
pid APP_PATH + "/tmp/pids/unicorn.pid"
# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"

before_exec do |server| # fix hot restart Gemfile
  ENV["BUNDLE_GEMFILE"] = "#{APP_PATH}/Gemfile"
end

before_fork do |server, worker|
  old_pid = APP_PATH + "/tmp/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts "Send 'QUIT' signal to unicorn error!"
    end
  end
end

