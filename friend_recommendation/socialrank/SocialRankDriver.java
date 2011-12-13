package edu.upenn.mkse.mkse212;

import org.apache.hadoop.mapreduce.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import edu.upenn.mkse.mkse212.initMapper;
import edu.upenn.mkse.mkse212.initReducer;
import edu.upenn.mkse.mkse212.iterMapper;
import edu.upenn.mkse.mkse212.iterReducer;
import edu.upenn.mkse.mkse212.diff1Mapper;
import edu.upenn.mkse.mkse212.diff1Reducer;
import edu.upenn.mkse.mkse212.diff2Mapper;
import edu.upenn.mkse.mkse212.diff2Reducer;
import edu.upenn.mkse.mkse212.finishMapper;
import edu.upenn.mkse.mkse212.finishReducer;

public class SocialRankDriver {
	
	public static void main(String[] args) throws Exception {
		
		if (args.length < 3) {
			System.err.println("Usage: SocialRankDriver <SocialRank function> " +
					"[three function-specific arguments]");
			System.exit(-1);
		}
		
		// Grab the first command line argument to determine which function to run
		String fun = args[0];
		
		// Create a new job using this driver
		Job job = new Job();
		job.setJarByClass(SocialRankDriver.class);
				
		if (fun.equals("init") || fun.equals("iter") || fun.equals("finish")) {
			// Set the I/O paths
			FileInputFormat.addInputPath(job, new Path(args[1]));
			FileOutputFormat.setOutputPath(job, new Path(args[2]));

		    // Set number of reducers
		    job.setNumReduceTasks(Integer.parseInt(args[3]));
		    
		}
		
		if (fun.equals("init")) {
			// Select the mapper and reducer
		    job.setMapperClass(initMapper.class);
		    job.setReducerClass(initReducer.class);
		    
		    job.setOutputKeyClass(IntWritable.class);
		    job.setOutputValueClass(IntWritable.class);
		    
		} else if (fun.equals("iter")) {
			// Select the mapper and reducer
		    job.setMapperClass(iterMapper.class);
		    job.setReducerClass(iterReducer.class);
		    
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
		    
		} else if (fun.equals("diff1")) {
			// Set the I/O paths
			FileInputFormat.addInputPaths(job, args[1] + "," + args[2]);
			FileOutputFormat.setOutputPath(job, new Path(args[3]));
			
			// Select the mapper and reducer
		    job.setMapperClass(diff1Mapper.class);
		    job.setReducerClass(diff1Reducer.class);
		    
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
			
		} else if (fun.equals("diff2")) {
			// Set the I/O paths
			FileInputFormat.addInputPath(job, new Path(args[1]));
			FileOutputFormat.setOutputPath(job, new Path(args[2]));
			
			// Select the mapper and reducer
		    job.setMapperClass(diff2Mapper.class);
		    job.setReducerClass(diff2Reducer.class);
		    
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
			
		} else if (fun.equals("finish")) {
			// Select the mapper and reducer
		    job.setMapperClass(finishMapper.class);
		    job.setReducerClass(finishReducer.class);
		    
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
		}
		
		// Run the job and then exit
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
	
	/**
	 * Helper function to parse raw input edge list
	 * 
	 * @param 	raw string input of the form "{int} \t {int}"
	 * @return	integer list where first element is vertex 1 
	 * 			and second element is vertex 2
	 */
	public static int[] parseEdge(String raw) {
		int tab = raw.indexOf("\t");
		String v1 = raw.substring(0, tab);
		String v2 = raw.substring(tab + 1);
		
		if (v1 == null || v2 == null)
			return null;
		
		return new int[] {Integer.parseInt(v1), Integer.parseInt(v2)};
	}
	
	/**
	 * Helper function to parse Text representation of intermediate value
	 * 
	 * @param	raw String of "rank \t v2,v3,..."
	 * @return	array containing {rank, v2, v3, }
	 */
	public static long[] parseIntermediate(String raw) {
		int tab = raw.indexOf("\t");
		String rankString = raw.substring(0, tab);
		
		long rank = Long.parseLong(rankString);
		String edgesRaw = raw.substring(tab + 5);
		String[] edges = edgesRaw.split(",");
		
		long[] parsed = new long[1 + edges.length];
		parsed[0] = rank;
		for (int i = 1; i < parsed.length; i++) {
			parsed[i] = Long.parseLong(edges[i - 1]);
		}
		
		return parsed;
	}
	
}