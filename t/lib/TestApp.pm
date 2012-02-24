package TestApp;
use strict;
use warnings;

use Catalyst;

__PACKAGE__->config(
    name => 'TestApp',
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1,
    'View::R' => {
        INCLUDE_PATH => [
            __PACKAGE__->path_to( 'root', 'src' ),
            __PACKAGE__->path_to( 'root', 'lib' ),
        ],
    },
);

__PACKAGE__->setup;

1;