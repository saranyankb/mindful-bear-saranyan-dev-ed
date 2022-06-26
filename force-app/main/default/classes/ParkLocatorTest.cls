@isTest
public class ParkLocatorTest {
    @isTest static void testCallOut(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        parkService.ParksImplPort parkserv = new parkService.ParksImplPort();
        String country = 'India';
        String[] strResult = new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        String[] result = ParkLocator.country(country);
        System.assertEquals(result, strResult);       
    }
}