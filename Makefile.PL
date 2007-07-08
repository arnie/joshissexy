use inc::Module::Install;

name 'joshissexy';
all_from 'lib/joshissexy.pm';

requires 'Catalyst' => '5.7006';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'DBIx::Class';
requires 'DBD::Pg';
requires 'CGI::FormBuilder';
requires 'Catalyst::Controller::FormBuilder';
requires 'YAML'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
