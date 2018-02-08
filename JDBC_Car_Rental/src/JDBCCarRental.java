import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.ResultSetMetaData;
	import java.sql.Statement;
	import javax.swing.*;
	import java.awt.*;
	import java.awt.event.*;
	import java.io.FileWriter;
	import java.io.PrintWriter;

		class JDBCCarRental extends JFrame implements ActionListener {
			
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;
			private JButton exportButtonCustomers = new JButton("Export All Data of customers");
			private JButton exportButtonCars = new JButton("Export All Data from cars");
			private JButton totalNumberOfCarsInStore = new JButton(" Export Total Number of cars");
			private JButton SearchCarsByCarTypeButton = new JButton("Type of car : ");
			private JButton groupByCarType = new JButton("Group by car type ");
			private JButton releaseYearAfterButton = new JButton("List of cars released after year :");
			private JButton dateDiffInRental = new JButton("Datediff in rental_ID :");
			private JButton searchCustomerByCarId=new JButton("Search customer by car_id :");
			private JTextField GenreIDTF=new JTextField(12);
			private JTextField releaseTF=new JTextField(12);
			private JTextField rentalIDTF=new JTextField(12);
			private JTextField customerIDTF=new JTextField(12);
			private Connection con = null;
			private Statement stmt = null;
			
			

			public JDBCCarRental(String str)
			{  
				super(str);
				getContentPane().setLayout(new GridLayout(6,2));
				initDBConnection();
				getContentPane().add(exportButtonCustomers);
				getContentPane().add(exportButtonCars);
				getContentPane().add(totalNumberOfCarsInStore);
				getContentPane().add(groupByCarType);
				getContentPane().add(SearchCarsByCarTypeButton);
				getContentPane().add(GenreIDTF);
				getContentPane().add(releaseYearAfterButton);
				getContentPane().add(releaseTF);
				getContentPane().add(dateDiffInRental);
				getContentPane().add(rentalIDTF);
				getContentPane().add(searchCustomerByCarId);
				getContentPane().add(customerIDTF);
				
				
				
				exportButtonCustomers.addActionListener(this);
				exportButtonCars.addActionListener(this);
				totalNumberOfCarsInStore.addActionListener(this);
				SearchCarsByCarTypeButton.addActionListener(this);
				releaseYearAfterButton.addActionListener(this);
				groupByCarType.addActionListener(this);
				dateDiffInRental.addActionListener(this);
				searchCustomerByCarId.addActionListener(this);
				
				setSize(500,200);
				setVisible(true);  
			}
			
			private void initDBConnection(){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/CarsRental";
				    con = DriverManager.getConnection(url, "root", "admin");
				    stmt = con.createStatement();
				}
				catch(Exception e){System.out.print("Failed to initialise DB Connection");
				}	
			}
		
			
			public void actionPerformed(ActionEvent e){
				Object target=e.getSource();
				ResultSet rs=null;
				String cmd = null;
				if (target.equals(exportButtonCustomers)){  		
					cmd="select * from customers;";			
				}else if (target.equals(exportButtonCars)){
					cmd="select * from Cars;";
				}
				else if(target.equals(totalNumberOfCarsInStore)){
					cmd="select count(*) from Cars";
				}
				else if(target.equals(SearchCarsByCarTypeButton)){
					String carType=GenreIDTF.getText();
					cmd="select * from Cars where carType= '"+carType+"';";
				}
				else if(target.equals(groupByCarType)){
					cmd="select carType,count(*) from Cars group by carType;";
					
				}
				else if(target.equals(dateDiffInRental)){
					String carRental=rentalIDTF.getText();
					cmd="select datediff(duedate,rentaldate) from Rental where rent_id= "+carRental;
				}
				else if(target.equals(searchCustomerByCarId)){
					String customerByCars=customerIDTF.getText();
					cmd="select firstname,lastname,town from customers inner join rental on Customers.cust_id=rental.cust_id where rental.car_id= "+customerByCars;
				}
				else{
					String registrationYearAfter=releaseTF.getText();
					cmd="select * from cars where carRegistrationYear> '"+registrationYearAfter+"';";
					
				}
				
				
				try{
					System.out.println("cmd is: "+cmd);
					
					rs= stmt.executeQuery(cmd); 	
					writeToFile(rs);
				}
				catch(Exception e1){e1.printStackTrace();}
			}		

			public static void main(String args[]) {
				new JDBCCarRental("CarRental Data Export");
			}
			
			
			private void writeToFile(ResultSet rs){
				try{
					FileWriter outputFile = new FileWriter("CarRentalOutput.csv");
					PrintWriter printWriter = new PrintWriter(outputFile);
					ResultSetMetaData rsmd = rs.getMetaData();
					int numColumns = rsmd.getColumnCount();
					
					for(int i=0;i<numColumns;i++){
						printWriter.print(rsmd.getColumnLabel(i+1)+",");
					}
					printWriter.print("\n");
					while(rs.next()){
						for(int i=0;i<numColumns;i++){
							printWriter.print(rs.getString(i+1)+",");
						}
						printWriter.print("\n");
						printWriter.flush();
					}
					printWriter.close();
				}
				catch(Exception e){e.printStackTrace();}
			

	} 
}



