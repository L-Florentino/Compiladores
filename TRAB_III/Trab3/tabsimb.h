#include <string.h>
#define MAX 1000
struct symbol {
	char nome[50];
	int tam;
	int tipo;
};
int tam=0;
struct symbol Tabela[MAX];

int procura(char *nome) {
int i;	
	for(i=0; i<tam; i++) 
	  if(strcmp(Tabela[i].nome,nome)==0)
	     return i; 
	return -1;     
}
int insere(char *nome) {
int i,pos;
struct symbol aux;	
	pos = procura(nome);
	if (pos != -1)
		return pos;
	strcpy(aux.nome,nome);
	Tabela[tam]=aux; 
	return tam++;	     
}
char nome[50];
char *obtemNome(int pos) {
	strcpy(nome,Tabela[pos].nome);
	return nome;
}
void imprime() {
int i;
	printf("\nTABELA DE SIMBOLOS\n");	
	for(i=0; i<tam; i++) 	
	   printf("%d - %s\n",i,Tabela[i].nome);
}
















