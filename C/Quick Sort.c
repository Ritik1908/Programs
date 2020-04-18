#include<stdio.h>
#include<malloc.h>

void quicksort(int number[],int first,int last)
{
    int i, j, pivot, temp;
    if(first<last)
    {
        pivot=first;
        i=first;
        j=last;
        while(i<j)
        {
            while(number[i]<=number[pivot]&&i<last)
            {
                i++;
            }
            while(number[j]>number[pivot])
            {
                j--;
            }
            if(i<j)
            {
                temp=number[i];
                number[i]=number[j];
                number[j]=temp;
            }
        }
        temp=number[pivot];
        number[pivot]=number[j];
        number[j]=temp;
        quicksort(number,first,j-1);
        quicksort(number,j+1,last);
    }
}

void print(int a[], int size)
{
    int i;
    for(i = 0; i < size-1; i++)
    {
        printf("%d, ", a[i]);
    }
    printf("%d\n", a[size-1]);
}

int main()
{
    int i, size, *arr;
    printf("Enter number of elements : ");
    scanf("%d",&size);
    arr = (int*)malloc(size*sizeof(int));
    printf("Enter elements of array :\n");
    for(i=0;i<size;i++)
    {
        scanf("%d", &arr[i]);
    }
    printf("Array before sorting : ");
    print(arr,size);
    quicksort(arr,0,size-1);
    printf("Array after sorting : ");

    print(arr,size);
}
