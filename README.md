# sapestore
An eCommerce book retail store web application


Setting up SapeStore on local system 

/*************************Set up required software and tools*********************************/

1. Download Eclipse Mars from
	www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2

2. Extract the zip file to suitable location.
3. Install mySQL server from
	https://drive.google.com/open?id=16BQqVYygN7Cz0pJD5G0CDx1O6EfB_ZZW
4. Install mySQL GUI Tools from
	https://drive.google.com/open?id=1zZK93Y2S5vHz2vsMDRK2tS1UCoHJxe5t
5. Download Mongo db zip from, and extract to suitable location
	https://drive.google.com/open?id=1ACNCpJj-L4uK4RupVal7eCpCnAjKTHgM

/*****************************************Set up Source Code***********************************/

6. a)Clone the Project's Source Code from
	link
		OR
   b)Download the zip file and extract it to suitable location
	https://drive.google.com/open?id=1sL9V3gM1uFjMXrMS506uOjka-aGst2I6
7. Run eclipse.exe present at location specified in step 2.
8. Choose workspace as the location in step 6.
9. Go to 'Help' option, then Eclipse Marketplace. Search for 'sts' i.e., Spring Tool Suite; and install it.
10. Click the File option -> import ->existing Maven Project. Click Next
11. Browse to the location in step 6 then click finish. Wait for the project to be imported.
12. Right click on POM.xml and run maven clean, followed by maven install.

/***************************************Set up SQL Databases************************************/

13. Download the sql database dump from
	https://drive.google.com/open?id=1f9mz2Gm6DGqK11XOysg8LMn0Du-l63qo
14. Open MySQL Administrator. Click on Restore -> Open Backup File.
15. Browse to the sql file downloaded at step 13.
16. Under Target schema, choose another schema option and type 'sapestore' as schema name. 
17. Then click on Start Restore. Then close.

/***************************************Set up Mongo db*****************************************/

20. Browse to installation directory of mongo and open cmd under bin
21. Run the following command to setup workspace for mongodb
	>mongod -dbpath D:\Sapient Training\sapestoremongodb(or any other desired location)
22. Run another command prompt from the same directory, and run following commands:
	>mongo
	>use sapestoremongodb
	>db.createCollection("description")
	>db.createCollection("review")



/***************************************Running the application**********************************/

23. In Eclipse, right click on the project select Run As->Spring Boot App
24. Open a web browser; open localhost: http://localhost:8090/sapestore/
