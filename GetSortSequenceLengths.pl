#!/usr/bin/perl -w

# Written by Alejandro Reyes
# Receives a multi-Fasta File and returns the sequence name and its length
#
# Usage: GetSortSequenceLengths.pl "Names_list" "Fasta_File" > "output"
#
# Input: One Fasta formated file with multiple sequences and a header to name the output sort and length files
# Output: Two files, the first a fasta file with the sequences sorted by length and the second a tab delimited file with the name and length for each sequence from the input file
# Note:
# Created: Feb 27 2013.
# Last-updated: Sept 06 2015

use strict;

if (@ARGV != 2) {
	die "\nUsage: GetSortSequenceLengths.pl <FastaFile> <header>\n\n";
}


#Reads the Fasta Sequences

my $file = shift @ARGV;
my $head = shift @ARGV;
open (IN, "<$file") or die ("Couldn't open file: $file\n");

my %seqs=();
my %len=();
my $name="";
while (my $line=<IN>){
  chomp $line;
  next unless ($line =~ /\S+/);
  if ($line =~ /^>(\S+)/){
    $name=$1;
  }else{
    $seqs{$name}.=uc($line);
    $len{$name}=length($seqs{$name});
  }
}
close IN;

my @sortKeys = sort {$len{$b} <=> $len{$a}} keys %len;

open (SEQ, ">$head\_sort.fna") or die ("Couldn't open file: $head\_sort.fna\n");
open (LEN, ">$head\_len.txt") or die ("Couldn't open file: $head\_len.txt\n");

for (my $i=0; $i<@sortKeys; $i++){
  print LEN "$sortKeys[$i]\t$len{$sortKeys[$i]}\n";
  print SEQ ">$sortKeys[$i]\n$seqs{$sortKeys[$i]}\n";
}
close LEN;
close SEQ;
