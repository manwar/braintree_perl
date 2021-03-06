# vim: sw=4 ts=4 ft=perl

package # hide from pause
    WebService::Braintree::TransparentRedirect::QueryString;

use 5.010_001;
use strictures 1;

use URI;
use WebService::Braintree::Digest qw(hexdigest);
use Moose;
use Carp qw(confess);

has 'config' => ( is => 'rw', default => sub { WebService::Braintree->configuration});

sub validate {
    my($self, $query_string) = @_;
    $self->check_http_status($query_string);
    confess "ForgedQueryString" if $self->hash_is_forged($query_string);
    return 1;
}

sub parse {
    my ($self, $query_string) = @_;
    my $uri = URI->new;
    $uri->query($query_string);
    return { $uri->query_form};
}

sub hash_is_forged {
    my ($self, $query_string) = @_;
    if ($query_string =~ /(.*)(&|;)hash=(.*)/) {
        my $query_string_without_hash = $1;
        my $hash = $3;
        return $hash ne hexdigest($self->config->private_key, $query_string_without_hash);
    }
    return 1;
}

sub check_http_status {
    my($self, $query_string) = @_;
    my $params = $self->parse($query_string);
    confess "UnexpectedError: expected query string to have an http_status param" unless $params->{'http_status'};
    confess "AuthenticationError" if $params->{'http_status'} eq '401';
    confess "AuthorizationError"  if $params->{'http_status'} eq '403';
    confess "ServerError"         if $params->{'http_status'} eq '500';
    confess "DownForMaintenance"  if $params->{'http_status'} eq '503';
    confess "UnexpectedError"     if $params->{'http_status'} ne '200';
}

__PACKAGE__->meta->make_immutable;

1;
__END__
