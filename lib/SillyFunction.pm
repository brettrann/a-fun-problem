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

  my $brand_type = _build_unique_brand_type_hash($products);
  return _build_sorted_brand_type_hash_array($brand_type);
}

sub _build_unique_brand_type_hash {
  my $products = shift;
  my %brand_type = ();

  foreach my $product (@$products)
  {
    $brand_type{$product->{brand}}{$product->{type}} = 1;
  }
  return \%brand_type;
}

sub _build_sorted_brand_type_hash_array {
  my $brand_type = shift;
  my @grouped_products = ();

  foreach my $brand (sort keys %$brand_type)
  {
    foreach my $type (sort keys %{$brand_type->{$brand}})
    {
      push(@grouped_products, { brand => $brand, type => $type});
    }
  }
  return \@grouped_products;
}
1;
