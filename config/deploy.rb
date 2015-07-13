# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'hackathon_sample'
set :repo_url, 'git@github.com:yucao24hours/hackathon_sample.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# デフォルトの task をすべて消す
framework_tasks = %i(starting started updating updated publishing published finishing finished)

framework_tasks.each do |t|
  Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear

# タスクの定義はこのようにやる
task :sample_task do
  # ローカルマシン上で動作するコマンド
  run_locally do
    # execute 'コマンド名'

    # NOTE execute コマンドだと標準出力は捨てられてしまうので、それを見る必要がある場合は capture メソッドを使って、
    # 戻り値として得た標準出力を使うことができる。
    # 戻り値をいい具合にログ出力するには info メソッドを使う。
    output = capture 'コマンド名'
    info output
  end

  # サーバ上で動作するコマンド
  on '対象サーバ' do
    # execute 'コマンド名'

    # NOTE execute コマンドだと標準出力は捨てられてしまうので、それを見る必要がある場合は capture メソッドを使って、
    # 戻り値として得た標準出力を使うことができる。
    # 戻り値をいい具合にログ出力するには info メソッドを使う。
    output = capture 'コマンド名'
    info output
  end
end
