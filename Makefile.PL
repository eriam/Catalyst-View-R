use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::View::R',
    AUTHOR              => q{Eriam Schaffter <eriam@cpan.org>},
    VERSION_FROM        => 'lib/Catalyst/View/R.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/View/R.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'       								=> 0,
        'File::Slurp'       							=> 0,
        'Catalyst::View::TT'       				=> 0,
        'Test::WWW::Mechanize::Catalyst'	=> 0,
        'Statistics::R'  									=> 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-View-R*' },
);
