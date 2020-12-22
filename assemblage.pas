program assemblou;

var
    let : array[0..10] of string;
    centimes, unites, euros, milliers, millions : string;
    i : integer;
    
// Assemblage
// Assemble les chaånes du tableau pour obtenir les chaånes Ö afficher
// IN : le tableau contenant les chaånes qui correspondent aux chiffres du nombre  saisi pas l'utilisateur
// OUT :  millions = chaåne qui correspond aux millions
 // milliers = chaåne qui correspond aux milliers
 // unites = chaåne qui correspond aux unites
 // euros = prend les valeurs 'euros', 'euro' ou '' selon les cas
// centimes = chaåne qui correspond aux centimes
procedure Assemblage(var let : array of string ; var  millions, milliers, unites, euros, centimes: string);
    
begin
    millions := concat(let[0], let[1]);
    millions := concat(millions, let[2]);           // assemble le triplet
    if millions = 'un ' 
        then millions := 'un million '
    else if millions <> '' 
        then millions := concat(millions, 'millions ');
    milliers := concat(let[3], let[4]);
    milliers := concat(milliers, let[5]);            // assemble le triplet
    if milliers = 'un ' 
        then milliers := 'mille '
    else if milliers <> '' 
        then milliers := concat(milliers, 'mille ');
    unites := concat(let[6], let[7]);
    unites := concat(unites, let[8]);                // assemble le triplet, pas besoin de faire autre chose pour unites
    euros := 'euros ' ;                                    // cas le plus frÇquent
    if (milliers = '') and (millions = '') then
    begin
        if unites = 'un ' then
            euros := 'euro '
        else if unites = '' then
            euros := 'zero euro';
    end;
    centimes := concat(let[9], let[10]);         // assemble le couple
    if centimes = 'un '
        then centimes := 'et un centime'
    else if centimes <> '' then
    begin
    	centimes := concat('et ', centimes);
    	centimes := concat(centimes, 'centimes');
    end;
end;

begin
    for i := 0 to 10 do
        readln(let[i]);
	Assemblage(let, millions, milliers, unites, euros, centimes);
	writeln(millions, milliers, unites, euros, centimes);
end.