 #############################################################
    # Application
    #############################################################

    set :application, "Disser"
    set :deploy_to, "/home/rails/#{application}"

   #############################################################
    # Settings
   #############################################################

   default_run_options[:pty] = true
   ssh_options[:forward_agent] = true
   set :use_sudo, true
   set :scm_verbose, true


PREFIX="/usr"
REE="ruby-enterprise-1.8.6-20090421"
#RUBYGEMS="rubygems-1.3.2"
   #############################################################
   # Servers
   #############################################################

   set :user, "rails"
   set :user_passphrase, ""
   set :domain, "dis.mine.nu"
   server domain, :app, :web
   role :db, domain, :primary => true

   #############################################################
   # Git
   #############################################################

   set :scm, :git
   set :branch, "master"
   set :scm_user, "jastix"
   set :scm_passphrase, ""
   set :repository, "git@github.com:jastix/disser_rebuild.git"
   set :deploy_via, :remote_cache

   #############################################################
   # Linode Setup
   #############################################################

   namespace :linode do
     desc "Setup Environment"
     task :setup_env do
       update_apt_get
       install_dev_tools
       install_git
       install_postgres
       install_rails_stack
       install_sphinx
       install_passenger
       #config_passenger
       #config_vhost
     end

     desc "Update apt-get sources"
     task :update_apt_get do
       sudo "apt-get update"
     end

     desc "Install Development Tools"
     task :install_dev_tools do
       sudo "apt-get install build-essential zlib1g-dev libssl-dev libreadline5-dev wget -y"
     end

     desc "Install Git"
     task :install_git do
       sudo "apt-get install git-core -y"
     end


     desc "Install MySQL"
     task :install_mysql do
       sudo "apt-get install mysql-server libmysqlclient15-dev  -y"
     end

     desc "Install PostgreSQL"
     task :install_postgres do
       sudo "apt-get install postgresql  postgresql-server-dev-8.3 -y"
     end

     desc "Add postgres user"
     task :postgres_user do
       [  "sudo -u postgres psql postgres",
          " ALTER USER postgres WITH ENCRYPTED PASSWORD 'rails';",
          '\q',
          "sudo -u postgres createuser -A -P rails"
         ].each {|cmd| run cmd}
    end


     desc "Install Ruby, Gems, and Rails"
     task :install_rails_stack do
       [ "mkdir -p src",
         "cd src",
         "wget http://rubyforge.org/frs/download.php/55511/#{REE}.tar.gz",
         "tar xzvf #{REE}.tar.gz",
         "cd #{REE}/ && sudo ./installer --dont-install-useful-gems -a #{PREFIX}",
         "cd ..",
         "wget http://rubyforge.org/frs/download.php/55066/rubygems-1.3.2.tgz",
         "tar xzvf rubygems-1.3.2.tgz",
         "cd rubygems-1.3.2.tgz/ && sudo ruby setup.rb",
         "sudo gem update --system",
        "sudo gem install rails pg rake  --no-ri --no-rdoc"
      ].each {|cmd| run cmd}
    end

desc "Install sphinx"
     task :install_sphinx do
       [ "cd src",
         "wget http://www.sphinxsearch.com/downloads/sphinx-0.9.9-rc2.tar.gz",
         "tar xzvf sphinx-0.9.9-rc2.tar.gz",
         "cd sphinx-0.9.9-rc2.tar.gz/ && ./configure -a #{PREFIX} && make && sudo checkinstall",
         "cd .."
      ].each {|cmd| run cmd}
    end


    desc "Install Passenger"
    task :install_passenger do
      run "sudo gem install passenger --no-ri --no-rdoc"
      input = ''
      run "sudo passenger-install-nginx-module" do |ch,stream,out|
        next if out.chomp == input.chomp || out.chomp == ''
        print out
        ch.send_data(input = $stdin.gets) if out =~ /(Enter|ENTER)/
      end
    end
=begin
    desc "Configure Passenger"
    task :config_passenger do
      passenger_config =<<-EOF
  LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.2/ext/apache2/mod_passenger.so
  PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.2
  PassengerRuby /usr/bin/ruby1.8
      EOF
      put passenger_config, "src/passenger"
      sudo "mv src/passenger /etc/apache2/conf.d/passenger"
    end

    desc "Configure VHost"
   task :config_vhost do
     vhost_config =<<-EOF
      <VirtualHost *:80>
        ServerName dis.mine.nu
        DocumentRoot #{deploy_to}/public
     </VirtualHost>
      EOF
      put vhost_config, "src/vhost_config"
      sudo "mv src/vhost_config /etc/apache2/sites-available/#{application}"
      sudo "a2ensite #{application}"
      sudo "sudo a2enmod rewrite"
    end

    desc "Reload Apache"
    task :apache_reload do
      sudo "/etc/init.d/apache2 reload"
    end
=end
  end

  #############################################################
  # Deploy for Passenger
  #############################################################

  namespace :deploy do

    desc "Restarting mod_rails with restart.txt"
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "touch #{current_path}/tmp/restart.txt"
    end

    [:start, :stop].each do |t|
      desc "#{t} task is a no-op with mod_rails"
      task t, :roles => :app do ; end
    end
 end

