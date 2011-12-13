package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;

public class diff2Mapper extends Mapper<LongWritable, Text, Text, Text> {
	
	/**
	 * Input is (vertex -> difference between old rank and current rank)
	 * Output is (graph -> rankDiff)
	 */
	public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		String[] input = value.toString().split("\t");
		
		// Use Hadoop I/O to group all the rank differences into one array to be parsed by reducer
		context.write(new Text("Graph"), new Text(input[1]));
		
	}
	
}