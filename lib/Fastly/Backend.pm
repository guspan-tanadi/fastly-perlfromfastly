package Fastly::Backend;

use strict;
use base qw(Fastly::BelongsToServiceAndVersion);

Fastly::Backend->mk_accessors(qw(service version name address ipv4 ipv6 hostname use_ssl client_cert port
                                 connect_timeout first_byte_timeout between_bytes_timeout error_threshold max_conn weight
                                 created_at updated_at deleted_at));             

=head1 NAME

Fastly::Backend - Representation of an individual host you want to serve assets off

=head1 ACCESSORS

=head2 service

The id of the service this belongs to.

=head2 version

The number of the version this belongs to.

=head2 name

The name of this backend.

=head2 ipv4

the ipv4 address of the host to serve assets (this, hostname or ipv6 must be set)

=head2 ipv6

the ipv6 address of the host to serve assets (this, hostname or ipv4 must be set)

=head2 hostname

the hostname to serve assets from (this, ipv4 or ipv6 must be set)

=head2 port

the port to connect to (default 80)

=head2 use_ssl

whether to use ssl to get to the backend (default 0 i.e false)

=head2 connect_timeout

how long in milliseconds to wait for a connect before declaring the backend out of rotation (default 1,000)

=head2 first_byte_timeout

how long in milliseconds to wait for the first bytes before declaring the host out of rotation (default 15,000)

=head2 between_bytes_timeout

how long in milliseconds to wait between bytes before declaring the backend out of rotation (default 10,000)

=head2 error_threshold

how many errors before declaring the backend out of rotation (default 0, 0 meaning turned off)

=head2 max_conn

the maximum number of connections to this backend (default 20)

=head2 weight

the weight assigned to this backend (default 100)

=head2 created_at

The date and time this was created at

=head2 updated_at

The date and time this was updated at

=head2 deleted_at

The date and time this was deleted at

=cut

1;