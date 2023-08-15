#!/usr/bin/perl


$mounts = `mount | grep \"tmpfs on /tmp type\"`;
$mounts =~ /tmpfs \((.+)\)$/;
exit unless $1;
$mountArgs = $1;
$mountArgs =~ s/noexec/exec/g;
system "mount -o remount -o$mountArgs /tmp";
print STDERR  "mount -o remount -o$mountArgs /tmp\n";




