<%@ include file="/WEB-INF/template/include.jsp"%>
<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />
<openmrs:htmlInclude file="/scripts/jquery/autocomplete/OpenmrsAutoComplete.js" />

<spring:hasBindErrors name="order">
    <openmrs:message code="fix.error"/>
    <br />
</spring:hasBindErrors>

<spring:hasBindErrors name="drugOrderExtension">
    <openmrs:message code="fix.error"/>
    <br />
</spring:hasBindErrors>

<!--<p><a href="module/dominicamodule/portlets/editpatientdrugs.form" class="newDrugOrder">Add New Drug Order</a></p>-->
<h2>Add Drug Order</h2>    
<b class="boxHeader">Place Drug Order</b>
<form action="module/dominicamodule/editpatientdrugs.form" method="post" class="box" id="drugOrderExtensionForm">
    <input type="hidden" name="orderId" value="${order.orderId }" />
    <input type="hidden" name="doeId" value="${drugOrderExtension.id }" /> 
    <table>
        <tr>
            <td valign="top">Drug (Related Concept)</td>
            <td valign="top">
        <spring:bind path="order.concept">
            <c:choose>
                    <c:when test="${renewReadOnly}">
                        <input type="hidden" name="${status.expression}" value="${status.editor.value.id}" readonly/>
                        <input readonly="readonly" value="${order.concept.name.name}" />
                    </c:when>
                    <c:otherwise>
                        <openmrs:fieldGen type="org.openmrs.Concept" formFieldName="${status.expression}" val="${status.editor.value}"/>
                        <c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
                    </c:otherwise>
            </c:choose>    
        </spring:bind>
        <div id="allergyAlert" style="color: red"></div>
        </td>
        </tr>

        
        <c:choose>
            
                    <c:when test="${renewReadOnly}">
<!--                        <tr><td>Renewed Order  </td>-->
                        <spring:bind path="drugOrderExtension.renewedOrderId">
                        <input type="hidden" name="${status.expression}" value="${status.value}"/>
