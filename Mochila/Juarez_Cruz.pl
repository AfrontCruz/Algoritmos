#Author Eder López - Daniel Juárez

my $filename = 'datos.txt';
open INFILE,$filename;

my $linea;
my @nombres;
my @pesos;
my @valores;
my @factores;

while ( $linea = <INFILE>) {
    chomp($linea); 
    my $aux;
    @array = split(",", $linea);
    #print $linea . "\n";
    my $aux = @array[1];
    push( @nombres, @array[0] );
    push( @pesos, @array[1] );
    push( @valores, @array[2] );
    if( index( $aux, "M" ) != -1 ){
    	chop($aux);
    	#print $aux . "\n";
    	push(@factores, ( @array[2] / ( $aux / 1000 ) ) );
    }
    elsif( index( $aux, "G" ) != -1 ){
    	chop($aux);
    	push(@factores, @array[2]/$aux );
    }
    else {
    	chop($aux);
    	push(@factores, @array[2]/($aux*1000) );
    }
}

$s = scalar( @nombres );


#for (my $var = 0; $var < $s; $var++) {
#	print @nombres[$var] . " " . @pesos[$var] . " " . @valores[$var] . " " . @factores[$var] ."\n";
#}

for (my $i = 1; $i < $s ; $i++) {
	for (my $j = 0; $j < $s - 1; $j++) {
		if( @factores[$j] <= @factores[$j+1] ){
			my $aux = @factores[$j + 1];
			@factores[$j+1] = @factores[$j];
			@factores[$j] = $aux;
			$aux = @nombres[$j + 1];
			@nombres[$j+1] = @nombres[$j];
			@nombres[$j] = $aux;
			$aux = @valores[$j + 1];
			@valores[$j+1] = @valores[$j];
			@valores[$j] = $aux;
			$aux = @pesos[$j + 1];
			@pesos[$j+1] = @pesos[$j];
			@pesos[$j] = $aux;
		}
	}
}

print "\n\n\nOrdenados\n\n";

for (my $var = 0; $var < $s; $var++) {
	print @nombres[$var] . " " . @pesos[$var] . " " . @valores[$var] . " " . @factores[$var] ."\n";
}


print "\n\n\nInserta el peso maximo\n";
my $x = <STDIN>;


#print $x . " el valor de x \n";

if( index( $x, "M" ) != -1 ){
	chop($x);
	$x = $x/1000;
}
elsif( index( $x, "G" ) != -1 ){
	chop($x);
}
else {
	chop($x);
	$x = $x * 1000;
}

my @indices;

my $actual = $x;

print "\n\nLista de archivos RESPALDADOS\n";

my $total = 0;

for (my $var = 0; $var < $s; $var++) {
	my $x = @pesos[$var];
	if( index( $x, "M" ) != -1 ){
		chop($x);
		$x = $x/1000;
	}
	elsif( index( $x, "G" ) != -1 ){
		chop($x);
	}

	else {
		chop($x);
		$x = $x * 1000;
	}

	#print "X = " . $x . " actual = " . $actual . "\n";
	if( $x < $actual ){
		push(@indices, $var);
		$actual = $actual - $x;
		$total = $total + @valores[$var];
	}
}

for (my $var = 0; $var < scalar(@indices); $var++) {
	print @nombres[@indices[$var]] . " " . @pesos[@indices[$var]] . " " . @valores[@indices[$var]] . "\n";
}

print "Total respaldado: " . ($x - $actual) . "GB 	- 	Total Valor: \$" . $total . "\n";

close INFILE;
