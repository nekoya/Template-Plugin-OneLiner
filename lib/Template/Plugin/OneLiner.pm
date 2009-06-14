package Template::Plugin::OneLiner;

use strict;
use warnings;
use base qw(Template::Plugin);

our $VERSION = '0.0.2';
our $FILTER_NAME = 'oneliner';

sub new {
    my ( $self, $context, @args ) = @_;
    my $name = $args[0] || $FILTER_NAME;
    $context->define_filter( $name, \&oneliner, 0 );
    return $self;
}

sub oneliner {
    my $text = shift;
    $text =~ s/\s*\n+\s*//g;
    return $text;
}

1;

__END__

=head1 NAME

Template::Plugin::OneLiner - provides a Template Toolkit filter for compact html into single line

=head1 SYNOPSIS

  [% USE OneLiner -%]
  [% FILTER oneliner %]
  <table>
   <tr>
    <td>
     <p>Too much place is taken.</p>
    </td>
   </tr>
  </table>
  [% END %]

  You get it.
  <table><tr><td><p>Too much place is taken.</p></td></tr></table>

=head1 DESCRIPTION

  Template::Plugin::OnerLiner strip line breaks and space at beginning and end of lines.
  I refer to the Smarty(template engine for php) function 'strip'.
    http://www.smarty.net/manual/en/language.function.strip.php

=head1 AUTHOR

Ryo Miyake E<lt>ryo.studiom@gmail.comE<gt>

=head1 CHANGELOG

0.0.2 2008/11/20
        * Fixed memory leak due to Template::Plugin::Filter

=cut