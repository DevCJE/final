package child.document.model;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.*;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.Drive.Files;
import com.google.api.client.extensions.java6.auth.oauth2.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Quickstart2 {
	//������ ���� ���� ȹ��
    /** Application name. */
    private static final String APPLICATION_NAME =
        "Drive API Java Quickstart";

    /** Directory to store user credentials for this application. */
    private static final java.io.File DATA_STORE_DIR = new java.io.File(
        System.getProperty("user.home"), ".credentials/1/drive-java-quickstart");

    /** Global instance of the {@link FileDataStoreFactory}. */
    private static FileDataStoreFactory DATA_STORE_FACTORY;

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY =
        JacksonFactory.getDefaultInstance();

    /** Global instance of the HTTP transport. */
    private static HttpTransport HTTP_TRANSPORT;

    /** Global instance of the scopes required by this quickstart.
     *
     * If modifying these scopes, delete your previously saved credentials
     * at ~/.credentials/drive-java-quickstart
     */
    private static final List<String> SCOPES =
        Arrays.asList(DriveScopes.DRIVE, DriveScopes.DRIVE_APPDATA, DriveScopes.DRIVE_APPS_READONLY, DriveScopes.DRIVE_FILE, DriveScopes.DRIVE_METADATA, DriveScopes.DRIVE_METADATA_READONLY, DriveScopes.DRIVE_PHOTOS_READONLY, DriveScopes.DRIVE_READONLY, DriveScopes.DRIVE_SCRIPTS);
    
    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * Creates an authorized Credential object.
     * @return an authorized Credential object.
     * @throws IOException
     */
    //����ȹ��
    public Credential authorize() throws IOException {
        // Load client secrets.
        InputStream in =
            Quickstart2.class.getResourceAsStream("/client_secret.json");
        GoogleClientSecrets clientSecrets =
            GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(DATA_STORE_FACTORY)
                .setAccessType("offline")
                .build();
        Credential credential = new AuthorizationCodeInstalledApp(
            flow, new LocalServerReceiver()).authorize("user");
       // System.out.println(
       //         "Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
        return credential;
    }

    /**
     * Build and return an authorized Drive client service.
     * @return an authorized Drive client service
     * @throws IOException
     */
    public  Drive getDriveService() throws IOException {
        Credential credential = authorize();
        return new Drive.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }

    public Map<String,Object> getList() throws IOException {
        // Build a new authorized API client service.
        Drive service = getDriveService();

        // Print the names and IDs for up to 10 files.
        FileList result = service.files().list()
        		.setQ("'0B39rt7XEI2ZEZVJpU2JycTd5UE0' in parents and mimeType!='application/vnd.google-apps.folder' and "
        				+ "title = 'Kinder-계획안-' or title = 'Kinder-식단표-' or title = 'Kinder-연간보육계획안-' "
        				+ "or title = 'Kinder-주간 업무 보고-' or title = 'Kinder-일반휴가신청서-'"
        				+ "and trashed=false")
             .setMaxResults(30)
             .execute();
        List<File> files = result.getItems();
        List<String> files2 = new ArrayList<String>();
        List<String> files3 = new ArrayList<String>();
        List<String> files4 = new ArrayList<String>();
        if (files == null || files.size() == 0) {
            System.out.println("No files found.");
        } else {
            //System.out.println("Files:");
            for (int i=0; i<files.size(); i++) {
                //System.out.printf("%s (%s)\n", files.get(i).getTitle(),files.get(i).getAlternateLink());
                files2.add(i, files.get(i).getTitle());
                files3.add(i, files.get(i).getId());
                files4.add(i, files.get(i).getLastViewedByMeDate().toString().substring(0,10));
            }
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("filename", files2);
        map.put("fileurl", files3);
        map.put("DateTime", files4);
        
        return map;
    }
    
    public Map<String,Object> printFile(String fileId, String subject) throws IOException {
    	Drive service = getDriveService();
    	
        try {
          File file = service.files().get(fileId).execute();
          File file2 = new File();
  		
          file2.setTitle(subject);
          
          File result = service.files().copy(fileId, file2).execute();
          
          String url = result.getAlternateLink();
          String id = result.getId();
          
          Map<String,Object> map = new HashMap<String, Object>();
          map.put("url", url);
          map.put("id", id);
          
          return map;
        } 
        catch (IOException e) {
          System.out.println("An error occured: " + e);
          return null;
        }
      }
    
    public String updateFile(String fileId, String subject) throws IOException{
    	Drive service = getDriveService();
    	try {
    	      File file = new File();
    	      file.setTitle(subject);

    	      // Rename the file.
    	      Files.Patch patchRequest = service.files().patch(fileId, file);
    	      patchRequest.setFields("title");

    	      File updatedFile = patchRequest.execute();
    	      String url = service.files().get(fileId).execute().getEmbedLink();
    	      
    	      return url;
    	    } 
    	catch (IOException e) {
    	      System.out.println("An error occurred: " + e);
    	      return null;
    	}
    }
    
    public String editFile(String subject) throws IOException{
    	Drive service = getDriveService();
    	FileList list = service.files().list().setQ("title = '"+subject+"'").execute();
    	
    	List<File> files = list.getItems();
    	
    	String url = files.get(0).getAlternateLink();
    	
    	return url;
    }
    
    public String getUrl(String subject) throws IOException {
    	Drive service = getDriveService();
    	
    	FileList list = service.files().list().setQ("title = '"+subject+"'").execute();
    	List<File> files = list.getItems();
    	String url = files.get(0).getEmbedLink();
    	
    	return url;
    }
    
}