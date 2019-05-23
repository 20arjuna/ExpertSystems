import java.io.BufferedReader;
import java.io.FileReader;
import java.util.*;
public class csvTest {

	public static String[] getProperties(String sitename)
	{
		String [][] myArray = new String[4][6];
		Scanner scanIn = null;
		int Rowc = 0;
		int Row = 0;
		int Colc = 0;
		int Col = 0;
		String InputLine = "";
		double xnum = 0;
		String xfileLocation = "/Users/20arjuna/Desktop/Jess71p1/ExpertSystems/FinalProject/siteData.csv";
		
		try
		{
			scanIn = new Scanner(new BufferedReader (new FileReader(xfileLocation)));
			
			while(scanIn.hasNextLine())
			{
				InputLine = scanIn.nextLine();
				String [] InArray = InputLine.split(",");
				
				for(int x = 0; x < InArray.length; x++)
				{
					myArray[Rowc][x] = InArray[x];
				}
				Rowc++;
			}
			//System.out.println(Arrays.deepToString(myArray));
			
			for(String[] Array : myArray)
			{
				if(Array[0].equals(sitename))
				{
					return subArray(Array, 1, Array.length-1);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
	
	 // Generic function to get sub-array of a non-primitive array
     // between specified indices
	public static<T> T[] subArray(T[] array, int beg, int end) 
	{
		return Arrays.copyOfRange(array, beg, end + 1);
	}
	
	public static void main (String [] args)
	{
		String site = "digi.com";
		String [] properties = getProperties(site);
		System.out.println(Arrays.toString(properties));
	}

}
