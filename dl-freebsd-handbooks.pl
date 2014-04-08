#!/usr/bin/env perl

my $u = "ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books";
my %d = (
  "faq" => "FAQ",
  "handbook" => "Handbook",
  "porters-handbook" => "Porters Handbook",
  "developers-handbook" => "Developers Handbook",
  "arch-handbook" => "Architecture Handbook",
);

sub run {
  for (@_) {
    print ":: $_\n";
    system $_;
    print "\n";
  }
}

for (sort keys %d) {
  run "wget $u/$_/book.pdf.zip";
  run "unzip book.pdf.zip";
  run "mv book.pdf 'FreeBSD $d{$_}.pdf'";
  run "rm book.pdf.zip";
}

