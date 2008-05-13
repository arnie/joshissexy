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
requires 'HTML::FromText';
requires 'Catalyst::Controller::FormBuilder';
requires 'YAML';
requires 'Template::Plugin::Filter::HTMLScrubber';
requires 'DateTime::Format::Pg';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
