program baba;

var
    n : real;
   ent : array[0..10] of integer;
function saisie : real;
var 
    nombre : real;
begin
    repeat
        writeln('Saisir un nombre compris entre 0 et 1 milliard');
        readln(nombre);
        writeln(nombre);
    until((nombre < 1000000000) and (nombre >= 0));
    saisie := nombre;
end;

procedure Decoupage(nombre : real; var int : array of integer) ;
var 
    i : integer;
    entier : Int64;
begin
	entier := trunc(nombre*100);
	writeln(entier);
	i := 10;
	repeat
        int[i] := entier mod 10;
        entier := entier div 10;
        i := i-1;
	until (entier = 0);
end;

procedure affichage(var ent : array of integer);
var
    i : integer;
begin 
	for i:= 0 to 10 do
        write(ent[i]);
end;

begin
    n := saisie();
    writeln(n);
    Decoupage(n, ent);
    affichage(ent);
end.