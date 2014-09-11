#
# Instructions
#
# 1. Figure out what this function does
# 2. Write a unit test for it
# 3. Refactor for readability and efficiency
#
# NOTE: Do regular commits that show agile style iterations through the problem.
# If you prefer a different language, you can provide your solution in PHP, 
# Python or Javascript too.
#

=head1 NAME

SillyFunction - a "fun" exercise

=head1 SYNOPSIS

  use SillyFunction qw(:all);
  $sorted_and_unique_brand_type = group_products($products);

=head1 DESCRIPTION

Takes an array referece of hash references expecting at least
keys of brand and type. Will return a unique array reference of
hashes with just brand and type keys, sorted by brand then type.

=head1 EXAMPLE

  use SillyFunction qw(:all);
  use Data::Dumper qw(Dumper);

  my $products = [
    { brand => "EMCA", type => 'cushion', ... },
    { brand => "ACME", type => 'cushion', ... },
    { brand => "ACME", type => 'animal',  ... },
    { brand => "ACME", type => 'animal',  ... },
  ];

  print Dumper( group_products($products );
  >> $VAR1 = [
            {
              'brand' => 'ACME',
              'type' => 'animal'
            },
            {
              'brand' => 'ACME',
              'type' => 'cushion'
            },
            {
              'brand' => 'EMCA',
              'type' => 'cushion'
            }
          ];

=head1 AUTHOR

Brett Rann <brettrann@gmail.com>

=head1 SEE ALSO

https://github.com/infoxchange/a-fun-problem
=cut




package SillyFunction;

use warnings;
use strict;

use Exporter 'import';
our @EXPORT_OK = qw( group_products );
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

sub group_products {
  my $products = shift;
  my %seen = ();

  my @uniq_on_brand_and_type_then_sorted =
    sort { $a->{brand} cmp $b->{brand} or $a->{type} cmp $b->{type} }
    grep { not $seen{ $_->{brand} }{ $_->{type} }++ } # remove duplicates
    map { { brand => $_->{brand}, type => $_->{type} } } # remove unwanted keys
    @$products;
  return \@uniq_on_brand_and_type_then_sorted;
}
1;
