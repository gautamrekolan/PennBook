package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.*;

public class finishReducer extends Reducer<Text, Text, Text, Text> {
	
	/**
	 * 
	 * Input is (1/rank -> vertex)
	 * Output is (vertex -> rank)
	 */
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
		for (Text v : values) {
			// Revert the inversion of ranks we did in the mapper
			String rank = String.valueOf(1 / Double.parseDouble(key.toString()));
			// Flip back the key / value
			context.write(v, new Text(rank));
		}
		
	}
	
}