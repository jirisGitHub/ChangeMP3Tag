#!/usr/bin/perl
$|++;
use strict;
use warnings;
use MP3::Tag;
 

opendir my $dir, "./" or die "Cannot open directory: $!";
my @files = readdir $dir;
print "Měním mp3 tagy"."\n";
my $filename='';

my @spl;
foreach ( @files ) {
   $filename= $_;
   my $ext1 = substr($filename, -3); # extension - posledni 3 znaky 
   my $iname = substr($filename, 0, -4);  # jmeno bez extension, bez poslednich 4 znaku
   if ($ext1 eq 'mp3') {
	   print "soubor:". $filename . "\n";
      my $mp3 = MP3::Tag->new($filename);
      MP3::Tag->config(write_v24 => 1);

      $mp3->title_set($iname); 
      $mp3->update_tags();       
      my $title = $mp3->title();
      print ("Title is: ".$title."\n" );
   }


}

closedir $dir;




