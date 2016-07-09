class baseconf {

  package { ['apt-transport-https', 'ca-certificates', 'git', 'libffi-dev', 'libssl-dev', 'mutt', 'python-dev', 'python-setuptools', 'tmux', 'unzip', 'vim']:
    ensure => present
  }

  file { '/etc/motd':
    backup => false,
    content => template('baseconf/motd.erb'),
    ensure => file
  }

  Exec { 
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  }

  exec { 'install docker':
    command => 'curl -sSL https://get.docker.com/ | sh',
    unless => 'which docker'
  }

  service { 'docker':
    enable => true,
    ensure => running
  }

  user { 'vagrant':
    ensure => 'present',
    groups => ['docker']
  }

  exec { 'install pip':
    command => 'easy_install pip',
    unless => 'which pip'
  }

  exec { 'install docker-compose': 
    command => 'pip install docker-compose',
    unless => 'which docker-compose'
  }

  exec { 'install ansible':
    command => 'pip install ansible && pip install --upgrade setuptools',
    unless => 'which ansible'
  }

  class { 'packer':
    version => '0.10.1',
  }

  class { 'terraform':
    version => '0.6.16',
  }

}
