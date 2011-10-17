package Net::Fastly::Service;

use strict;
use base qw(Net::Fastly::Model);

Net::Fastly::Service->mk_accessors(qw(id customer name comment created_at updated_at deleted_at));

=head1 NAME

Net::Fastly::Service - a representation of a Fastly service

=head1 ACCESSORS

=head2 id

The id of the service

=head2 customer

The id of the customer this belongs to

=head2 name

The name of this service

=head2 created_at

The date and time this was created at

=head2 updated_at

The date and time this was updated at

=head2 deleted_at

The date and time this was deleted at

=cut

=head1 METHODS

=cut

=head2 stats [type]

Get an hash ref of stats from different data centers.

Type can be one of

=over 4

=item minutely

=item hourly

=item daily

=item all (default)

=back 

=cut

sub stats {
    my $self = shift;
    my $type = shift || "all";
    die "You must be authed to get stats" unless $self->_fetcher->authed;
    die "Unknown stats type $type" unless grep { $_ eq $type } qw(minutely hourly daily all);
    return $self->_fetcher->client->_get($self->_get_path($self->id)."/stats/".$type);    
}

=head2 purge_all

Purge all assets from this service.

=cut
sub purge_all {
    my $self = shift;
    die "You must be authed to purge everything in a service" unless $self->_fetcher->authed;
    return $self->_fetcher->client->_put($self->_get_path($self->id)."/purge_all");
}

=head2 versions

Get a sorted array of all the versions that this service has had.

=cut
use Data::Dumper;
sub versions {
    my $self  = shift;
    die "You must be authed to get the versions for a service" unless $self->_fetcher->authed;
    my $fetcher  = $self->_fetcher;
    my $versions = $self->{versions};
    my @versions;
    foreach my $number (keys %$versions) {
        my $v = $versions->{$number};
        push @versions, Net::Fastly::Version->new($fetcher, service    => $self->id, 
                                                       number     => $number, 
                                                       comment    => $v->{comment} || "",
                                                       created_at => $v->{created},
                                                       updated_at => $v->{updated},
                                                       deleted_at => $v->{deleted});
    }
    return sort { $a->number <=> $b->number } @versions;
}

=head2 version

Get the current version of this service.

=cut
sub version {
    my $self = shift;
    die "You must be authed to get the current version" unless $self->_fetcher->authed;
    my @list = $self->versions;
    return $list[-1];
}

package Net::Fastly;

sub list_services {
    my $self  = shift;
    my %opts  = @_;
    return $self->_list("Net::Fastly::Service", %opts);
}

sub search_services {
    my $self  = shift;
    my %opts  = @_;
    my $class = "Net::Fastly::Service"; 
    die "You must be authed to search for a $class" unless $self->authed;
    my $hash    = $self->client->_get($class->_post_path."/search", %opts);
    return undef unless $hash;
    return $class->new($self, %$hash);
}
1;