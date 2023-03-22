#!/usr/bin/perl
#
$SIG{INT} = \&tsktsk;

$start = shift @ARGV || 5;
$end = shift @ARGV || 5;
sub tsktsk {
      $SIG{INT} = \&tsktsk;           # See ``Writing A Signal Handler''
      exit 0;
        }

for my $n ($start..$end)
{
    $n = "00$n" if ($n <= 9);
    $n = "0$n" if ($n >= 10 && $n < 100);
     next if system("ping -c 1 -W .1  compute$n");

	print STDERR "compute$n:\n";
	system("ssh root\@compute$n \"" . join(" ",@ARGV) . "\"" );
	print  "\n";
	sleep 1;
}

