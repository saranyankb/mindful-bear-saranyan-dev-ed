global class ParkServiceMock implements WebServiceMock{
    
    global void doInvoke(
    	Object stub,
    	Object request,
    	Map<String, Object> response,
    	String endpoint,
    	String soapAction,
    	String requestName,
    	String responseNs,
    	String responseName,
        String responseType){
            parkService.ParksImplPort parkserv = new parkService.ParksImplPort();
            //start - specify the response you want to send
            parkService.byCountryResponse response_x =
                new parkService.byCountryResponse();
            String[] result = new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
            response_x.return_x = result;
            response.put('response_x', response_x);
        }

}