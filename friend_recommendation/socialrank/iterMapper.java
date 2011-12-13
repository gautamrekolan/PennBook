package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;

public class iterMapper extends Mapper<LongWritable, Text, Text, Text> {
	
	/**
	 * Input:	(vertex -> "rank \t v2, v3, ...")
	 * Output:	(v2 -> socialRank vote weight)
	 * 			(v3 -> socialRank vote weight)
	 * 			...
	 * 			(vertex -> "rank \t v2, v3, ...")
	 */
	public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		// Split input into three parts: vertex, rank, and its adjacency list
		String[] input = value.toString().split("\t");
		String vertex = input[0];
		String oldRank = input[1];
		String[] adjacent;
		String adjacentString;
		
		if (input.length < 3) {
			// Handle the case with no adjacent verticies and leave output adjacency list blank
			adjacent = new String[0];
			adjacentString =  "";
		} else {
			// Otherwise, split up the adjacency list
			adjacent = input[2].split(",");
			adjacentString = input[2];
		}
		
		// Count the number of elements in the adjacency list to find numFriends
		int numFriends = adjacent.length;
		
		// We'll send this social rank weighted 'vote' to the connected verticies
		Double weight = Double.valueOf(oldRank) / numFriends;
		
		for (int i = 0; i < numFriends; i++) {
			context.write( new Text(adjacent[i]), new Text(weight.toString()) );
		}
		
		// Remember to also output the raw intermediate data so we can keep track of graph edges
		context.write(new Text(vertex), new Text(oldRank + "\t" + adjacentString));
		
	}
	
}