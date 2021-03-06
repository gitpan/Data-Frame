package Tie::IxHash::Extension;
$Tie::IxHash::Extension::VERSION = '0.003';
use strict;
use warnings;
use List::AllUtils;

{
package Tie::IxHash;
$Tie::IxHash::VERSION = '0.003';
use constant ERROR_KEY_LENGTH_MISMATCH => "incorrect number of keys";

sub RenameKeys {
	my ($self, @names) = @_;
	die ERROR_KEY_LENGTH_MISMATCH if @names != $self->Length;
	my @values = $self->Values;
	my @new_kv = List::AllUtils::mesh( @names, @values );
	$self->Splice(0, $self->Length, @new_kv);
}


}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Tie::IxHash::Extension

=head1 VERSION

version 0.003

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
