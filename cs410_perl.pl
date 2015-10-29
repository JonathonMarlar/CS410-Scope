#!/usr/bin/perl -w

# Jonathon Cole Marlar
# Due: 29 October 2015
# Assignment: Chapter 5 Scope
# This program tests how scoping can affect variables and their meanings in
# subroutine calls.

$var = 10;

# This function uses 'local', which makes the variable inherited throughout any
# function call made in usinglocal.
sub usinglocal
{
	local $var = 25;
	print "var is $var\n";
	&addten;
}

# usingmy, on the other hand, uses 'my', which means the variable is actually
# only for the usingmy block.
sub usingmy
{
	my $var = 25;
	print "var is $var\n";
	&addten;
}

# A simple function to add ten to var
sub addten
{
	my $var = $var + 10;
	print "var is $var\n"
}

# Calling the various functions to show scope
&usinglocal;
&usingmy;
print "var is $var\n";

# This is a function similar to the sample function given on page 220
sub bigfunc
{
	sub func1
	{
		print "X is... $x\n";
		local $x = 10;			# The $x passed in is changed from 3 to 10
		print "X is... $x\n";
	}

	sub func2
	{
		my $y = $x;				# $y will be 3.
		my $z = 3;
		print "X is... $x\n";
		print "Y is... $y\n";
		print "Z is... $z\n";
	}
	
	local $x = 3;
	print "X is... $x\n";

	&func1;
	&func2;
}

&bigfunc;

# Sources:
# http://perldoc.perl.org/functions/local.html
# http://perldoc.perl.org/perlsub.html#Temporary-Values-via-local()