%{ 
#include "analex.c" 
%}
%token NUM 
%token ID 
%token INT
%token IF 
%token ELSE
%token WHILE
%token GE
%token DO
%token VOID
%token CHAR
%token AND
%left '>'
%left '+' '-'
%left '*' '/'
%start Prog
%%
Prog : Prog Function
	| Function
	;

Function :
	TypeF ID '(' ')' '{' Decls Statement_Seq '}'  
		
Decls:
	  Decl ';' Decls  
	| 
	;

Decl:
	Type IDs
	; 
	
IDs :
	  IDs ',' ID
	| ID
	;
	
TypeF :
	  VOID
	| INT
	| CHAR
	;

Type :
	  INT
	| CHAR
	;
			
Statement_Seq :
	Statement Statement_Seq
	|
	;
		
Statement: 
	  Atribuicao
	| If
	| While
	| DoWhile
	;

Compound_Stt :
	  Statement
	| '{' Statement_Seq '}'
	;
		
If :
	  IF '(' Exp_Bool ')' Compound_Stt
	| IF '(' Exp_Bool ')' Compound_Stt ELSE Compound_Stt	  
	;

While:
	WHILE '(' Exp_Bool ')' Compound_Stt
	;

DoWhile:
	DO Compound_Stt WHILE '(' Exp_Bool ')' ';'
	;
			
Atribuicao : ID '=' Exp_Bool ';' 
	;
				
Exp :
	  Exp '+' Exp 
	| Exp '-' Exp
	| Exp '*' Exp
	| Exp '/' Exp	
	| '(' Exp_Bool ')' 	  
	| NUM		   
	| ID           
	;   

Exp_Rel	: 
	  Exp_Rel '>' Exp
	| Exp
	;
	   
Exp_Bool :
	  Exp_Bool AND Exp_Rel 
	| Exp_Rel
	;
		   
	
%%  
int main(int argc, char **argv) {     
  yyin = fopen(argv[1],"r");
  yyparse();      
} 


