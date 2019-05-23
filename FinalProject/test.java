import java.util.*;
import jess.*;
public class test
{
  public static void main (String [] args)
  {
    Scanner sc = new Scanner(System.in);
    String policyString = sc.nextLine();

    policyString = policyString.substring(1, policyString.length() -1); //Removes [] from string

    List<String> policies = new ArrayList<String>(Arrays.asList(policyString.split(",")));


  }
}
