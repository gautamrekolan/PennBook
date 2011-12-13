package edu.upenn.mkse.mkse212;

import java.io.IOException;

import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.*;

public class iterReducer extends Reducer<Text, Text, LongWritable, Text> {
	
	/**
	 * Input:	(vertex -> ["v2, v2Friends, v2Rank", "v3, v3Friends, v3Rank", ...]
	 * Output:	(vertex -> "newRank \t v2, v3, ...")
	 */
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
		
		double sum = 0.0;
		String edgesRaw = "";
		
		for (Text v : values) {
			String str = v.toString();
			
			if (str.contains("\t")) {
				// This is just raw intermediate graph data to keep track of the adjacency list
				String[] split = str.split("\t");
				if (split.length < 2) {
					edgesRaw = "";
				} else {
					edgesRaw = split[1];
				}
				
			} else {
				// This is backlink data simply containing the socialrank vote 'weight' from a backlink
				sum += Double.valueOf(str);
			}
			
		}
		
		// Compute the new social rank
		double newRank = 0.15 + 0.85 * sum;
		String out = newRank + "\t" + edgesRaw;
		
		context.write(new LongWritable( Long.valueOf(key.toString().trim()) ), new Text(out));
	}
	
}