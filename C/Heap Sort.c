#include <stdio.h>
#include <malloc.h>

void heapify(int arr[], int n, int i)
{
    int largest, l, r, temp;
    // Find largest among root, left child and right child
    largest = i;
    l = 2*i + 1;
    r = 2*i + 2;
    if (l < n && arr[l] > arr[largest])
    {
        largest = l;
    }
    if (r < n && arr[r] > arr[largest])
    {
        largest = r;
    }
    // Swap and continue heapifying if root is not largest
    if (largest != i)
    {
        temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;
        heapify(arr, n, largest);
    }
}

// main function to do heap sort
void heapSort(int arr[], int n)
{
    int i, temp;
    // Build max heap
    for (i = n / 2 - 1; i >= 0; i--)
    {
        heapify(arr, n, i);
    }
    // Heap sort
    for (i=n-1; i>=0; i--)
    {
        temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        // Heapify root element to get highest element at root again
        heapify(arr, i, 0);
    }
}

void printArray(int arr[], int n)
{
    int i;
    for (i=0; i<n-1; ++i)
    {
        printf("%d, ", arr[i]);
    }
    printf("%d.\n", arr[n-1]);
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
    printArray(arr, n);
    heapSort(arr, n);
    printf("Array after sorting : ");
    printArray(arr, n);
}
