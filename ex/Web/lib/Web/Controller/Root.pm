package Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');


sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}
 
sub iris : Global {
	my ( $self, $c ) = @_;
	
	$c->log->info('ok');
	$c->stash->{r} = 'iris.R';  
}


sub end : Private {
	my ( $self, $c ) = @_;
	
	if (exists $c->stash->{r} ) {
		$c->forward( $c->component('R') );
	}
	else {
		$c->forward( $c->component('TT') );
	}
}


__PACKAGE__->meta->make_immutable;

1;
