<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%><%@taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%><%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>My JSF 'MyAddresses.jsp' starting page</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="myCSS.css">
	

</head>
  
<body>
	<f:view>
		<h1> Lab 4 Address Book</h1>
		<hr />
		<h:panelGrid border="10" columns="2" cellspacing="100">
			<h:form>
			<h3>Add new Record:</h3>
				<h:panelGrid border="1" columns="2">
					<h:inputHidden id="addressID" value="#{AddressBean.currentAddress.addressid }"></h:inputHidden>
					<h:inputHidden></h:inputHidden>
					<h:outputText value="First Name*"></h:outputText>
					<h:inputText id="firstName" value="#{AddressBean.currentAddress.firstname }"></h:inputText>
					<h:outputText value="Last Name*"></h:outputText>
					<h:inputText id="lastName" value="#{AddressBean.currentAddress.lastname }"></h:inputText>
					<h:outputText value="Street*"></h:outputText>
					<h:inputText id="street" value="#{AddressBean.currentAddress.street }"></h:inputText>
					<h:outputText value="City*"></h:outputText>
					<h:inputText id="city" value="#{AddressBean.currentAddress.city }"></h:inputText>
					<h:outputText value="State*"></h:outputText>
					<h:inputText id="state" value="#{AddressBean.currentAddress.state }"></h:inputText>
					<h:outputText value="Zip*"></h:outputText>
					<h:inputText id="zip" value="#{AddressBean.currentAddress.zip }"></h:inputText>
					<h:outputText value="Email Address*"></h:outputText>
					<h:inputText id="emailAddress" value="#{AddressBean.currentAddress.emailaddress }"></h:inputText>
					<h:outputText value="Phone Number*"></h:outputText>
					<h:inputText id="phoneNumber" value="#{AddressBean.currentAddress.phonenumber }"></h:inputText>
				</h:panelGrid>
					<h:commandButton value="Add" action="#{AddressBean.addAddress }"></h:commandButton>
					<h:commandButton value="Clear" type="reset"></h:commandButton>				
			</h:form>
			
			<h:form >
			<h3>Search for Address by Last Name:</h3>
			<h:panelGrid border="1" columns="3">
			<!--<h:outputText value="Search for Address by Last Name:"></h:outputText>-->
			<h:inputText id="emailAddress" value="#{AddressBean.currentAddress.lastname }"></h:inputText>
			<h:commandButton value="Search" action="#{AddressBean.searchByLastName }"></h:commandButton>
			
			</h:panelGrid>
			
			</h:form>
			</h:panelGrid>
			
			<hr />

<h:form>
			<h:dataTable id="myDataTable" border="1" value="#{AddressBean.allAddresses }" var="myAddresses" styleClass="addressTable"
			headerClass="addressHeader" columnClasses="oddColumn,evenColumn,oddColumn,evenColumn,oddColumn,evenColumn,oddColumn,evenColumn,oddColumn" >
			
			<f:facet name="header"><h:outputText value="List of Addresses"/></f:facet>
				<h:column >
					<f:facet name="header">
						<h:outputText value="ID" />
					</f:facet>
					<h:outputText value="#{myAddresses.addressid}" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.addressid}" rendered="#{not myAddresses.editable}" />					
				</h:column>
			
				<h:column>
					<f:facet name="header">
						<h:outputText value="First Name" />
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.firstname}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.firstname}" rendered="#{not myAddresses.editable}" />					
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Last Name" ></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.lastname}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.lastname}" rendered="#{not myAddresses.editable}" />					
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Street" ></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.street}" size="30" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.street}" rendered="#{not myAddresses.editable}" />					
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="City"></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.city}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.city}" rendered="#{not myAddresses.editable}" />							
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="State"></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.state}" size="5" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.state}" rendered="#{not myAddresses.editable}" />							
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Zip Code"></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.zip}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.zip}" rendered="#{not myAddresses.editable}" />						
					
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Email Address"></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.emailaddress}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.emailaddress}" rendered="#{not myAddresses.editable}" />					
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Phone Number"></h:outputText>
					</f:facet>
    				<h:inputText value="#{AddressBean.currentAddress.phonenumber}" size="10" rendered="#{myAddresses.editable}" />
    				<h:outputText value="#{myAddresses.phonenumber}" rendered="#{not myAddresses.editable}" />							
				</h:column>
				
				<h:column> 
				<f:facet name="header"><h:outputText value="Action"></h:outputText></f:facet>
				
					<h:commandButton value="Edit" actionListener="#{AddressBean.editAction}" rendered="#{not myAddresses.editable}">
					<f:attribute name="theAddressID" value="#{myAddresses.addressid }"/>
					</h:commandButton>
					<h:commandButton value="Save" actionListener="#{AddressBean.updateAddress}" rendered="#{ myAddresses.editable}">
					</h:commandButton>		
								
					<h:commandButton value="Delete" actionListener="#{AddressBean.deleteAddress}" rendered="#{ myAddresses.editable}">
					</h:commandButton>										
				</h:column>
			
			</h:dataTable>
			</h:form>
		</f:view>
</body>
</html>



