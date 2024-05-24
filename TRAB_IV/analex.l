%{
#include <stdio.h>
// #include "tokens.h"
#include "sint.h"
#include "tabsimb.h"
int linha = 1;
int yyerror(char *s) { 
  fprintf(stderr, "%s na linha %d\n",s,linha); 
}
%}
dig [0-9]
letra [a-zA-Z_]
%%
"int"  {return INT;}
"void"  {return VOID;}
"char"  {return CHAR;}
"if"	{return IF;}	
"else" {return ELSE;}
"while" {return WHILE;}
"println" {return PRINTLN;}
"print" {return PRINT;}
"read" {return READ;}
"do"	{ return DO; }
">="	{return GE;} 
"&&" 	{return AND;}
">"		{return '>';}
"("	{return '(';}
")"	{return ')';}
"{"	{return '{';}
"}"	{return '}';}
";"	{return ';';}
"="	{return '=';}
","	{return ',';}
"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}	
{dig}+("."{dig}+)?	{ yylval = atoi(yytext); return NUM;}
{letra}({letra}|{dig})*  { yylval = insere(yytext); 
                           return ID;}  
[ \t\r] {}
\n	{ linha++; }
.	{printf("erro lexico na linha %d - %s\n",
             linha, yytext); }
%%
#ifndef yywrap
int yywrap() { return 1; }
#endif

