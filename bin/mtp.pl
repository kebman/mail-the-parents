#!/usr/bin/perl
use strict;
use warnings;
# Read list of pupils and sort for parents
# This project is made for short lists in small files only, and is not meant for iteration of a large amount of data

### FILE HANDLING AND STORING IN MEMORY ###

# variables regarding files to be compared
my $parents = "parents.csv";
my $pupils = "pupils.csv";
my $dates = "dates.csv";
my $fh; # file handle
my @parents; # array to hold contents of the file regarding the parents
my @pupils; # array to hold contents of the file regarding the pupils
my @dates;

# open CSV files 
open ($fh, "<", $parents) or die $!;
while (<$fh>) {
	push(@parents, $_); # and store lines in arrays so we can compare the contents later
}
close $fh;

open ($fh, "<", $pupils) or die $!;
while (<$fh>) {
	push(@pupils, $_); 
}
close $fh;

open ($fh, "<", $dates) or die $!;
while (<$fh>) {
	push(@dates, $_); 
}
close $fh;


### HANDLING OF CONTENT AND PRINTING IT OUT ###

# variables regarding contents

my $date = "23. januar 2014";

my @puLine; # array to temporarily hold each line of the pupil-info file, one by one
my @paLine; # array to temporarily hold each line of the parents-info file, one by one
my $pupilID = 1; # iterator

my @altAddress; # Alternative address (usually we'll get the pupil's address, but we may not always get the parents')
my $message; # or the letter, if you will
my $sex; # whether male, female or ... other
my @names; # ready to receive forename and surname

# roll up dates in a multi-dimensional array 
# (Yeah, probably what I should've done with the rest of the data too...)
# 0: Pupil ID Reference
# 1: Date
# 2: Time
my @dateLine;
my @dateArray;
my $i = 0;
my $j = 0;
foreach (@dates) {
	@dateLine = split(";", $_);
	foreach (@dateLine) {
		push @{$dateArray[$i]}, $dateLine[$j];
		$j++;
	}
	$j = 0;
	$i++;
}

#foreach (@dates) {
#	@dateLine = split(";", $_);
#}
my $callInDate;
my $callInTime;

# find parents of pupil

# Iterating trough each pupil
# 0: ID
# 1: Name
# 2: Address
# 3: PO Code and city
# 4: Sex
foreach (@pupils) {
	@puLine = split(";", $_); # split each line into an array (change to comma instead of semi-colon as necessary)
	@names = split(", ", $puLine[1]); # split combined string forename and surname into two indices
	print $puLine[1]."\n";
	
	# determining sex
	if ($puLine[4] eq "f") {
		$sex = "daughter";
	} else {
		$sex = "son";
	} 

	# Iterating trough each parents, for each pupil
	# 0: ID
	# 1: Name
	# 2: Address
	# 3: PO Code and City
	# 4: Telephone
	# 5: Mobile Telephone
	# 6: E-Mail
	# 7: Sex
	# 8: Pupil ID Reference
	foreach(@parents) {
		@paLine = split(";", $_);
		if ($paLine[8] == $pupilID) {
			print "\n~~~NEW MESSAGE~~~\n\n";
			print "Your School Name\nYour School Address\t\t\t\t\t\tDato\nYour School PO Code and City\t\t\t\t\t${date}\n\n\n";
			print $paLine[1]."\n";

			if ($paLine[2] eq "ADR") { # In case there is no address...
				# ...make one from the list of pupils
				@altAddress = split(";", $pupils[$pupilID]);
				print $altAddress[2]."\n"; # pupil's address
				print $altAddress[3];
			} else {
				print $paLine[2]."\n";
				print $paLine[3];
			}
			$callInDate = $dateArray[$pupilID-1][1];
			$callInTime = $dateArray[$pupilID-1][2];
			$message = <<EOF;




INVITATION TO MEETING
Your $sex, $names[1], is called for conversation at $callInTime on$callInDate, and I would be pleased if you can come too. 

If you have any questions, please don't hesitate to call.



Kind Regards,


Your Titel/Name
Teaching Position
Etc... Change as you like
EOF
			print $message;
		}
	}
	print "\n";
	$pupilID++;

}
