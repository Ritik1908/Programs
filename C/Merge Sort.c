#include <stdio.h>
#include <malloc.h>

void print(int a[], int n)
{
    int i;
    for(i = 0; i < n-1; i++)
    {
        printf("%d, ", a[i]);
    }
    printf("%d\n", a[n-1]);
}

void merge(int a[], int b[], int c[], int s1, int s2, int s3)
{
    int i, j, k, temp;
    for(i = 0; i < s1 - 1; i++)
    {
        for(j = i + 1; j < s1; j++)
        {
            if(a[i] > a[j])
            {
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
            if(b[i] > b[j])
            {
                temp = b[i];
                b[i] = b[j];
                b[j] = temp;
            }
        }
    }
    for(i=j=k=0; i < s3;)
    {
        if(a[j] <= b[k])
        {
            c[i++] = a[j++];
        }
        else
        {
            c[i++] = b[k++];
        }
        if(j == s1 || k == s2)
        {
            break;
        }
    }
    for(;j < s1; )
    {
        c[i++] = a[j++];
    }
    for(; k <= s2;)
    {
        c[i++] = b[k++];
    }
}

void main()
{
    int *arr1, *arr2, *arr3;
    int size1, size2, size3, i;
    printf("***** 1st Array Elements *****\n");
    printf("Enter number of elements : ");
    scanf("%d", &size1);
    arr1 = (int*)malloc((size1)*sizeof(int));
    printf("Enter array elements : \n");
    for(i = 0; i < size1; i++)
    {
        scanf("%d", (arr1+i));
    }
    printf("***** 2nd Array Elements *****\n");
    printf("Enter number of elements : ");
    scanf("%d", &size2);
    arr2 = (int*)malloc((size2)*sizeof(int));
    printf("Enter array elements : \n");
    for(i = 0; i < size2; i++)
    {
        scanf("%d", (arr2+i));
    }
    size3 = size1 + size2;
    arr3 = (int*)malloc((size3)*sizeof(int));
    printf("1st Array before sorting : ");
    print(arr1, size1);
    printf("2nd Array before sorting : ");
    print(arr2, size2);
    merge(arr1, arr2, arr3, size1, size2, size3);
    printf("Array after sorting : ");
    print(arr3, size3);
}
