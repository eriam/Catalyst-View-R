package TestApp::Controller::Root;
use strict;
use warnings;

__PACKAGE__->config( namespace => q{} );

use base 'Catalyst::Controller';

# your actions replace this one
sub main : Path {
    my ( $self, $c ) = @_;
    
   $c->log->info('ok');
   $c->stash->{r} = 'iris.r';  
}


sub end : Private {
   my ( $self, $c ) = @_;
   
   $c->forward( $c->component('R') );
}
1;
