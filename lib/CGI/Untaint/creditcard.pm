package CGI::Untaint::creditcard;

use strict;
use base 'CGI::Untaint::printable';
require Business::CreditCard;

use vars qw/$VERSION/;
$VERSION = '0.01';

sub is_valid { 
  my $self = shift;
  (my $ccno = $self->value) =~ tr/-/ /;
  return unless Business::CreditCard::validate($ccno);
  $self->value($ccno);
  return $ccno;
}

=head1 NAME

CGI::Untaint::creditcard - validate a creditcard

=head1 SYNOPSIS

  use CGI::Untaint;
  my $handler = CGI::Untaint->new($q->Vars);

  my $cc = $handler->extract(-as_creditcard => 'ccno');

=head1 DESCRIPTION

This Input Handler verifies that it is dealing with a reasonable
credit card number (i.e. one that Business::CreditCard believes
to be valid.) It also replaces any minus signs with spaces, as 
B:CC doesn't like those.

=head1 SEE ALSO

L<CGI::Untaint>. L<Business::CreditCard>.

=head1 AUTHOR

Tony Bowden, E<lt>kasei@tmtm.comE<gt>. 

=head1 COPYRIGHT

Copyright (C) 2001 Tony Bowden. All rights reserved.

This module is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
