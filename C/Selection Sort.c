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

void selection(int arr[], int size)
{
    int i, j, temp;
    for(i = 0; i < size - 1; i++)
    {
        for(j = i + 1; j < size; j++)
        {
            if(arr[i] > arr[j])
            {
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
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
    selection(arr,n);
    printf("Array after sorting : ");
    print(arr, n);
}
