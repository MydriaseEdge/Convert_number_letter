program leprog;

var
    nombre : real;                                                                                                       // nombre saisi par l'utilisateur
    nbchaine : string;

// Saisie
// fonction de saisie du nombre à afficher, répète la saisie jusqu'à ce que l'utilisateur donne un nombre compris entre 0 et 1 milliard
// Retourne le nombre saisi
function Saisie : real;
var 
    nombre : real;
begin
    repeat
        writeln('Saisir un nombre compris entre 0 et 1 milliard');
        readln(nombre);
    until((nombre < 1000000000) and (nombre >= 0));
    saisie := nombre;
end;

procedure initab(var ent : array of integer);
var
    i : integer;
begin
    for i:= 0 to 10 do
        ent[i] := 0;
end;

//Decoupage
// permet de placer dans un tableau les chiffres (jusqu'aux centièmes) du nombre en entrée arrondi au centième
// IN : nombre = le nombre à découper
// OUT : ent = tableau qui stocke les chiffres de nombre
procedure Decoupage(nombre : real; var ent : array of integer) ;
var 
    i : integer;
    nbentier : Int64;
begin
	initab(ent);
	nbentier := round(nombre*100);    // on multiplie nombre par 100 pour faire passer les centièmes dans la partie entière et on arrondi à l'nbentier le plus proche (permet de règler les approximations dues au type réel)
	i := 10;
	repeat
        ent[i] := nbentier mod 10;
        nbentier := nbentier div 10;
        i := i-1;
	until (nbentier = 0);
end;


 procedure init_let (var  tab : array of string);          
 var i : integer;                                                  
  begin   
  	 for i :=0 to 10 do
        begin
        	tab[i] :=''
        end;	
  end;	
 //-------------------------------------------------------------------------------------------------------------------------------- Proc'dure d'initialisation de la table de r'f'rence des unit's
  procedure reference_unites (var  tab : array of string);                                                            // laisser l'espace . la fin des strings
  begin   
  	tab[0] := '';
  	tab[1] := 'un-';
  	tab[2] := 'deux-';
  	tab[3] := 'trois-';
  	tab[4] := 'quatre-';
  	tab[5] := 'cinq-';
  	tab[6] := 'six-';
  	tab[7] := 'sept-';
  	tab[8] := 'huit-';
  	tab[9] := 'neuf-';
  	tab[10] := 'dix-';                                                                                                    
  	tab[11] := 'onze-';
  	tab [12] := 'douze-';
  	tab[13] := 'treize-';
  	tab[14] := 'quatorze-';
  	tab[15] := 'quinze-';
  	tab[16] := 'seize-';
  	tab[17] := 'dix-sept-';
  	tab[18] := 'dix-huit-';
  	tab[19] := 'dix-neuf-';
  	
  end;	
  	
 //-------------------------------------------------------------------------------------------------------------------------------- Proc'dure d'initialisation de la table de r'f'rence des dizaines
 procedure reference_dizaines (var  tab : array of string);                                                            // laisser l'espace . la fin des strings
  begin   
  	tab[0] := '';
  	tab[1] := 'dix-';                                                                                                              
  	tab[2] := 'vingt-';
  	tab[3] := 'trente-';
  	tab[4] := 'quarante-';
  	tab[5] := 'cinquante-';
  	tab[6] := 'soixante-';
  	tab[7] := 'soixante-dix-';
  	tab[8] := 'quatre-vingt-';
  	tab[9] := 'quatre-vingt-dix-';
  	
  end;	
   //--------------------------------------------------------------------------------------------------------------------------------	 Proc'dure de conversion dans le cas d'une centaine
   procedure centaine (i : integer; var let : array of string ; var ent : array of integer; var refu : array of string); 	 
   begin
        if ent[i] <> 1 then                                                                                 
            begin
            	if ent[i] = 0 then                                                                          // si pas de centaine on met rien
                    begin
                        let[i] := '';
                    end
                else   
                    if ((i = 0) or (i = 6)) and (ent[i+1] = 0) and (ent[i+2] = 0) then
                    begin
                        let[i] := refu[ent[i]] + 'cents-';
                    end
                    else
                    begin
                    	let[i] := refu[ent[i]] + 'cent-';
                    end;
            end       
        else 
            begin
                let[i] := 'cent-';
            end;   
   end;
   //--------------------------------------------------------------------------------------------------------------------------------	 Proc'dure de conversion dans le cas d'une dizaine =! 1x , 7x; 9x
   procedure dizaine (i : integer; var let : array of string ; var ent : array of integer; var refd : array of string); 	 
   
    begin
    	if (ent[i] = 1) or (ent[i] = 7) or (ent[i] = 9) and ((ent[i+1] >= 1) and (ent[i+1] <= 6)) then
           begin
                ent[i] := ent[i]-1 ;
                ent[i+1] := ent[i+1]+10;
            end;
      	if (ent[i] = 8) and ((i = 1) or (i = 7) or (i = 9)) and (ent[i+1] = 0) then                                                                          
             begin
                let[i] := 'quatre-vingts ';
              end
        else   
            begin
                 let[i] := refd[ent[i]] ;
            end;

   end;
   
      //--------------------------------------------------------------------------------------------------------------------------------	 Proc'dure de conversion pour les unités
   procedure unite (i : integer; var let : array of string ; var ent : array of integer; var refu : array of string); 	 
   
    begin
        if (ent[i-1] >= 2) and (ent[i-1] <= 6) and (ent[i] = 1) then
            let[i] := 'et-un '
        else if (ent[i-1] = 6)  and (ent[i] = 11) then    
            let[i] := 'et-onze '
        else 
            let[i] := refu[ent[i]];
   end;
   
  //--------------------------------------------------------------------------------------------------------------------------------	 	
 procedure f_lettrification (var let : array of string ; var ent : array of integer; var refu : array of string; var  refd : array of string); 	 	
  	var
  	 i : integer;
       
    begin 	
  	 	  //*****************cas des centaines 	 	  	
  	 	  	i :=0;
  	 	  	while i <= 6 do
                begin
                	centaine (i,let,ent,refu) ;
                	i := i + 3;                                                                                         // on saute de 3 pour accrocher que les centaines de chaque triplet
                end;	
  	 	//*****************cas des dizaines (hors de la virgule)
            i := 1;
            while i <= 7 do
                begin
                    dizaine(i, let, ent, refd);
                	i := i + 3;                                                                                         // on saute de 3 pour accrocher que les dizaines de chaque triplet
                end;	
        //*****************cas des unités	 (hors de la virgule)
            i := 2;
            while i <= 8 do
            begin
                unite(i, let, ent, refu);
                i := i + 3;                                                                                             // on saute de 3 pour accrocher que les unités de chaque triplet
            end;
        //*****************cas des centimes     
  	 	dizaine(9, let, ent, refd);                                                                             
  	 	unite(10, let, ent, refu);
    end;		
    
