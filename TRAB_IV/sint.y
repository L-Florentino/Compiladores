%{ 
#include "analex.c" 
#include "codigo.h"
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
%token PRINT
%token PRINTLN
%token READ
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
	;| PRINTLN '(' ID ')' ';'

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
	| PRINTLN '(' ID ')' ';'
	| PRINT '(' ID ')' ';'
	| ID '=' READ '(' ')' ';'
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
			
Atribuicao : ID '=' Exp_Bool ';'  { Move($1,$3);}
	;
				
Exp :
	  Exp '+' Exp 
	| Exp '-' Exp
	| Exp '*' Exp
	| Exp '/' Exp	
	| '(' Exp_Bool ')' 	  
	| NUM		   { $$ = newTemp(); Li($$,$1); }
	| ID           
	;   

Exp_Rel	: 
	  Exp_Rel '>' Exp
	| Exp				{$$ = $1;}
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


