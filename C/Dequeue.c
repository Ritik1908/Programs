#include<stdio.h>
#include<process.h>
#define MAX 30

typedef struct dequeue
{
    int data[MAX];
    int rear;
    int front;
}dequeue;

void initialize(dequeue *P)
{
    P -> rear = -1;
    P -> front = -1;
}

int empty(dequeue *P)
{
    if(P -> rear == -1)
    {
        return(1);
    }
    return(0);
}

int full(dequeue *P)
{
    if((P -> rear + 1) % MAX == P -> front)
    {
        return(1);
    }
    return(0);
}

void enqueueR(dequeue *P, int x)
{
    if(empty(P))
    {
        P -> rear = 0;
        P -> front = 0;
        P -> data[0] = x;
    }
    else
    {
        P -> rear = (P -> rear + 1) % MAX;
        P -> data[P -> rear] = x;
    }
}

void enqueueF(dequeue *P, int x)
{
    if(empty(P))
    {
        P -> rear = 0;
        P -> front = 0;
        P -> data[0] = x;
    }
    else
    {
        P -> front = (P -> front - 1 + MAX) % MAX;
        P -> data[P -> front]=  x;
    }
}

int dequeueF(dequeue *P)
{
    int x;
    x = P -> data[P -> front];
    if(P -> rear == P -> front)    //delete the last element
    {
        initialize(P);
    }
    else
    {
        P -> front = (P -> front + 1) % MAX;
    }
    return(x);
}

int dequeueR(dequeue *P)
{
    int x;
    x = P -> data[P -> rear];
    if(P -> rear == P -> front)
    {
        initialize(P);
    }
    else
    {
        P -> rear = (P -> rear -1 + MAX) % MAX;
    }
    return(x);
}

void print(dequeue *P)
{
    if(empty(P))
    {
        printf("\nQueue is empty!!");
        exit(0);
    }
    int i;
    i = P-> front;
    while(i != P -> rear)
    {
        printf("%d, ",P -> data[i]);
        i = (i + 1) % MAX;
    }
    printf("%d.\n",P -> data[P -> rear]);
}

void main()
{
    int i,x,choice,n;
    dequeue q;
    initialize(&q);

    do
    {
        printf("\n1.Create\n2.Insert at rear.\n3.Insert at front.\n4.Delete at rear.\n5.Delete at front,");
        printf("\n6.Print.\n7.Exit.\nEnter your choice:");
        scanf("%d",&choice);

        switch(choice)
        {
            case 1: printf("Enter number of elements:");
                    scanf("%d",&n);
                    initialize(&q);
                    printf("Enter the data : \n");

                    for(i=0;i<n;i++)
                    {
                        scanf("%d",&x);
                        if(full(&q))
                        {
                            printf("Queue is full!!\n");
                            exit(0);
                        }
                        enqueueR(&q,x);
                    }
                    break;

            case 2: printf("Enter element to be inserted:");
                    scanf("%d",&x);

                    if(full(&q))
                    {
                        printf("Queue is full!!\n");
                        exit(0);
                    }

                    enqueueR(&q,x);
                    break;

            case 3: printf("Enter the element to be inserted:");
                    scanf("%d",&x);

                    if(full(&q))
                    {
                        printf("Queue is full!!\n");
                        exit(0);
                    }

                    enqueueF(&q,x);
                    break;

            case 4: if(empty(&q))
                    {
                        printf("Queue is empty!!\n");
                        exit(0);
                    }

                    x=dequeueR(&q);
                    printf("Element deleted is %d\n",x);
                    break;

            case 5: if(empty(&q))
                    {
                        printf("Queue is empty!!\n");
                        exit(0);
                    }

                    x=dequeueF(&q);
                    printf("Element deleted is %d\n",x);
                    break;

            case 6: print(&q);
                    break;

            default: break;
        }
    }while(choice!=7);
}
