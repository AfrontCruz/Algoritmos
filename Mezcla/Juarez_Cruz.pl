#Author: Juárez Cruz Oscar Daniel

my @array_aux;

sub ordenar {
	my ($array, $prim, $num) = @_;
    ordenar_r ($array, 0, $num);
}

sub ordenar_r {
    my ( $array, $primero, $ultimo ) = @_;
 
    if ( $ultimo > $primero ) {
        #local $^W = 0;              
        my $mitad = int(( $ultimo + $primero ) / 2);
        ordenar_r( $array, $primero, $mitad );
        ordenar_r( $array, $mitad + 1, $ultimo );
        mezclar( $array, $primero, $mitad, $ultimo );
    }
}

sub mezclar {
    my ( $array, $primero, $mitad, $ultimo ) = @_;
    my $n = $ultimo - $primero + 1;
 
    for ( my $i = $primero, my $j = 0; $i <= $ultimo; ) {
        $array_aux[ $j++ ] = $array->[ $i++ ];
    }
 
    $mitad = int( ($primero + $ultimo) / 2 ) if $mitad > $ultimo;
    my $n1 = $mitad - $primero + 1;      # El tamaño de la primera mitad.
 
    for ( my $i = $primero, my $j = 0, my $k = $n1; $i <= $ultimo; $i++ ) {
            $array->[ $i ] = 
            $j < $n1 && ( $k == $n || $array_aux[ $j ] < $array_aux[ $k ] ) 
            ? $array_aux[ $j++ ]: $array_aux[ $k++ ];
    }

	print "\n";
}

print "¿Cuántos números quieres ordenar?\n";
my $num = <>;
my $array = ();

srand();

for( my $i = 0; $i < $num; $i++){
	push @array, sprintf("%i", rand(1) * 20);
}

for $j(1..$num){
	print "$array[$j-1]  ";
}

ordenar( $array, 0, $num );
print "\nOrdenado\n";

for $j(1..$num){
	print "$array_aux[$j-1]  ";
}

print "\n";