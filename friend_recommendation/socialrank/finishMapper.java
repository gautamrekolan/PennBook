package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;

public class finishMapper extends Mapper<LongWritable, Text, Text, Text> {
	
	/**
	 * Input is (vertex -> "rank \t v2, v3, ...")
	 * Output is (vertex -> 1/rank)
	 */
	public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		// Split the raw input into vertex and rank
		String[] input = value.toString().split("\t");
		String vertex = input[0];
		Double rank = Double.parseDouble(input[1]);
		
		// Invert rank so that the Hadoop sorter will sort in descending order instead of ascending
		rank = 1 / rank;
		
		// Flip key / value because sorting is done by key
		context.write( new Text(String.valueOf(rank)), new Text(vertex) );
	}
	
}