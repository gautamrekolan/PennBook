package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;

public class initMapper extends Mapper<LongWritable, Text, IntWritable, IntWritable> {
	/**
	 * init function that takes raw Hadoop input from text files containing
	 * edge lists for a social graph and converts it to usable intermediate
	 * data to be used by other functions in SocialRank.
	 * 
	 * Input data is v1 -> v2
	 * Output data is v1 -> (rank, v2, v3, ...)
	 * 		(Output includes vertex rank and all connected verticies)
	 * 
	 * map: takes line number -> line text
	 * 		outputs (edge -> connected edge)
	 * 
	 * @param key, line number of data from file (LongWritable)
	 * @param value, data at that line (Text)
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		// key is a line number from the file
		// value is the raw string at that line
		
		int[] edge = SocialRankDriver.parseEdge(value.toString());
		
		context.write(new IntWritable(edge[0]), new IntWritable(edge[1]));
	}
	
}