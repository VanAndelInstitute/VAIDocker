#!/usr/bin/perl
use Cwd 'abs_path';
use File::Basename;

my $EXECPATH = abs_path(dirname(__FILE__));
my $dockerFile = do{local(@ARGV,$/)="$EXECPATH/Dockerfile";<>};
$SIG{INT} = \&tsktsk;
$start = shift @ARGV || 1;
$end = shift @ARGV || 254;

#test if git repo is up to date

chdir($EXECPATH);
$gitOutput =  `git fetch --dry-run;git diff Dockerfile`;
chomp $gitOutput;
die "This git repo is not up to date, please push any local to master, or pull/fetch any changes from remote\n" if $gitOutput;

$dockerFile =~ s/\\\n/ /g;
print STDERR "running yum install of following:\n";
my @commands;
while ($dockerFile =~ /(yum\s+install\s.+?)(\n|\&)/gm)
{
	push @commands, $1;
}

for my $n ($start..$end)
{
	my $ip = "10.152.223.$n";
	runcmd("ssh root\@$ip \"" . join(";",@commands) . "\"" );
}


sub tsktsk {
      $SIG{INT} = \&tsktsk;           # See ``Writing A Signal Handler''
      exit 0;
}
sub runcmd{
	my $date = `date`;
	chomp $date;
        my $cmd=shift @_;
        my $caller=(caller(1))[3];
        print STDERR "$date\t$caller\t$cmd\n";
	system($cmd);
}
