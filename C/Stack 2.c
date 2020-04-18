#include<stdio.h>

int size = 5, top = -1;
int a[5];

void push(int number)
{
    if(top == size-1)
        printf("Stack Full.\n");
    else
        a[++top] = number;
}

int pop()
{
    if(top == -1)
        return 'null';
    else
        return a[top--];
}

void display()
{
    int i;
    if(top == -1)
        printf("No elements in stack.\n");
    else
    {
        for(i=0;i<=top;i++)
            printf("%d\t",a[i]);
    }
    printf("\n");
}

int main()
{
    int choice, number;
    while(1)
    {
        printf("1) Enter 1 to push a element into stack.\n2) Enter 2 to pop out element from array.\n3) Enter 3 to check the whole array.\n4) Enter 4 to exit.\nChoose: ");
        scanf("%d",&choice);
        switch(choice)
        {
            case 1:
                printf("Enter the number you want to push: ");
                scanf("%d",&number);
                push(number);
                break;
            case 2:
                number = pop();
                if(number == 'null')
                    printf("Stack Empty.\n");
                else
                    printf("Popped from position %d : %d\n",(top+1),number);
                break;
            case 3:
                display();
                break;
            case 4:
                exit(0);

        }
    }
}