<%--                        <td><input readonly="readonly" value="${drugOrderExtension.renewedOrderId}" /></td>--%>
                        </spring:bind>
                        <!--</tr>-->
                    </c:when>
                    <c:otherwise>                        
                    </c:otherwise>                    
        </c:choose> 
                    
                    
        <tr>
            <td valign="top">Start date</td>
            <td valign="top">

            <%--            <openmrs:fieldGen type="java.util.Date" formFieldName="${status.expression}" val="${status.editor.value}" parameters="noBind=true"/>            --%>
            <c:choose>
                    <c:when test="${renewReadOnly}">
                        <input type="text" name="orderStartDate" value="${orderStartDate}" readonly/>
                    </c:when>
                    <c:otherwise>
                        <openmrs:fieldGen type="java.util.Date" formFieldName="orderStartDate" val="${orderStartDate}" />
                       <%--<input type="text" id="orderStartDate" name="orderStartDate" value="${orderStartDate}" onfocus="showcalendar()"/>--%>
                           <%--<c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>--%>
                    </c:otherwise>
            </c:choose>
               

        </td>
        </tr>

        <tr>
            <td valign="top">Duration</td>
            <td valign="top">
        <spring:bind path="drugOrderExtension.duration">
            <openmrs:fieldGen type="java.lang.Integer" formFieldName="${status.expression}" val="${status.editor.value}" />
            <c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
        </spring:bind>
        <spring:bind path="drugOrderExtension.durationUnit">            
        <select name="${status.expression}">
            <c:forEach items="${dUnits}" begin="0" end="${n_dUnits}" var="p" varStatus="status1">
                    <option value="${status1.count-2}"
                            <c:if test="${ status1.count-2 == status.value}">selected</c:if>>
                            ${p}</option>
	    </c:forEach>
        </select>
        </spring:bind>    
        </td>
        </tr>

        <tr>
            <td valign="top">Dose</td>
            <td valign="top">
        <spring:bind path="order.dose">
            <openmrs:fieldGen type="java.lang.Double" formFieldName="${status.expression}" val="${status.editor.value}" />
            <c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
        </spring:bind>
        
        
            Units
            <spring:bind path="order.units">
            
                <select name="${status.expression}">
                    <c:forEach items="${units}" begin="0" end="${n_units}" var="p" varStatus="status1">
                    <option value="${status1.count-2}"
                            <c:if test="${ status1.count-2 == status.value}">selected</c:if>>
                            ${p}</option>
                    </c:forEach>
                </select>
            </td>
            </spring:bind>
        </tr>

        <tr>
        <spring:bind path="order.frequency">
            <td valign="top">Frequency</td>
            <td valign="top">
                <select name="${status.expression}">
                    <c:forEach items="${freq}" begin="0" end="${n_freq}" var="p" varStatus="status1">
                    <option value="${status1.count-1}"
                            <c:if test="${ status1.count-1 == status.value}">selected</c:if>>
                            ${p}</option>
                    </c:forEach>
                </select>                
            </td>
         </spring:bind>   
        </tr>

        <tr>
            <td valign="top">Quantity</td>
            <td valign="top">
        <spring:bind path="order.quantity">
            <openmrs:fieldGen type="java.lang.Integer" formFieldName="${status.expression}" val="${status.editor.value}" />
            <c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
        </spring:bind>
        </td>
        </tr>


        <tr>
            <td valign="top">Instructions (optional)</td>
            <td valign="top">
        <spring:bind path="order.instructions">
            <openmrs:fieldGen type="java.lang.String" formFieldName="${status.expression}" val="${status.value}" parameters="fieldLength=40" />
            <c:if test="${status.errorMessage != ''}"><span class="error">${status.errorMessage}</span></c:if>
        </spring:bind>
        </td>
        </tr>


        <tr>
            <td valign="top">Route of Administration</td>
            <td valign="top">            
                <spring:bind path="drugOrderExtension.routeOfAdministration">
                <select name="${status.expression}">
                    <c:forEach items="${route}" begin="0" end="${n_route}" var="p" varStatus="status1">
                    <option value="${status1.count-1}"
                            <c:if test="${ status1.count-1 == status.value}">selected</c:if>>
                            ${p}</option>
                    </c:forEach>
                </select>
                </spring:bind>    
            </td>
        </tr>
    </table>
    <br />       
    <input type="hidden" name="patientId" value="${patientid}"/>  
    <a href="http://www.epocrates.com/online" target="_blank"> Check for Drug Interaction </a><br>
    <c:choose>
            <c:when test="${orderEditable}">
                <input type="submit" name="saveOrder" value="Save Order" />
            </c:when>
            <c:otherwise>
                <input type="submit" name="saveOrder" value="Save Order" disabled="disabled"/>
            </c:otherwise>               
    </c:choose>
     <div id="validationAlert" style="color: red"></div>                
</form>    

    
<c:if test="${order.discontinued}">
	<br />
	<form action="module/dominicamodule/editpatientdrugs.form" method="post" class="box">            
                    
            <input type="hidden" name="orderId" value="${order.orderId }" /> 
            <input type="hidden" name="patientId" value="${patientid}"/>                          
		<input type="submit"
			value='<spring:message code="Order.undiscontinueOrder"/>'
			name="undiscontinueOrder" />
	</form>
</c:if>

<c:if test="${not order.discontinued and not empty order.orderId}">
	<br />
	<form action="module/dominicamodule/editpatientdrugs.form" method="post" class="box">            
                    
            <input type="hidden" name="orderId" value="${order.orderId }" /> 
            <input type="hidden" name="patientId" value="${patientid}"/>              
		<table>
			<tr id="dateDiscontinued">
				<td valign="top"><spring:message
						code="general.dateDiscontinued" /></td>
				<td valign="top"><spring:bind path="order.discontinuedDate">
						<openmrs:fieldGen type="java.util.Date"
							formFieldName="${status.expression}" val="${status.editor.value}" />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>
			<tr id="discontinuedReason">
				<td valign="top"><spring:message
						code="general.discontinuedReason" /></td>
				<td valign="top"><spring:bind path="order.discontinuedReason">
						<openmrs:fieldGen type="org.openmrs.Concept"
							formFieldName="${status.expression}" val="${status.editor.value}" />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>
		</table>
		<input type="submit" name="discontinueOrder"
			value='<spring:message code="Order.discontinueOrder"/>' />
	</form>
