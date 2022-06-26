public class ParkLocator {
    
    public static String[] country(String countryName){
        parkService.ParksImplPort parkserv = new parkService.ParksImplPort();
        return parkserv.byCountry(countryName);
    }

}