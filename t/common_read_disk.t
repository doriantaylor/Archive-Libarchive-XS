use strict;
use warnings;
use Test::More tests => 5;
use Archive::Libarchive::XS qw( :all );

my $r;

my $a = archive_read_disk_new();
ok $a, 'archive_read_disk_new';

my $gname = archive_read_disk_gname($a, 42);
is $gname, undef, 'archive_read_disk_gname';

my $uname = archive_read_disk_uname($a, 42);
is $uname, undef, 'archive_read_disk_uname';

$r = archive_read_close($a);
is $r, ARCHIVE_OK, 'archive_read_close';

$r = archive_read_free($a);
is $r, ARCHIVE_OK, 'archive_read_free';
