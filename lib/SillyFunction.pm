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

sub group_products {
  my $products = shift;
  my %brand_type = ();
  my $grouped_products = ();

  foreach my $product (@$products)
  {
    $brand_type{$product->{brand}}{$product->{type}} = 1;
  }
  foreach my $brand (sort keys %brand_type)
  {
    foreach my $type (sort keys %{$brand_type{$brand}})
    {
      push(@grouped_products, { brand => $brand, type => $type});
    }
  }
  return \@grouped_products;
}

1;