</c:if>
    
    
<c:if test="${not order.voided and not empty order.orderId and orderEditable}">
        <br />
        <form action="module/dominicamodule/editpatientdrugs.form" method="post" class="box">
            <input type="hidden" name="patientId" value="${patientid}"/>             
                    
            <input type="hidden" name="orderId" value="${order.orderId }" /> 
                <spring:message code="general.voidReason" />
                <spring:bind path="order.voidReason">
                <input type="text" value="${status.value}" size="40" name="${status.expression }" />
                <spring:hasBindErrors name="order">
                        <c:forEach items="${errors.allErrors}" var="error">
                                <c:if test="${error.code == 'voidReason'}">
                                        <span class="error"><spring:message
                                                        code="${error.defaultMessage}" text="${error.defaultMessage}" />
                                        </span>
                                </c:if>
                        </c:forEach>
                </spring:hasBindErrors>
                </spring:bind>
                <input type="submit" name="voidDrugOrder"
                        value='<spring:message code="Order.voidOrder"/>' />
        </form>                                        
</c:if>

<script type="text/javascript">
    var drugStartDatePicker;
    var allergens="${allergyList}";
    var allergenArray=allergens.split(",");
    var $j=jQuery.noConflict();                
        $j(document).ready(function() {
        drugStartDatePicker = new DatePicker("<openmrs:datePattern/>", "orderStartDate", {defaultDate: parseDateFromStringToJs("<openmrs:datePattern/>", "${today}")});            
     //drugStartDatePicker = new DatePicker("<openmrs:datePattern/>", "orderStartDate", {defaultDate: parseDateFromStringToJs("<openmrs:datePattern/>", "${order.startDate}")});            
        $j('#concept_id_selection').blur(function(){
        var a=$j(this).val();        
        var flag=0;
        for (var i=0;i<allergenArray.length;i++)
        {        
            if (allergenArray[i]==a) {         
        
                flag=1;
        };    
        };
        if (flag==1){
             $j('#allergyAlert').html("*** Patient Allergic to these drugs : "+allergens+" ***");
        }
        else if(flag==0) 
        {
            $j('#allergyAlert').html("");
        }
    });
    
    
    
    $j("form#drugOrderExtensionForm.box").submit(function(e) {
                            // check validation                                                       
                            var valid=validateForm();
                            if (valid!=true){
                                $j('#validationAlert').html('*** '+valid+' ***');
                                return false;
                            }                                                            
     });
    
    function validateForm(){
            //console.log('In validate function.');
            var message="";
            var concept=$j('form#drugOrderExtensionForm.box #concept_id_selection').val();
            
            if (concept===''){
                return "Empty Drug : Please enter a drug to order";
            }
            var startDate=$j('form#drugOrderExtensionForm.box #orderStartDate').val();
            
            if (startDate===''){
                return "Empty Start Date : Please enter a start date to order";
            }
            
            var dur=$j('form#drugOrderExtensionForm.box #duration').val();
            if (dur==='' || isNaN(dur) || dur<=0){
                return "Empty Duration : Please enter a duration(number above 0) to order";
            }
            
            var dur_unit=$j('form#drugOrderExtensionForm.box select[name="durationUnit"]').val();                        
            if (dur_unit<0){
                return "Empty Duration Unit : Please choose a duration unit";
            }
            
            var dose=$j('form#drugOrderExtensionForm.box #dose').val();            
            if (dose==='' || isNaN(dose) || dose<=0){
                return "Empty Dose : Please enter a dose(number above 0)";
            }
            
            var dose_unit=$j('form#drugOrderExtensionForm.box select[name="units"]').val();            
            if (dose_unit<0){
                return "Empty Dose Unit : Please choose a dose unit";
            }
            
//            var frequency=$j('select[name="frequency"]').val();
//            if (frequency){
//                return "Empty Frequency : Please choose a frequency";
//            }
            
            var quantity=$j('form#drugOrderExtensionForm.box #quantity').val();
            if (quantity==='' || isNaN(quantity) || quantity<=0){
                return "Empty Quantity : Please enter a Quantity(number above 0) to order";
            }
            
            var instructions=$j('form#drugOrderExtensionForm.box #instructions').val();
            if (instructions===''){
                return "Empty Instructions : Please enter Instructions to order";
            }
        
//            var route=$j('select[name="routeOfAdministration"]').val();
//            if (!!route){
//                return "Empty Route of Administration : Please choose a Route of Administration";
//            }
                                   
            return true;            
    };
        
    });  
</script>    