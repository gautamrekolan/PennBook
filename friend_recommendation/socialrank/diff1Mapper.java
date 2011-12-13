package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;

public class diff1Mapper extends Mapper<LongWritable, Text, Text, Text> {
	
	/**
	 * Input:	(vertex -> "rank \t v2, v3, ...")
	 * Output:	(vertex -> rank)
	 */
	public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		// Simply grab the rank from the input and output it
		String[] input = value.toString().split("\t");
		Text vertex = new Text(input[0]);
		Text rank = new Text(input[1]);
		
		context.write(vertex, rank);
		
	}
	
}