#!/usr/bin/perl

# ---   *   ---   *   ---
# deps

  use POSIX qw(strftime);

  use lib glob "~/bin/rt";
  use rt_temp;

# ---   *   ---   *   ---
# coode

do {
  my @t=localtime;
  my $d=strftime("%a %d, %T",@t);
  my $c=rt_temp::cpu;

  my $s="| $d | $c |";
  `xsetroot -name \'$s\'`;

  sleep 1;
} until(0);

# ---   *   ---   *   ---
