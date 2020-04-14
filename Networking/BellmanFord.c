#include <stdio.h>

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
	
	int weightBetweenEdges[noOfEdges][3];
	int weightOfVertex[noOfVertex];
	
	// Weight of edges between vertices
	printf("Enter each edge value in format: source destination weight\n");
	for(int i = 0; i < noOfEdges; i++) {
		scanf("%d %d %d", &source, &destination, &weight);
		weightBetweenEdges[i][0] = source-1;
		weightBetweenEdges[i][1] = destination-1;
		weightBetweenEdges[i][2] = weight;
	}
	
	
	// Initializing all vertex with infinity
	for(int i = 0; i < noOfVertex; i++) {
		weightOfVertex[i] = 99999;
	}
	
	// Initializing source node to 0.
	weightOfVertex[0] = 0;
	
	// Relaxing nodes
	for(int i = 0; i < noOfVertex-1; i++) {
		for(int j = 0; j < noOfEdges; j++) {
			source = weightBetweenEdges[j][0];
			destination = weightBetweenEdges[j][1];
			weight = weightBetweenEdges[j][2];
			
			if(weightOfVertex[destination] > weightOfVertex[source]+weight) {
				weightOfVertex[destination] = weightOfVertex[source]+weight;
			}
		}
	}
	
	// Checking of bellmanford valid
	int flag = 0;
	for(int j = 0; j < noOfEdges; j++) {
		source = weightBetweenEdges[j][0];
		destination = weightBetweenEdges[j][1];
		weight = weightBetweenEdges[j][2];
			
		if(weightOfVertex[destination] != weightOfVertex[source]+weight) {
			flag=1;
		}
	}
	
	if(flag) {
		printf("Bellmanford Valid\n");
		printf("Weight Of Vertex:\n");
		for(int i = 0; i < noOfVertex; i++) {
			printf("%d\t%d\n", (i+1), weightOfVertex[i]);
		}
	}
	else {
		printf("Bellmanford not valid.\n");
	}
}
