m1 = readtable('/home/daniel/Documentos/Algoritmos/Ejercicio/ex.xlsx', 'RANGE', 'B3:B100');
m2 = readtable('/home/daniel/Documentos/Algoritmos/Ejercicio/ex.xlsx', 'RANGE', 'C3:C100');
t = table2array( readtable('/home/daniel/Documentos/Algoritmos/Ejercicio/ex.xlsx', 'RANGE', 'A3:A100') );

m1 = table2array( m1 );
m2 = table2array( m2 );



nm1 = length(m1)
nm2 = length(m2)

fs = 1;
t = 1/fs;

y1 = fft(m1);
y2 = fft(m2);

f = (0:nm1-1)*(fs/nm1);

plot(f, y1 );
hold on;
plot(t, m1 );
%plot(f, abs(y2) );

% n = length(x);
% fs = 0.003;
% dt = 1/fs;
% t = (0:n-1)/fs;
% y = fft(x)
% %abs(y);
% %(abs(y).^2)/n;
% f = (0:n-1)*(fs/n);
% plot(f, abs(y) )