package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.*;

public class diff2Reducer extends Reducer<Text, Text, Text, Text> {
	
	/**
	 * Input is (graph -> [rankDiff1, rankDiff2, ... ]
	 * Output is (graph -> greatest rank diff)
	 */
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
		double largestDiff = 0;
		
		// Grab the largest value from the (randomly sorted) array
		for (Text v : values) {
			double diff = Double.parseDouble(v.toString());
			if (diff > largestDiff)
				largestDiff = diff;
		}
		
		context.write(key, new Text(String.valueOf(largestDiff)));
		
	}
	
}