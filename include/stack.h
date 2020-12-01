#ifndef _H_STACK_H
#define _H_STACK_H

#include <stdio.h>
#include <stdlib.h>

#define STACK_SIZE 100

typedef struct stack
{
    int StackSize;
    int StackIndex;
    int *Data;

}Stack;

int Stack_Init( int size );
void Stack_Push( int Handler, int data );
int Stack_Pop( int Handler );
void RemoveData( int *Data, int size );


#endif  //_H_STACK_H
