sub mergesort {
    mergesort_recursivo ($_[0], 0, $#{ $_[0] });  # Recibimos una referencia a un array
}
 
sub mergesort_recursivo {
    my ( $array, $primero, $ultimo ) = @_;
 
    if ( $ultimo > $primero ) {
        local $^W = 0;              # Quitamos el aviso de exceso de recursión
 
        my $mitad = int(( $ultimo + $primero ) / 2);
        mergesort_recursivo( $array, $primero, $mitad );
        mergesort_recursivo( $array, $mitad + 1, $ultimo );
        merge( $array, $primero, $mitad, $ultimo );
    }
}
 
my @work; # Una variable global.
 
sub merge {
    my ( $array, $primero, $mitad, $ultimo ) = @_;
    my $n = $ultimo - $primero + 1;
 
    # Inicializa @work con elementos importantes del array
    for ( my $i = $primero, my $j = 0; $i <= $ultimo; ) {
        $work[ $j++ ] = $array->[ $i++ ];
    }
 
    # Ahora hace la verdadera mezcla. Atraviesa el array
    # y copia los elementos en orden inverso al array original
    # $i es el índice del resultado de la mezcla, $j es el índice en
    # la primera mitad de la copia de trabajo, $k el índice de la segunda mitad.
 
    $mitad = int(($primero + $ultimo) / 2) if $mitad > $ultimo;
    my $n1 = $mitad - $primero + 1;      # El tamaño de la primera mitad.
 
    for ( my $i = $primero, my $j = 0, my $k = $n1;
          $i <= $ultimo;
          $i++ ) {
 
            $array->[ $i ] =
                              $j < $n1
                           &&
                              ( $k == $n || $work[ $j ] < $work[ $k ] ) 
                              ? $work[ $j++ ]
                              : $work[ $k++ ]
                           ;
    }
}