set :stage, :production
server '54.178.154.100', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/ppotato.pem'
