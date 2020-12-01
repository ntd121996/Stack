#include "stack.h"

Stack StackManager[STACK_SIZE];
int StackHandler = -1;
int Stack_Init( int size )
{
    StackHandler++;
    StackManager[StackHandler].Data = malloc( sizeof( int ) *size );
    StackManager[StackHandler].StackSize = size;
    StackManager[StackHandler].StackIndex = -1;
    return StackHandler;
}
void Stack_Push( int Handler, int data )
{
    if(( Handler != -1 ) &&
       ( StackManager[Handler].StackIndex < StackManager[Handler].StackSize ))
    {
        StackManager[Handler].StackIndex++;
        StackManager[Handler].Data[StackManager[Handler].StackIndex] = data;
    }
}
int Stack_Pop( int Handler )
{
    int value = -1;
    if(( Handler != -1 ) &&
       ( StackManager[Handler].StackIndex >-1 ))
    {
        value = StackManager[Handler].Data[StackManager[Handler].StackIndex];
        RemoveData( &StackManager[Handler].Data[0], StackManager[Handler].StackIndex);
        StackManager[Handler].StackIndex--;
    }
    return value;
       

}
void RemoveData( int *Data, int size )
{
    if( Data != NULL )
    {
        Data[size] = -1;
    }
}