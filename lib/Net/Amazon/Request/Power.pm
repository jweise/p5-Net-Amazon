######################################################################
package Net::Amazon::Request::Power;
######################################################################
use base qw(Net::Amazon::Request);

##################################################
sub new {
##################################################
    my($class, %options) = @_;

    if(exists $options{power}) {
        $options{PowerSearch} = $options{power};
        delete $options{power};
    } else {
        die "Mandatory parameter 'power' not defined";
    }

    if(!exists $options{mode}) { 
        die "Mandatory parameter 'mode' not defined";
    }

    my $self = $class->SUPER::new(%options);

    bless $self, $class;   # reconsecrate
}

1;

__END__

=head1 NAME

Net::Amazon::Request::Power - request class for 'Power Search'

=head1 SYNOPSIS

  use Net::Amazon;
  use Net::Amazon::Request::Power;

  my $ua = Net::Amazon->new(
      token       => 'YOUR_AMZN_TOKEN'
  );

  my $req = Net::Amazon::Request::Power->new( 
      power => 'subject: perl and author: schwartz',
      mode  => 'books',
  );

    # Response is of type Net::Amazon::Response::Power
  my $resp = $ua->request($req);

=head1 DESCRIPTION

C<Net::Amazon::Request::Power> is a class used to request
so-called I<Power Searches> from the Amazon web service.

The C<power> parameter specifies the power search string, C<mode>
defines which properties to look for.

Upon success, the response's C<properties()> method will return a list
of C<Net::Amazon::Property::*> objects.

=head2 METHODS

=over 4

=item new(power => $search_string, mode => $property)

Constructs a new C<Net::Amazon::Request::Power> object. C<$property>
is typically C<"books">. Examples for C<$search_string> are:

    author: schwartz

    author: schwartz and pubdate: after 10-2002

    subject: perl and (objects or object-oriented)

    keywords: "high tech*" and not fiction and pubdate: during 1999

    power "author: randal schwartz and publisher: Addison Wesley"
 
    author: randal schwartz and title: object books

See the "Amazon Web Services 2.1 API and Integration Guide" for details.

=back

Check L<Net::Amazon::Request> for common request parameters not listed here.

=head1 SEE ALSO

=head1 AUTHORS

Martin Streicher, E<lt>martin.streicher@apress.comE<gt>
Mike Schilli, E<lt>m@perlmeister.comE<gt>

=cut