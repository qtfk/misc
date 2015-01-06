#!/usr/bin/env perl

my $l = 'en_US.ISO8859-1';
my $u = "ftp://ftp.freebsd.org/pub/FreeBSD/doc/$l/books";
my %d = (
  'faq' => 'FAQ',
  'handbook' => 'Handbook',
  'porters-handbook' => 'Porters Handbook',
  'developers-handbook' => 'Developers Handbook',
  'arch-handbook' => 'Architecture Handbook',
);

sub run {
  for (@_) {
    print ":: $_\n";
    system $_;
    print "\n";
  }
}

for (sort keys %d) {
  run(
    "wget $u/$_/book.pdf.zip",
    "unzip book.pdf.zip",
    "mv book.pdf 'FreeBSD $d{$_}.pdf'",
    "rm book.pdf.zip",
  );
}

