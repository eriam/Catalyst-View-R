package TestApp::Controller::Root;
use strict;
use warnings;

__PACKAGE__->config( namespace => q{} );

use base 'Catalyst::Controller';

# your actions replace this one
sub main : Path {
    my ( $self, $c ) = @_;
    
   $c->log->info('ok');
   $c->stash->{r} = 'iris1.r';  
}

sub iris2 : Global {
    my ( $self, $c ) = @_;

}


sub end : Private {
   my ( $self, $c ) = @_;
   
   $c->forward( $c->component('R') );
}
1;
