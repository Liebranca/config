#!/usr/bin/env perl


# ---   *   ---   *   ---
# deps

package rt_temp;

  use v5.36.0;
  use strict;
  use warnings;

  use English qw(-no_match_vars);

# ---   *   ---   *   ---
# get temps

sub cpu {

  state $info_re = qr{[^:]+:.+};
  state $num_re  = qr{[^\d\.]};
  state $strip   = qr{^\s*|\s*$};

  # get "key : value" as [key => value]
  my @lines = split "\n",`sensors`;
     @lines = grep {$ARG=~ $info_re} @lines;

  my %tab   = map {split ':',$ARG} @lines;

  # ^clean strings
  my $c =  $tab{Tctl};
     $c =~ s[$strip][]g;
     $c =~ s[$num_re][]g;

  my $g =  $tab{edge};
     $g =~ s[$strip][]g;
     $g =~ s[$num_re][]g;


  return "$g GT | $c CT";

};

# ---   *   ---   *   ---
# ^get updates in tty

sub cpu_motor {

  use Time::HiRes qw(usleep);

  while(1) {
    print "\e[999H",cpu();
    usleep 100000;

  };

};

# ---   *   ---   *   ---
# duuud

sub import($class,@args) {

  map {
    my $f=$ARG;
    $class->$f

  } @args;

};

# ---   *   ---   *   ---
1; # ret
