package TestApp::View::R;

use strict;
use base 'Catalyst::View::R';


__PACKAGE__->config({
   CATALYST_VAR         => 'c',
   TEMPLATE_EXTENSION   => '.r',
   ABSOLUTE             => 1,
   PRE_PROCESS          => 'config/R',
   INCLUDE_PATH         => [
      '../root/src/',
      '../root/lib/',
   ],
});


1;
