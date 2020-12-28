package child.imgur;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.imageio.ImageIO;

import com.google.api.client.util.Base64;
 

public class ImgurImageUpload{
	
	 public static String imgurUpload(File file) throws IOException {
		 
		 	BufferedImage image = ImageIO.read(file);
		    ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
		    ImageIO.write(image, "png", byteArray);
		    byte[] byteImage = byteArray.toByteArray();
		    String dataImage = Base64.encodeBase64String(byteImage);
		    String data = URLEncoder.encode("image", "UTF-8") + "="
		    + URLEncoder.encode(dataImage, "UTF-8");
		 
     URL url;
     String clientID = "caaca3aef25a39a";
     url = new URL("https://api.imgur.com/3/image");
     HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     conn.setDoOutput(true);
     conn.setDoInput(true);
     conn.setRequestMethod("POST");
     conn.setRequestProperty("Authorization", "Client-ID " + clientID);
     conn.setRequestMethod("POST");
     conn.setRequestProperty("Content-Type",
             "application/x-www-form-urlencoded");
     conn.connect();
     StringBuilder stb = new StringBuilder();
     OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
     wr.write(data);
     wr.flush();
     // Get the response
     BufferedReader rd = new BufferedReader(
             new InputStreamReader(conn.getInputStream()));
     String line;
     while ((line = rd.readLine()) != null) {
         stb.append(line).append("\n");
     }
     wr.close();
     rd.close();
     
     return stb.toString();
 }
 
}
