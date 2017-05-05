set :stage, :production
server '13.113.119.116', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/ppotato.pem'
