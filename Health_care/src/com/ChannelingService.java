package com;

import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.jsoup.Jsoup;

import com.Channeling;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Path("/Channeling")
public class ChannelingService {
	
Channeling channelObj = new Channeling();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)

	public String readDoctor() {
		
		return channelObj.readchannel();
		
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertchannel(@FormParam("patientName") String patientName,
	 @FormParam("doctorName") String doctorName,
	 @FormParam("hospitalName") String hospitalName,
	 @FormParam("specialization") String specialization,
	 @FormParam("date") String date)
	{
	 String output = channelObj.insertChannel(patientName,doctorName,hospitalName,specialization,date);
	return output;
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updatechannel(String channelData)
	{
	//Convert the input string to a JSON object
	 JsonObject itemObject = new JsonParser().parse(channelData).getAsJsonObject();
	//Read the values from the JSON object
	 String channelingCode  = itemObject.get("channelingCode").getAsString();
	 String patientName = itemObject.get("patientName").getAsString();
	 String doctorName = itemObject.get("doctorName").getAsString();
	 String hospitalName = itemObject.get("hospitalName").getAsString();
	 String specialization= itemObject.get("specialization").getAsString();
	 String date= itemObject.get("date").getAsString();
	 String output = channelObj.updatechannel(channelingCode,patientName,doctorName,hospitalName, specialization,date);
	return output;
}
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	
	public String deletechannel(String channelData)
	{
	  //Convert the input string to an XML document
		Document doc = Jsoup.parse(channelData, "",Parser.xmlParser()); 

	 String channelingCode = doc.select("channelingCode").text();
	 String output = channelObj.deletechannel(channelingCode);
	return output; 
}
}
