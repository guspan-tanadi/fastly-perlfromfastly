=begin comment

Fastly API

Via the Fastly API you can perform any of the operations that are possible within the management console,  including creating services, domains, and backends, configuring rules or uploading your own application code, as well as account operations such as user administration and billing reports. The API is organized into collections of endpoints that allow manipulation of objects related to Fastly services and accounts. For the most accurate and up-to-date API reference content, visit our [Developer Hub](https://www.fastly.com/documentation/reference/api/) 

The version of the API Spec document: 1.0.0
Contact: oss@fastly.com

=end comment

=cut

#
# NOTE: This class is auto generated.
# Do not edit the class manually.
#
package WebService::Fastly::OriginInspectorRealtimeApi;

require 5.6.0;
use strict;
use warnings;
use utf8;
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use WebService::Fastly::ApiClient;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class = shift;
    my $api_client;

    if ($_[0] && ref $_[0] && ref $_[0] eq 'WebService::Fastly::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = WebService::Fastly::ApiClient->new(@_);
    }

    bless { api_client => $api_client }, $class;

}


#
# get_origin_inspector_last120_seconds
#
# Get real-time origin data for the last 120 seconds
#
# @param string $service_id Alphanumeric string identifying the service. (required)
{
    my $params = {
    'service_id' => {
        data_type => 'string',
        description => 'Alphanumeric string identifying the service.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_origin_inspector_last120_seconds' } = {
        summary => 'Get real-time origin data for the last 120 seconds',
        params => $params,
        returns => 'OriginInspector',
        };
}
# @return OriginInspector
#
sub get_origin_inspector_last120_seconds {
    my ($self, %args) = @_;

    # verify the required parameter 'service_id' is set
    unless (exists $args{'service_id'}) {
      croak("Missing the required parameter 'service_id' when calling get_origin_inspector_last120_seconds");
    }

    # parse inputs
    my $_resource_path = '/v1/origins/{service_id}/ts/h';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'service_id'}) {
        my $_base_variable = "{" . "service_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'service_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(token )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('OriginInspector', $response);
    return $_response_object;
}

#
# get_origin_inspector_last_max_entries
#
# Get a limited number of real-time origin data entries
#
# @param string $service_id Alphanumeric string identifying the service. (required)
# @param int $max_entries Maximum number of results to display. (required)
{
    my $params = {
    'service_id' => {
        data_type => 'string',
        description => 'Alphanumeric string identifying the service.',
        required => '1',
    },
    'max_entries' => {
        data_type => 'int',
        description => 'Maximum number of results to display.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_origin_inspector_last_max_entries' } = {
        summary => 'Get a limited number of real-time origin data entries',
        params => $params,
        returns => 'OriginInspector',
        };
}
# @return OriginInspector
#
sub get_origin_inspector_last_max_entries {
    my ($self, %args) = @_;

    # verify the required parameter 'service_id' is set
    unless (exists $args{'service_id'}) {
      croak("Missing the required parameter 'service_id' when calling get_origin_inspector_last_max_entries");
    }

    # verify the required parameter 'max_entries' is set
    unless (exists $args{'max_entries'}) {
      croak("Missing the required parameter 'max_entries' when calling get_origin_inspector_last_max_entries");
    }

    # parse inputs
    my $_resource_path = '/v1/origins/{service_id}/ts/h/limit/{max_entries}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'service_id'}) {
        my $_base_variable = "{" . "service_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'service_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'max_entries'}) {
        my $_base_variable = "{" . "max_entries" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'max_entries'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(token )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('OriginInspector', $response);
    return $_response_object;
}

#
# get_origin_inspector_last_second
#
# Get real-time origin data from specific time.
#
# @param string $service_id Alphanumeric string identifying the service. (required)
# @param int $start_timestamp Timestamp in seconds (Unix epoch time). (required)
{
    my $params = {
    'service_id' => {
        data_type => 'string',
        description => 'Alphanumeric string identifying the service.',
        required => '1',
    },
    'start_timestamp' => {
        data_type => 'int',
        description => 'Timestamp in seconds (Unix epoch time).',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'get_origin_inspector_last_second' } = {
        summary => 'Get real-time origin data from specific time.',
        params => $params,
        returns => 'OriginInspector',
        };
}
# @return OriginInspector
#
sub get_origin_inspector_last_second {
    my ($self, %args) = @_;

    # verify the required parameter 'service_id' is set
    unless (exists $args{'service_id'}) {
      croak("Missing the required parameter 'service_id' when calling get_origin_inspector_last_second");
    }

    # verify the required parameter 'start_timestamp' is set
    unless (exists $args{'start_timestamp'}) {
      croak("Missing the required parameter 'start_timestamp' when calling get_origin_inspector_last_second");
    }

    # parse inputs
    my $_resource_path = '/v1/origins/{service_id}/ts/{start_timestamp}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'service_id'}) {
        my $_base_variable = "{" . "service_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'service_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'start_timestamp'}) {
        my $_base_variable = "{" . "start_timestamp" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'start_timestamp'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(token )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('OriginInspector', $response);
    return $_response_object;
}

1;
