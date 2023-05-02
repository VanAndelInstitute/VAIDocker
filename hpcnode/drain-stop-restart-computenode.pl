#!/usr/bin/perl
#ZR
# this will restart a particular containerized compute node, it will detect which server its running on and restart the particular service
use Cwd 'abs_path';
use File::Basename;

my $EXECPATH = abs_path(dirname(__FILE__));
my $dockerFile = do{local(@ARGV,$/)="$EXECPATH/Dockerfile";<>};
$SIG{INT} = \&tsktsk;
$compute = shift @ARGV || die "specify a compute node to drain and restart";;

my $baremetal = `grep -l $compute $EXECPATH/server*yml`;
chomp $baremetal;
$baremetal =~ /(server\d\d\d)/ || die "could not determine bare metal docker server";
$baremetal = $1;

print STDERR "restarting (25 sec)\n";
runcmd("ssh $compute scontrol update nodename=$compute state=DRAIN reason=\"reload-docker\"");
sleep 3;
print STDERR "(22 sec)\n";
runcmd("ssh $baremetal \"cd /varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode;  docker-compose -f $baremetal-docker-compose.yml rm -f -s $compute \"" );
sleep 3;
print STDERR "(20 sec)\n";
runcmd("ssh $baremetal \"cd /varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode;  docker-compose -f $baremetal-docker-compose.yml up -d $compute \"" );
sleep 20;
print STDERR "(1 sec)\n";
runcmd("ssh $compute scontrol update nodename=$compute state=resume");

print STDERR "$barematal:$compute has been restarted and resumed\n";
#test if git repo is up to date

sub runcmd{
	my $date = `date`;
	chomp $date;
        my $cmd=shift @_;
        my $caller=(caller(1))[3];
        print STDERR "$date\t$caller\t$cmd\n";
	system($cmd);
}
