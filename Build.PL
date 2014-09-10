use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name     => 'SillyFunction',
  license         => 'perl',
  dist_abstract   => 'A "fun" puzzle.',
  dist_author     => 'Brett Rann <brettrann@gmail.com>',
  build_requires  => {
    'Test::More'    => '0.98',
  },
);

$builder->create_build_script();
