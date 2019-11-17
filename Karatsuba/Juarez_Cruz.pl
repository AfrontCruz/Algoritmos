#Author: Juárez Cruz Oscar Daniel


print "Inserta el primer número:\n";
my $x = "" + <>;
print "Inserta el segundo número:\n";
my $y = "" + <>;

my $r = karatsuba($x, $y);
print "\n\nResultado: $r\n\n";

#print "La longitud de x: ", length($x), "\n";
#print "La longitud de y: ", length($y), "\n";

#my $a = substr($x, 0, $lx/2);  
#my $b = substr($x, $lx/2, $lx - 1 );
#my $c = substr($y, 0, $ly/2 );
#my $d = substr($y, $ly/2, $ly - 1 );

#print "a = $a\n";
#print "b = $b\n";
#print "c = $c\n";
#print "d = $d\n";

#my $ac = multiplicar($a, $c);
#my $bd = multiplicar($b, $d);
#my $opt = multiplicar( ($a+$b), ($c+$d)) - $ac - $bd;

#my $ceros = "";
#for( my $i = 0; $i < 4; $i++){
#	$ceros = $ceros."0";
#}

#print "Paso 1: ac*10'4 = ",$ac.$ceros,"\n";
#print "Paso 2: bd = ", $bd, "\n";
#print "Paso 3: (a+b)(c+d)-ac-bd = ", $opt."00", "\n";

sub karatsuba{
	my( $a, $b) = @_;
	print "\nMult: $a * $b\n";
	if( length($a) == 1){
		return multiplicar($a, $b);
	}
	if(  length($b) == 1){
		return multiplicar($a, $b);
	}
	my $la = length($a);
	my $lb = length($b);
	my $a1 = substr($a, 0, $la/2);  
	my $a2 = substr($a, $la/2, $la - 1);
	my $b1 = substr($b, 0, $lb/2);  
	my $b2 = substr($b, $lb/2, $lb - 1);
	my $z0 = karatsuba($a2, $b2);
	my $z2 = karatsuba($a1, $a1);
	my $z1 = karatsuba($a1 + $a2,$b1 + $b2) - $z0 - $z2;
	my $z = $z2.generadorCero(2**($la/2));
	my $aux = $z1.generadorCero($la/2);
	#print "Moment $z $aux $z0\n\n";
	$z = $z + $aux + $z0;
	return $z;

}

sub generadorCero{
	my( $n ) = @_;
	my $ceros = "";
	for( my $i = 0; $i < $n; $i++){
		$ceros = $ceros."0";
	}
	return $ceros;
}

sub multiplicar{
	my($a, $b) = @_;
	return $a*$b;
}