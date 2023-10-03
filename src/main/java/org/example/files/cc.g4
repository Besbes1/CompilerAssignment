grammar cc;

//start   : (Hardware|Inputs|Outputs|Latches|Update|Simulate|Variable|WHITESPACE|expression)* EOF ;


start : hdlo;


hdlo : method* ;

								
hardware : '.hardware ' IDENTIFIER+;

inputs : '.inputs ' IDENTIFIER+;

outputs : '.outputs ' IDENTIFIER+;

latches : '.latches' lachita+;


//It says in the slides that update does not have to be cyclic 
//That is for Assignment 2

updates : '.update' update+;
update :  IDENTIFIER '=' expression;


simulate : '.simulate' sim+;

sim : IDENTIFIER '=' NUMBER;

//prog : '.hardware' Variable ".inputs" vARIABLES+ ".update" updatedecl+
//updatedecl : 
//expr


method : hardware inputs outputs latches updates simulate ;

expression 
	: IDENTIFIER
	|'('expression')'
	|'!'expression 
	|expression '&&' expression
	|expression '||' expression
	;

COMMENT : '//' ~[\n]* -> skip;
LONGCOMMENT : '/*' (~[*] | '*'~[/])* '*/' -> skip;

IDENTIFIER : [a-zA-Z] [a-zA-Z_0-9]* ;  

//NORMALTEXT : ~[</ \t\n]+ ;

lachita : IDENTIFIER '->' IDENTIFIER ;


NUMBER : [0-1]  [0-1]* ;


WHITESPACE : [ \t\n]+ -> skip;



