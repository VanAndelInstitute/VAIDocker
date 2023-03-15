#!/usr/bin/perl
use Cwd 'abs_path';
use File::Basename;

my $EXECPATH = abs_path(dirname(__FILE__));
my $dockerFile = do{local(@ARGV,$/)="$EXECPATH/Dockerfile";<>};

#test if git repo is up to date

chdir($EXECPATH);
$gitOutput =  `git fetch --dry-run`;
chomp $gitOutput;
die "This git repo is not up to date, please pull/fetch any changes from remote\n" if $gitOutput;

$dockerFile =~ s/\\\n/ /g;
print STDERR "running yum install of following:\n";
while ($dockerFile =~ /(yum\s+install\s.+?)(\n|\&)/gm)
{
	print "\t$1\n";

}



exit;
$SIG{INT} = \&tsktsk;

$start = shift @ARGV || 1;
$end = shift @ARGV || 254;

for my $n ($start..$end)
{
    $n = "00$n" if ($n <= 9);
    $n = "0$n" if ($n >= 10 && $n < 100);

	print STDERR "compute$n:\n";
	system("ssh root\@compute$n \"" . join(" ",@ARGV) . "\"" );
	print  "\n";
	sleep 1;
}


sub tsktsk {
      $SIG{INT} = \&tsktsk;           # See ``Writing A Signal Handler''
      exit 0;
}
