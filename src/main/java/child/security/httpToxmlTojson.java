package child.security;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;



public class httpToxmlTojson
{
    public static void main(String[] args) 
    {
    	
    	
    	
    	
    }
  
    public String getXmlData(String addr) {
        
        URL naverUrl;
           StringBuffer sb = new StringBuffer();
           JSONObject obj=null;
           System.out.print(addr);
           try {

                // URL에 주소명을 직접 입력해서 좌표를 가져오기위한 부분
        	   
               naverUrl = new URL("http://map.naver.com/api/geocode.php?key=8c36c72309be8ab6abd5d527cb472e0f&encoding=utf-8&coord=latlng&query="+addr+"");
                          
               BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream(),"utf-8"));
               String inputLine;
                
               while ((inputLine = in.readLine()) != null){
                        sb.append(inputLine.trim());
               }
                        in.close();
                       System.out.println("yahoo: "+ sb.toString());
               
                       obj = (JSONObject)new XMLSerializer().read(sb.toString());
                       System.out.println("obj: "+obj);
           } catch (Exception e) {
               e.printStackTrace();
           } 
           return obj.toString();  
       }


    
    
    
    
    
}