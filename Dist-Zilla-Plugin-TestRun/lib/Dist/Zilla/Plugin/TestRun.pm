package Dist::Zilla::Plugin::TestRun;

use Moose;

our $VERSION = '0.0.1';

with
(
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

__END__

=pod

=encoding utf8

=head1 NAME

Dist::Zilla::Plugin::TestRun - run ./Build runtest on the build distribution

=head1 SYNOPSIS

In the dist.ini:

    [ModuleBuild]
    mb_class = Test::Run::Builder
    [TestRun]

    ; Optionally
    [@Basic]
    -remove = MBTestRunner

Put C<inc/Test/Run/Builder.pm> in the repository.

From the commnd line

    $ dzil runtest
    $ dzil runtest --release

=head1 VERSION

version 0.0.1

=head1 SUBROUTINES/METHODS

=head2 test()

Needed by L<Dist::Zilla> .

