open FILE, "<", "customblock" or die "Couldn't open file: $!";
#binmode FILE;

$a='auth-zones=';

while (my $line = <FILE>) {
    if ($line  =~ m/^[^#]*$/ && $line =~ m/\w+/) {
	$line =~ s/^\s+|\s+$//g;
	print q(zone ") . $line . q(" {
    type master;
    file "/etc/powerdns/bind/dummy-block";
    allow-update {none;};
};

);
    }
}
close FILE;
