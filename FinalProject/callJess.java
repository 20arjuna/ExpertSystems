import java.util.*;
import jess.*;
public class callJess
{
  public static void main (String [] args)
  {
    Scanner sc = new Scanner(System.in);
    String policyString = sc.nextLine();

    policyString = policyString.substring(1, policyString.length() -1); //Removes [] from string

    List<String> policies = new ArrayList<String>(Arrays.asList(policyString.split(",")));

    //Jess Stuff
    Rete engine = new Rete();
    try{
      Deffacts fact = new Deffacts("p", policies.get(0), engine);
      engine.addDeffacts(fact);
      engine.batch("Jess/testCode.clp");
    }
    catch (JessException ex) {
        System.err.println(ex);
    }


  }
}
