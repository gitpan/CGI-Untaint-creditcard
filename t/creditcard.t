#!/usr/bin/perl -w

use Test::More tests => 5;

use strict;
use CGI;
use CGI::Untaint;

my @ok = (
  '4929 4929 4929 4929',
  '4929-4929-4929-4929',
  '4929492949294929',
);

my @not = (
  '4929 4929 4929 49291',
);

my $count = 0;
my %hash = map { "var" . ++$count => $_ } @ok, @not;
my $q = CGI->new({%hash});

ok(my $data = CGI::Untaint->new( $q->Vars ), "Can create the handler");

$count = 0;
foreach (@ok) {
  ++$count;
  ok($data->extract(-as_creditcard => "var$count"), 
   "Valid: " . $q->param("var$count"));
}

foreach (@not) {
  ++$count;
  ok(!$data->extract(-as_creditcard => "var$count"), 
    "Not Valid: " . $q->param("var$count"));
}
