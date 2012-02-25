package Web::View::TT;

use strict;
use base 'Catalyst::View::TT';


__PACKAGE__->config({
    CATALYST_VAR        => 'c',
    PRE_PROCESS         => 'config/main',
    WRAPPER             => 'site/wrapper.html',
    ENCODING            => 'utf-8',
    TIMER               => 0,
    TEMPLATE_EXTENSION  => '.html',
    ABSOLUTE            => 1,
    CACHE_SIZE          => 64,
    EVAL_PERL           => 1,
});


sub relocate_at {
   my ($self, $new_home, $c) = @_;
   
#   # static includes
#   $c->config->{static}->{dirs}            = ();
#   $c->config->{static}->{include_path}    = ();
#   push @{ $c->config->{static}->{include_path} }, $new_home.'/';
#   push @{ $c->config->{static}->{include_path} }, $new_home.'/static/';
#   push @{ $c->config->{static}->{include_path} }, $new_home.'/admin/static/';
#   
#   # TT includes
#   @{ $self->include_path } = ();
#   push @{ $self->include_path }, $new_home.'/src/';
#   push @{ $self->include_path }, $new_home.'/lib/';
#   push @{ $self->include_path }, $new_home.'/emails/';

}

sub relocate_at_default {
   my ($self, $c) = @_;
   
#   $self->relocate_at('/usr/local/perl-prestashop/root/', $c);

}


1;
