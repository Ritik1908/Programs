#include <stdio.h>

int getMinimumVertexIndex(int visited[], int distance[], int noOfVertex) {
	int min = 99999;
	int index = -1;
	for(int i = 0; i < noOfVertex; i++) {
		if(visited[i] && distance[i] < min) {
			min = distance[i];
			index = i;
		}
	}
	return index;
}

void main() {
	int noOfVertex;
	int noOfEdges;
	int source;
	int destination;
	int weight;
	
	// Number of edges and vertex
	printf("Enter Number Of Vertices: ");
	scanf("%d", &noOfVertex);
	printf("Enter Number Of Edges: ");
	scanf("%d", &noOfEdges);
	
	int weightBetweenEdges[noOfVertex][noOfVertex];
	int weightOfVertex[noOfVertex];
	
	for(int i = 0; i < noOfVertex; i++) {
		for(int j = 0; j < noOfVertex; j++) {
			weightBetweenEdges[i][j] = 0;
		}
	}
	
	// Weight of edges between vertices
	printf("Enter each edge value in format: source destination weight\n");
	for(int i = 0; i < noOfEdges; i++) {
		scanf("%d %d %d", &source, &destination, &weight);
		weightBetweenEdges[source][destination] = weight;
		weightBetweenEdges[destination][source] = weight;
	}
	
	
	// Initializing all vertex weight with infinity
	for(int i = 0; i < noOfVertex; i++) {
		weightOfVertex[i] = 99999;
	}
	
	// Initializing source node to 0.
	weightOfVertex[0] = 0;
	
	int visited[noOfVertex];
	// Initializing all vertex with infinity
	for(int i = 0; i < noOfVertex; i++) {
		visited[i] = 0;
	}
	
	for(int i = 0; i < noOfVertex; i++) {
		for(int j = 0; j < noOfVertex; j++) {
			printf("%d\t", weightBetweenEdges[i][j]);
		}
		printf("\n");
	}
	
	
	
	// Find shortest path for all vertices 
    	for (int i = 0; i < noOfVertex-1; i++) {
    		
    		int index =  getMinimumVertexIndex(visited, weightOfVertex, noOfVertex);
    		visited[index] = 1;
    		
        	for (int j = 0; j < noOfVertex; j++)
        	{ 
  
		    	// Update dist[v] only if is not in sptSet, there is an edge from 
		    	// u to v, and total weight of path from src to  v through u is 
		    	// smaller than current value of dist[v] 
		    	if (!visited[j] && weightBetweenEdges[i][j] && weightOfVertex[i] != 99999 && (weightOfVertex[i] + weightBetweenEdges[i][j] < weightOfVertex[j]))
		    	{
			        	weightOfVertex[j] = weightOfVertex[i] + weightBetweenEdges[i][j];
			}
		}
    	} 
	
	printf("Weight Of Vertex:\n");
	for(int i = 0; i < noOfVertex; i++) {
		printf("%d\t%d\n", (i+1), weightOfVertex[i]);
	}
}