procedure lettrification(var let : array of string ; var ent : array of integer);
var
    refu : array[0..20] of string;                                                                                //r'f'rences pour les unit's ('tendues)
    refd : array[0..20] of string;                                                                              //r'f'rence pour les dizaines
begin
	reference_unites(refu);
	reference_dizaines(refd);
	f_lettrification(let, ent, refu, refd);
end;
// GestionMillions
// Assemble la chaîne correspondant aux millions, en respectant les règles de français
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
// OUT :  millions = chaîne qui correspond aux millions

procedure GestionMillions(var let : array of string ; var millions : string);
begin 
    millions := concat(let[0], let[1]);
    millions := concat(millions, let[2]);           // assemble le triplet
    if millions = 'un-' then 
        millions := 'un-million-'
    else if millions <> '' then 
        millions := concat(millions, 'millions-');
end;

// GestionMilliers
// Assemble la chaîne correspondant aux milliers, en respectant les règles de français
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
// OUT :  milliers = chaîne qui correspond aux milliers

procedure GestionMilliers(var let : array of string ; var milliers : string);
begin 
    milliers := concat(let[3], let[4]);
    milliers := concat(milliers, let[5]);            // assemble le triplet
    if milliers = 'un-' then 
        milliers := 'mille-'
    else if milliers <> ''  then 
        milliers := concat(milliers, 'mille-');
end;

// GestionUnites
// Assemble la chaîne correspondant aux unites, en respectant les règles de français
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
// OUT :  unites = chaîne qui correspond aux unités

procedure GestionUnites(var let : array of string ; var unites : string);
begin 
    unites := concat(let[6], let[7]);
    unites := concat(unites, let[8]);                // assemble le triplet, pas besoin de faire autre chose pour unites
end;

// GestionEuros
// Affecte une valeur à la variable euros en respectant les règles de français
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
//OUT : euros = prend les valeurs 'euros', 'euro' ou 'zero euro' selon les cas

procedure GestionEuros(var millions, milliers, unites : string ; var euros : string);
begin 
    euros := ' euros ' ;                                    // cas le plus fréquent
    if (milliers = '') and (millions = '') then
    begin
        if unites = 'un-' then
            euros := ' euro '
        else if unites = '' then
            euros := 'zero euro ';
    end;
    if (unites = '') and (milliers = '') and (millions <> '') then
        euros := ' d''euros '
end;

// GestionCentimes
// Assemble la chaîne correspondant aux centimes, en respectant les règles de français
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
// OUT :  centimes = chaîne qui correspond aux centimes

procedure GestionCentimes(var let : array of string ; var centimes : string);
begin 
    centimes := concat(let[9], let[10]);         // assemble le couple
    if centimes = 'un-' then 
        centimes := 'et un centime'
    else if centimes <> '' then
    begin
    	Delete(centimes, length(centimes), 1);
    	centimes := concat('et ', centimes);
    	centimes := concat(centimes, ' centimes');
    end;
end;


// Assemblage
// Assemble les chaînes du tableau pour obtenir les chaînes à afficher
// IN : let = le tableau contenant les chaînes qui correspondent aux chiffres du nombre saisi pas l'utilisateur
// OUT :  millions = chaîne qui correspond aux millions
 // milliers = chaîne qui correspond aux milliers
 // unites = chaîne qui correspond aux unites (3 premiers chiffres avant la virgule)
 // euros = prend les valeurs 'euros', 'euro' ou 'zero euro' selon les cas
// centimes = chaîne qui correspond aux centimes

procedure Assemblage(var let : array of string ; var  nbchaine : string);
var 
    millions, milliers, unites, euros, centimes: string;
begin
    GestionMillions(let, millions);
    GestionMilliers(let, milliers);
    GestionUnites(let, unites);
    nbchaine := millions + milliers + unites;
    Delete(nbchaine, length(nbchaine), 1);
    GestionEuros(millions, milliers, unites, euros);
    GestionCentimes(let, centimes);
    nbchaine := nbchaine + euros + centimes;
end;

procedure Conversion(nombre : real ; var nbchaine : string);
var
    ent : array [0..10]   of integer;                                                                            // tableau d'int pour test (entr'e)
    let : array [0..10] of string;                                                                                 // tableau de sortie
begin
	Decoupage(nombre, ent);
	Lettrification(let, ent);
	Assemblage(let, nbchaine);
end;


begin
    nombre := Saisie();
    Conversion(nombre, nbchaine);
    writeln(nbchaine);
end.
