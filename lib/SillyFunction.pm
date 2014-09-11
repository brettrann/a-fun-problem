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
