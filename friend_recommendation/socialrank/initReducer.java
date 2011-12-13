package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.*;

public class initReducer extends Reducer<IntWritable, IntWritable, LongWritable, Text> {
	
	/**
	 * Invariant: first value in output array contains vertex rank. Initialized as 1
	 * 
	 * Input: (vertex -> connected vertex)
	 * Output: (vertex -> rank \t v2, v3, ...)
	 * 
	 */
	public void reduce(IntWritable key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
		
		String out = "1.0\t";
		
		// Add each connected vertex to the output string
		for (IntWritable v : values) {
			out += v.get() + ",";
		}
		
		context.write(new LongWritable(key.get()), new Text(out));
	}
	
}