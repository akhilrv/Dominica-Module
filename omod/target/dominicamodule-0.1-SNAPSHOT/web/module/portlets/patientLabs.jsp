<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:htmlInclude file="/scripts/jquery/jquery.min.js" />
<openmrs:htmlInclude file="/dwr/engine.js" ></openmrs:htmlInclude>
<openmrs:htmlInclude file="/dwr/util.js" ></openmrs:htmlInclude>





<h2><spring:message code="Example Patient Portlet Tab Without Controller" /></h2>


<select id="mylist">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select> 

<table border="0">
  <tr
    <th ALIGN=LEFT>Patient Name</th>
    <th id="name" ALIGN=LEFT> </th>
  </tr> 
<tr>
    <th ALIGN=LEFT>Patient Age</th>
    <th id="age" ALIGN=LEFT> </th>
  </tr>
<tr>
    <th ALIGN=LEFT>Patient Weight</th>
    <th id="weight" ALIGN=LEFT> </th>
  </tr>
</table> 


<!-- <a href="../openmrs/module/dominicamodule/pharmacyLandingPage.form">Pharmacist Screenxx</a> -->
<a href="module/dominicamodule/pharmacyLandingPage.form">Pharmacist Screenxx</a> 
<br> <br>


