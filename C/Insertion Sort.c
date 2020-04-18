#include <stdio.h>
#include <malloc.h>

void print(int a[], int size)
{
    int i;
    for(i = 0; i < size-1; i++)
    {
        printf("%d, ", a[i]);
    }
    printf("%d\n", a[size-1]);
}

void insertion(int arr[], int size)
{
    int i, j, k, temp;
    for(i = 1; i <=size-1; i++)
    {
        for(j = 0; j < i; j++)
        {
            if(arr[j] > arr[i])
            {
                temp = arr[j];
                arr[j] = arr[i];
                for(k = i; k > j; k--)
                {
                    arr[k] = arr[k-1];
                }
                arr[k+1] = temp;
            }
        }
    }
}
void main()
{
    int *arr;
    int i, n;
    printf("Enter number of elements : ");
    scanf("%d", &n);
    arr = (int*)malloc(n*sizeof(int));
    printf("Enter array elements : \n");
    for(i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }
    printf("Array before sorting : ");
    print(arr, n);
    insertion(arr,n);
    printf("Array after sorting : ");
    print(arr, n);
}
