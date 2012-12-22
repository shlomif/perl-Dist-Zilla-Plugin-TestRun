package Dist::Zilla::App::Command::runtest;

use strict;
use warnings;

use 5.014;

our $VERSION = '0.0.1';

use Dist::Zilla::App -command;

use Dist::Zilla::Plugin::TestRun;

sub abstract    { return "use Test:Run::Builder's runtest command." }
sub description { return "use Test:Run::Builder's runtest command." }
sub usage_desc  { '%c %o' }

sub opt_spec {
    [ 'release'   => 'enables the RELEASE_TESTING env variable', { default => 0 } ],
    [ 'automated' => 'enables the AUTOMATED_TESTING env variable', { default => 0 } ],
    [ 'author!' => 'enables the AUTHOR_TESTING env variable (default behavior)', { default => 1 } ],
    [ 'all' => 'enables the RELEASE_TESTING, AUTOMATED_TESTING and AUTHOR_TESTING env variables', { default => 0 } ]
}


sub execute {
    my ($self, $opt, $arg) = @_;

    local $ENV{RELEASE_TESTING} = 1 if $opt->release or $opt->all;
    local $ENV{AUTHOR_TESTING} = 1 if $opt->author or $opt->all;
    local $ENV{AUTOMATED_TESTING} = 1 if $opt->automated or $opt->all;

    $self->zilla->test;
}

1;

