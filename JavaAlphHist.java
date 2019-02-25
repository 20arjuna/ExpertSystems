import java.util.*;
public class alphHistTest {
	public static void main (String [] args)
	{
		// Scanner Input
		Scanner sc = new Scanner (System.in);
		String input = sc.nextLine();


			input = input.toLowerCase();
			char [] letters = new char[input.length()];
			int [] ascii = new int[input.length()];
			int [] nums = new int[26];
			int ascii_num = 97;
			for (int i = 0; i < nums.length; i++)
			{
				nums[i] = ascii_num;
				ascii_num++;
			}
			for (int i = 0; i < input.length(); i++)
			{
				letters[i] = input.charAt(i);
				ascii[i] = (int) letters[i];
			}
			String answerValue = "";
			for (int i = 0; i < nums.length; i++)
			{
				int count = 0;
				char answer = 0;
				String noShow = "";
				int temp =0;
				for (int z = 0; z < ascii.length; z++)
				{
					temp = nums[i];
					if (ascii[z] == nums[i])
					{
						//answer = letters[z];
						count++;
					}


				}
				answerValue = Character.toString((char) temp) + " appears " + count + " times! " + "\n";
				System.out.println(answerValue);

				//answerValue += (answer + " appears " + count + " times! " + "\n");
				//if (count > 0)
				//{
					//answerValue += (answer + " appears " + count + " times! " + "\n");
				//}
				//else if (count == 0)
				//{
					//answerValue += (temp + " appears " + count + " times! " + "\n");
				//}

				//document.getElementById("output").innerHTML = answerValue + "\n\n" + noShowValue;
				//displayBox.value = answer + " appears " + count;

			}
			//System.out.println(answerValue);
			//System.out.println(noShowValue);



	}

}
