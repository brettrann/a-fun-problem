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

  my $brand_type = _build_unique_brand_type_array($products);
  my $sorted =  _build_sorted_brand_type_hash_array($brand_type);
  return $sorted;
}

sub _build_unique_brand_type_array {
  my $products = shift;
  my %seen = ();

  my @uniq_sorted =
      grep { not $seen{ $_->{brand} }{ $_->{type} }++ }
      map { { brand => $_->{brand}, type => $_->{type} } }
      @$products;

  return \@uniq_sorted;
}

sub _build_sorted_brand_type_hash_array {
  my $brand_type = shift;
  my @sorted =
    sort { $a->{brand} cmp $b->{brand} or $a->{type} cmp $b->{type} }
    @$brand_type;

  return \@sorted;
}
1;
