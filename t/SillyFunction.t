use strict;
use warnings;
use Test::More;

{ use_ok('SillyFunction', qw(:all)) || BAIL_OUT "can't use SillyFunction" }

# SillyFunction::group_products
# takes an array reference of product hash references
# $products = { brand => 'brand_name', type => 'type' }
# returns an array reference of
# { brand => $brand, type => $type } sorted by brand, then type

# Assumption:
# because the code creates a brand/type hash it is assumed
# there will be duplicates, as this effectively removes them.
# so, for context, will include a name key just for context clues
# it is not used.

my $products = [
  { brand => 'ACME', type => 'animal',  name => 'hen' },
  { brand => 'ACME', type => 'pill',    name => 'earthquake pills' },
  { brand => 'ACME', type => 'weapon',  name => 'atomic rearranger' },
  { brand => 'ACME', type => 'pill',    name => 'super speed vitamins' },
  { brand => 'ACME', type => 'weapon',  name => 'disintegrating pistol' },
  { brand => 'ACME', type => 'animal',  name => 'bumble bees' },
  { brand => 'EMCA', type => 'weapon',  name => 'integrating pistol' },
  { brand => 'ACME', type => 'animal',  name => 'water pistol' }
];

my $expects = [
  { brand => 'ACME', type => 'animal' },
  { brand => 'ACME', type => 'pill'   },
  { brand => 'ACME', type => 'weapon' },
  { brand => 'EMCA', type => 'weapon' },
];

my $result = group_products($products);

is_deeply($result, $expects, 'group_products return value') or diag explain $result;

done_testing;
