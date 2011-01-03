/**
 * 
 */
package AddressBook.bean;

import java.util.List;

import javax.faces.event.ActionEvent;

import mypersistance.Addresses;
import mypersistance.AddressesDAO;
import mypersistance.EntityManagerHelper;

/**
 * @author Bwiz_Dual_PC
 *
 */
public class AddressBean {

	AddressesDAO myAddressesDAO;
	Addresses myAddress;
	List<Addresses> myAddresses = null;

	

	public AddressBean() {
		myAddress = new Addresses();
		myAddressesDAO = new AddressesDAO();
	}
	
	public Addresses getCurrentAddress(){
		return myAddress;
	}
	
	public void setCurrentAddress(Addresses newAddress){
		myAddress = newAddress;
	}
	
	public void editAction(ActionEvent evt) {
	    
		//myBean.setEditable(true);
		
		myAddress = myAddressesDAO.findById((Integer) evt.getComponent().getAttributes().get("theAddressID"));
		myAddress.setEditable(true);
		
		
	}
	 
	
	public String addAddress(){
		
		
		EntityManagerHelper.beginTransaction();
		myAddressesDAO.save(myAddress);
		EntityManagerHelper.commit();
		myAddress = new Addresses();
		return "success";
	}
	
	public void updateAddress(ActionEvent evt){
		
		myAddress.setEditable(false);		
		EntityManagerHelper.beginTransaction();
		myAddressesDAO.update(myAddress);
		EntityManagerHelper.commit();
		myAddress = new Addresses();
	}
	
	public void deleteAddress(ActionEvent evt){
		
		myAddress.setEditable(false);		
		EntityManagerHelper.beginTransaction();
		myAddressesDAO.delete(myAddress);
		EntityManagerHelper.commit();
		myAddress = new Addresses();
	}		
	
	public String searchByLastName(){
		if ( myAddress.getLastname() == null || myAddress.getLastname().equals("")){
			return "Failure";
		}else{
			return "Success";
		}
		
	}
	
	public List<Addresses> getAllAddresses(){
		if ( myAddress.getLastname() == null || myAddress.getLastname().equals("")){
			myAddresses = new AddressesDAO().findAll();
			return myAddresses;
		}else{
			myAddresses =  new AddressesDAO().findByLastname(myAddress.getLastname());
			return myAddresses;
		}
	}
	

	


}















