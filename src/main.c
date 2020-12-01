#include "stack.h"
int main (int argc, char* argv[])
{
    int StackHandler1 = Stack_Init(10);
    int StackHandler2 = Stack_Init(100);
    int value;
    for( int Count = 0; Count < 100; Count++ )
    {
        Stack_Push( StackHandler1, Count);
    }
    for( int Count = 0; Count < 100; Count++ )
    {
        Stack_Push( StackHandler2, Count);
    }

    for( int Count = 0; Count < 100; Count++ )
    {
        value = Stack_Pop( StackHandler1 );
        printf( " Value1 = %2d ", value );
    }
    printf("\n\n\n");
    for( int Count = 0; Count < 100; Count++ )
    {
        value = Stack_Pop( StackHandler2 );
        printf( " Value2 = %2d ", value );
    }
    printf("\n\n\n");
    printf( "Handler1 = %d\n", StackHandler1 );
    printf( "Handler2 = %d\n", StackHandler2 );
    return 0;
}