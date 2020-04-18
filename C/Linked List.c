#include <stdio.h>
#include <conio.h>
#include <malloc.h>
#include <windows.h>

// structure containing a data part and a link part
struct node
{
    int data;
    struct node *link;
};

void append (struct node **, int);
void addatbeg(struct node **, int);
void addafter(struct node *, int, int);
void display(struct node *);
int count(struct node *);
void del (struct node **, int );

int main()
{
    int ch, n, n1;
     struct node *p;
     p = NULL; //empty linked list
     do
     {
         printf("\n1.Add at last.\n2.Add at beg.\n3.Add at pos.\n4.Delete.\n5.Display.\n6.Count nodes.\n7.Exit.\nChoice : ");
         scanf("%d", &ch);
         switch(ch)
         {
             case 1 :
                 printf("Enter an element : ");
                 scanf("%d", &n);
                 append(&p, n);
                 break;
             case 2 :
                 printf("Enter an element : ");
                 scanf("%d", &n);
                 addatbeg(&p, n);
                 break;
             case 3 :
                 printf("Enter an element to add : ");
                 scanf("%d", &n);
                 printf("Element after which you want to add : ");
                 scanf("%d", &n1);
                 addafter(p, n1, n);
                 break;
             case 4 :
                 printf("Enter element you want to delete : ");
                 scanf("%d", &n);
                 del(&p, n);
                 break;
             case 5 :
                 display(p);
                 break;
             case 6 :
                 printf("No. of elements in the linked list = %d\n", count(p));
                 break;
             default : break;
         }
    }while(ch != 7);
    return 0;
}

//adds a node at the end of a linked list
void append(struct node **q, int num)
{
    struct node *temp, *r;

    if(*q == NULL)
    {
        temp = (struct node*)malloc(sizeof(struct node));
        temp -> data = num;
        temp -> link = NULL;
        *q = temp;
    }
    else
    {
        temp = *q;

        //go to the last node
        while(temp -> link != NULL)
        {
            temp = temp -> link;
        }

        //add node at the end
        r = (struct node *)malloc(sizeof(struct node));
        r -> data = num;
        r -> link = NULL;
        temp -> link = r;
    }
}

//add a new node at the beginning of the linked list
void addatbeg(struct node **q, int num)
{
    struct node *temp;

    //add a new node
    temp = (struct node *)malloc(sizeof(struct node));

    temp -> data = num;
    temp -> link = *q;
    *q = temp;
}

//adds a new node after the specified number of nodes
void addafter(struct node *q, int loc, int num)
{
    struct node *temp, *r;
    int i;
    temp = q;
    //skips to desired position
    for(i = 0; i < loc; i++)
    {
        temp = temp -> link;

        //if end of the link if encountered
        if(temp == NULL)
        {
            printf("There are less than %d elements in list\n", loc);
            return;
        }
    }

    //insert new node
    r = (struct node*)malloc(sizeof(struct node));
    r -> data = num;
    r -> link = temp -> link;
    temp -> link = r;
}

//display the contents of the linked list
void display(struct node *q)
{
    //traverse the entire list
    while(q != NULL)
    {
        printf("%d ", q-> data);
        q = q -> link;
    }
    printf("\n");
}

//counts the number of nodes present in the linked list
int count(struct node *q)
{
    int c = 0;
    //traverse the entire linked list
    while(q != NULL)
    {
        q = q -> link;
        c++;
    }
    return c;
}

//deletes the specified node from the linked list
void del(struct node **q, int num)
{
    struct node *old, *temp;
    temp = *q;
    while(temp != NULL)
    {
        if(temp -> data == num)
        {
            //if node to be deleted is the first node in the linked list
            if(temp == *q)
            {
                *q = temp -> link;
            }
            //deletes the intermediate nodes in the linked list
            else
            {
                old -> link = temp -> link;
            }

            //free the memory occupied by the node
            free(temp);
            return;
        }
        //traverse the linked list till the last node is reached
        else
        {
            old = temp; //old points to the previous node
            temp = temp -> link; //goes to the next node
        }
    }
    printf("Element %d not found\n",num);
}
