@isTest
public class AwesomeCalculatorTest {
    @isTest static void testCallOut(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        //call the method that invokes a callout
        Double x = 1.0;
        Double y = 2.0;

        Double result =  AwesomeCalculator.add(x,y);
        //verify that a fake result is returned
        System.assertEquals(3.0, result);
    }
}