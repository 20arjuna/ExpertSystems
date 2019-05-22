import java.util.*;
public class test
{
  public static void main (String [] args)
  {
    Scanner sc = new Scanner(System.in);
    String policyString = sc.nextLine();

    policies = policyString.substring(1, g.length() -1); //Removes [] from string

    List<String> policies = new ArrayList<String>(Arrays.asList(policyString.split(",")));
    

  }
}
