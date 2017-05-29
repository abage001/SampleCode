#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct Node {
	struct Node *next;
	struct Node *prev;
	int value;
} Nd_t;

struct Node * allocatePool(void);
void freeNode(void);
void insertNode(Nd_t *Ndp);

Nd_t *head = NULL;
Nd_t *tail = NULL;

# define NUM 10

struct Node * allocatePool(void) 
{

	int i;
	Nd_t *n_d;

	for(i = 0; i < NUM; i++) {

		n_d = calloc(1, sizeof(Nd_t));	
		if (n_d == NULL) {
			perror("FATAL: memory can not be allocated\n");
			exit(-1);
		}
		if ( head == NULL ) {
			head = n_d;	
		}
		else {
				insertNode(n_d);	
			}
			
	}
}

void insertNode(Nd_t *Ndp) 
{

	Nd_t *np;
	int i = 1;

	if ( head == NULL ) 
		assert("FATAL: pool not init\n");
	else
		np = head; 

	for (i = 1; i < NUM; i++) {
		if ( np->next == NULL ) { 
			np->next = Ndp;
			break;
		}
		np = np->next;
	} 
}

void freeNode() 
{

	int i;
	Nd_t *np;

	if (head == NULL) return;

	for (i = 0; i < NUM; i++) {
		np = head;
		if ( np != NULL ) { 
			printf("Free-RAND:%d\n", np->value);
			head = np->next;
			free(np);
		}
	}
}

void main() 
{

	int i;
	int Rdm;
	Nd_t *np;

	allocatePool();
	np = head;
	for(i = 0; i < NUM; i++) {
		Rdm = (int)(rand()%50);
		printf("RAND-->:%d\n", Rdm);
		np->value = Rdm;
		np = np->next;
	}
	freeNode();
}

