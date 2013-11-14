package inc::SeeAlso;

use Moose;
use v5.10;
with 'Dist::Zilla::Role::FileMunger';

sub munge_files
{
  my($self) = @_;
  
  my($file) = grep { $_->name eq 'lib/Archive/Libarchive/XS.pm' } @{ $self->zilla->files };
  
  $self->zilla->log_fatal("could not find XS.pm")
    unless $file;
  
  state $data;
  unless(defined $data)
  {
    local $/;
    $data = <DATA>;
  }
  
  $file->content($file->content . $data);
}

1;

__DATA__

=head1 SEE ALSO

The intent of this module is to provide a low level fairly thin direct
interface to libarchive, on which a more Perlish OO layer could easily
be written.

=over 4

=item L<Archive::Libarchive::XS>

=item L<Archive::Libarchive::FFI>

Both of these provide the same API to libarchive via L<Alien::Libarchive>,
but the bindings are implemented in XS for one and via L<FFI::Sweet> for
the other.

=item L<Archive::Libarchive::Any>

Offers whichever is available, either the XS or FFI version.

=item L<Archive::Peek::Libarchive>

=item L<Archive::Extract::Libarchive>

Both of these provide a higher level perlish interface to libarchive.

=back

=cut
