import java.util.*;
public class test
{
  public static void main (String [] args)
  {
    Scanner sc = new Scanner(System.in);
    String g = sc.nextLine();
    ArrayList<String> characteristics = new ArrayList<String>();
    for(int i =1; i < g.length()-1; i++)
    {
      if(inQuotes(g.substring(i-1, i)), (g.substring(i,i+1)), (g.substring(i+1,i+2)))
      {
        characteristics.add(g.substring(i, i+1));
      }
    }
    System.out.println(g);
    System.out.println(g.getClass().getName());
  }
  public boolean inQuotes (String letter, String behind, String inFront)
  {
    boolean answer = false;
    if(behind.equals(inFront) && behind.equals("\""))
    {
      answer = true;
    }
    return answer;
  }
}
