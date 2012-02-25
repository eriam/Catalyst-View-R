package Web::View::R;

use strict;
use base 'Catalyst::View::R';

use namespace::autoclean;

__PACKAGE__->config({
	CATALYST_VAR         => 'c',
	TEMPLATE_EXTENSION   => '.r',
	PRE_PROCESS          => 'config/R',
});


1;
