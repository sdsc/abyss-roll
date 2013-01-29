#!/usr/bin/perl -w
# abyss roll installation test.  Usage:
# abyss.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/abyss';
my $output;

my $TESTFILE = 'tmpabyss';

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
if test -f /etc/profile.d/modules.sh; then
  . /etc/profile.d/modules.sh
  module load gnu ROLLMPI_ROLLNETWORK abyss
fi
mkdir $TESTFILE.dir
cd $TESTFILE.dir
wget --no-check-certificate https://raw.github.com/dzerbino/velvet/master/data/test_reads.fa
abyss-pe k=25 name=test se=test_reads.fa
abyss-fac test-se-contigs.fa
END
close(OUT);

# abyss-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'abyss installed');
} else {
  ok(! $isInstalled, 'abyss not installed');
}
SKIP: {

  skip 'abyss not installed', 4 if ! $isInstalled;
  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  like($output, qr/1\s+1\s+1\s+99889\s+99889\s+99889\s+99889\s+99889\s+99889/,
       'abyss test run');

  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/abyss/[0-9]* 2>&1`;
  ok($? == 0, 'abyss module installed');
  `/bin/ls /opt/modulefiles/applications/abyss/.version.[0-9]* 2>&1`;
  ok($? == 0, 'abyss version module installed');
  ok(-l '/opt/modulefiles/applications/abyss/.version',
     'abyss version module link created');

}

`rm -fr $TESTFILE*`;
