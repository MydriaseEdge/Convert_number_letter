Program fonct_lettrification (input,output);


Var
//--------------------------------------------------------------------------------------------------------------------------------D‚claration des tableaux
    ent : array [0..10]   of integer;                                                                            // tableau d'int pour test (entr‚e)
    let : array [0..10] of string;                                                                                 // tableau de sortie
    
    refu : array[0..20] of string;                                                                                //r‚f‚rences pour les unit‚s (‚tendues)
    refd : array[1..20] of string;                                                                              //r‚f‚rence pour les dizaines
//--------------------------------------------------------------------------------------------------------------------------------D‚claration des varialbes 
j : integer;                                                                                                            //pour l'affichage provisoire
//-------------------------------------------------------------------------------------------------------------------------------- Proc‚dure d'initialisation de la table finale 
 procedure init_let (var  tab : array of string);          
 var i : integer;                                                  
  begin   
  	 for i :=0 to 9 do
        begin
        	let[i] :=''
        end;	
  end;	
 //-------------------------------------------------------------------------------------------------------------------------------- Proc‚dure d'initialisation de la table de r‚f‚rence des unit‚s
  procedure reference_unites (var  tab : array of string);                                                            // laisser l'espace … la fin des strings
  begin   
  	 tab[0] := '';
  	tab[1] := 'un ';
  	tab[2] := 'deux ';
  	tab[3] := 'trois ';
  	tab[4] := 'quatre ';
  	tab[5] := 'cinq ';
  	tab[6] := 'six ';
  	tab[7] := 'sept ';
  	tab[8] := 'huit ';
  	tab[9] := 'neuf ';
  	tab[10] := 'dix';                                                                                                    
  	tab[11] := 'onze';
  	tab [12] := 'douze';
  	tab[13] := 'treize';
  	tab[14] := 'quatorze';
  	tab[15] := 'quinze';
  	tab[16] := 'seize';
  	tab[17] := 'dix-sept';
  	tab[18] := 'dix-huit';
  	tab[19] := 'dix-neuf';
  	
  end;	
  	
 //-------------------------------------------------------------------------------------------------------------------------------- Proc‚dure d'initialisation de la table de r‚f‚rence des dizaines
 procedure reference_dizaines (var  tab : array of string);                                                            // laisser l'espace … la fin des strings
  begin   
  	 
  	tab[1] := 'erreurTab ';                                                                                                               // pour d‚buggage
  	tab[2] := 'vingt ';
  	tab[3] := 'trente ';
  	tab[4] := 'quarante ';
  	tab[5] := 'cinquante ';
  	tab[6] := 'soixante ';
  	tab[7] := 'soixante-dix ';
  	tab[8] := 'quatre-vingts ';
  	tab[9] := 'quatre-vingts-dix ';
  	
  end;	
   //--------------------------------------------------------------------------------------------------------------------------------	 Proc‚dure de conversion dans le cas d'une centaine
   procedure centaine (i : integer; var let : array of string ; var ent : array of integer; var refu : array of string); 	 
   begin
        if ent[i] <> 1 then                                                                                 
            begin
            	if ent[i] = 0 then                                                                          // si pas de centaine on met rien
                    begin
                        let[i] := '';
                    end
                else   
                    begin
                        let[i] := refu[ent[i]] + 'cent ';
                    end;
            end       
            
        else 
            begin
                let[i] := 'cent ';
             end;   
   end;
   //--------------------------------------------------------------------------------------------------------------------------------	 Proc‚dure de conversion dans le cas d'une dizaine =! 1x , 7x; 9x
   procedure dizaine (i : integer; var let : array of string ; var ent : array of integer; var refd : array of string); 	 
   
    begin
      	if ent[i] = 0 then                                                                          
             begin
                let[i] := '';
              end
        else   
            begin
                 let[i] := refd[ent[i]] ;
            end;

   end;
   
  //--------------------------------------------------------------------------------------------------------------------------------	 	
 procedure lettrification (var let : array of string ; var ent : array of integer; var refu : array of string; var  refd : array of string); 	 	
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
  	 	//*****************cas des dizaines simples (hors de la virgule et diff‚rents de 1X 7X 9X)
            i := 1;
            while i <= 8 do
                begin
                	if (ent[i] <> 1) and (ent[i] <> 7) and (ent[i] <> 9) then
                	dizaine (i,let,ent,refd) ;
                	i := i + 3;                                                                                         // on saute de 3 pour accrocher que les dizaines de chaque triplet
                end;	
  	 	
  	 	
          end;		
  //--------------------------------------------------------------------------------------------------------------------------------	 	
 
  
  begin                                                                                                                                     // nombre au pif pour test
  	ent[0] := 2;
  	ent[1] := 4;
   ent[2] := 5;
  	ent[3] := 0;
  	ent[4] := 8;
  	ent[5] := 9;
    ent[6] := 8;
  	ent[7] := 7;
  	ent[8] := 2;
  	
  	
  	init_let (let);
  	reference_unites(refu);
  	reference_dizaines(refd);
  	lettrification (let,ent,refu,refd);
  	
  	for j := 0 to 9 do
        begin
        	writeln(let[j]);                                                                                                                        //affichage pour test
        end;	
 end.	
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    	 	
  	 	
  	 	