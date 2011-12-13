package edu.upenn.mkse.mkse212;

import java.io.IOException;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.*;

public class diff1Reducer extends Reducer<Text, Text, Text, Text> {
	
	/**
	 * Input is (vertex -> [oldRank, newRank])
	 * Output is (vertex -> rankDiff)
	 */
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
		double[] ranks = new double[2];
		
		// Break up the Iterable<Text> object
		int i = 0;
		for (Text v : values) {
			ranks[i] = Double.parseDouble(v.toString());
			i++;
		}
		
		// Compute the absolute difference between the old and new rank
		double diff = Math.abs(ranks[1] - ranks[0]);
		
		// Output this difference for all verticies
		context.write(key, new Text(String.valueOf(diff)));
		
	}
	
}