package Dist::Zilla::Plugin::TestRun;

use Moose;

our $VERSION = '0.0.1';

with(
    'Dist::Zilla::Role::TestRunner',
);

sub test
{
    my ($self, $target) = @_;

    my $cmd = 'runtest';
    my @testing = $self->zilla->logger->get_debug ? '--verbose' : ();

    system $^X, 'Build', $cmd, @testing and die "error running $^X Build $cmd\n";
}

1;

