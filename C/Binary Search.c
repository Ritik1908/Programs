#include <stdio.h>
#include <stdlib.h>

int bin(int *arr, int low, int high, int key)
{
    int mid = (low+high)/2;
    if(low > high)
    {
        return -1;
    }
    if(*(arr+mid) == key)
    {
        return mid;
    }
    if(*(arr+mid) > key)
    {
        return bin(*arr, low, mid - 1, key);
    }
    else
    {
        return bin(*arr, mid+1, high, key);
    }
}

int binary(int *arr, int low, int high, int key)
{
    int mid = 0;
    while(low <= high)
    {
        mid = (low+high)/2;
        if(*(arr+mid) == key)
        {
            return mid;
        }
        else if(*(arr+mid) > key)
        {
            high = mid - 1;
        }
        else if(*(arr+mid) < key)
        {
            low = mid + 1;
        }
    }
    return -1;
}

void sorting(int *arr, int size)
{
    int i, j, temp;
    for(i = 0; i < size-1; i++)
    {
        for(j = 0; j < size-i-1; j++)
        {
            if(*(arr+j) > *(arr+j+1))
            {
                temp = *(arr+j);
                *(arr+j) = *(arr+j+1);
                *(arr+j+1) = temp;
            }
        }
    }
}
void input(int *arr, int size)
{
    int i;
    printf("Enter the array elements.\n");
    for(i = 0; i < size; i++)
    {
        scanf("%d", (arr+i));
    }
}

void display(int *arr, int size)
{
    int i;
    for(i = 0;i < size; i++)
    {
        printf("%d\t", *(arr+i));
    }
    printf("\n");
}

int main()
{
    int *a, size, skey, f;
    printf("Enter array size : ");
    scanf("%d", &size);
    a = (int*)malloc(size * sizeof(int));
    input(a, size);
    display(a, size);
    sorting(a, size);
    display(a, size);
    printf("Enter element to search : ");
    scanf("%d", &skey);
    f = binary(a, 0, size, skey);
    if(f == -1)
    {
        printf("Element Not Found in array.\n");
    }
    else
    {
        printf("%d found at position %d", skey, f+1);
    }
    return 0;
}
