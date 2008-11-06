use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Text::Chord::Piano',
    license             => 'perl',
    dist_author         => 'Dai Okabayashi <genkivogue@ybb.ne.jp>',
    dist_version_from   => 'lib/Text/Chord/Piano.pm',
    requires => {
        'Test::More'            => 0,
        'version'               => 0,
        'Carp'                  => 0,
        'Class::Accessor::Fast' => 0,
    },
    add_to_cleanup      => [ 'Text-Chord-Piano-*' ],
);

$builder->create_build_script();
