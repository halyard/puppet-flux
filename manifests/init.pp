# == Class: flux
#
# Install and configure Flux
#
# === Parameters
#
class flux (
  $install_path = "/Users/${::boxen_user}/Applications/Flux.app",
) {
  package { 'flux-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { 'Flux':
    hidden => true,
    path   => $install_path
  } ~>
  exec { 'launch flux':
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
