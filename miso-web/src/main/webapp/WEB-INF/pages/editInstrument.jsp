<%@ include file="../header.jsp" %>

<div id="maincontent">
  <div id="contentcolumn">
    <h1>
      <c:choose>
        <c:when test="${instrument.id == 0}">Create</c:when>
        <c:when test="${miso:isAdmin()}">Edit</c:when>
        <c:otherwise>View</c:otherwise>
      </c:choose>
      Instrument
      <c:if test="${miso:isAdmin()}">
        <button id="save" type="button" class="fg-button ui-state-default ui-corner-all">Save</button>
      </c:if>
    </h1>
    <div class="breadcrumbs">
      <ul>
        <li>
          <a href="<c:url value='/miso/'/>">Home</a>
        </li>
        <li>
          <a href='<c:url value="/miso/instruments"/>'>Instruments</a>
        </li>
      </ul>
    </div>
    <div class="sectionDivider" onclick="Utils.ui.toggleLeftInfo(jQuery('#note_arrowclick'), 'notediv');">Quick Help
      <div id="note_arrowclick" class="toggleLeft"></div>
    </div>
    <div id="notediv" class="note" style="display:none;">A Sequencer also tracks the data generated by the sequencer,
      via either a machine physically attached to a sequencer itself, or more commonly, a cluster or storage machine
      that holds the run directories.
    </div>
    
    <c:choose>
      <c:when test="${instrument.isOutOfService()}"><p class="big-warning">Out of Service</p></c:when>
      <c:when test="${not empty instrument.getOutOfServicePositions()}">
        <p class="big message-error">${instrument.getOutOfServicePositionsLabel()} out of service</p>
      </c:when>
    </c:choose>
    
    <form:form id="instrumentForm" data-parsley-validate="" autocomplete="off" acceptCharset="utf-8"></form:form>
    <script type="text/javascript">
      jQuery(document).ready(function () {
        FormUtils.createForm('instrumentForm', 'save', ${instrumentDto}, 'instrument', {
          isAdmin: ${miso:isAdmin()},
          instrumentTypes: ${instrumentTypes},
          instruments: ${otherInstruments},
          workstations: ${workstations}
        });
        Utils.ui.updateHelpLink(FormTarget.instrument.getUserManualUrl());
      });
    </script>
    
    <c:if test="${instrument.id != 0}">
      <div id="recordsHider" class="sectionDivider" onclick="Utils.ui.toggleLeftInfo(jQuery('#records_arrowclick'), 'recordsdiv');">
        <c:choose>
          <c:when test="${fn:length(serviceRecords) == 1}">1 Service Record</c:when>
          <c:otherwise>${fn:length(serviceRecords)} Service Records</c:otherwise>
        </c:choose>
        <div id="records_arrowclick" class="toggleLeft"></div>
      </div>
      <div id="recordsdiv" class="expandable_section" style="display:none;">
        <miso:list-section id="list_servicerecords" name="Service Records" target="servicerecord" alwaysShow="true" items="${serviceRecords}" config="{instrumentId: ${instrument.id}, retired: ${instrument.dateDecommissioned != null && instrument.upgradedInstrument == null}, hasPositions: ${not empty instrument.instrumentModel.positions}, userIsAdmin: ${miso:isAdmin()}}"/>
      </div>
      
      <br/>
      <c:if test="${instrument.instrumentModel.instrumentType eq 'SEQUENCER'}">
        <a id="runs"></a>
        <div class="sectionDivider">Runs
        </div>
        <h1>Runs</h1>
        <div style="clear:both">
          <table id="run_table">
          </table>
        </div>
        <script type="text/javascript">
          ListUtils.createTable('run_table', ListTarget.run, null, { sequencer : ${instrument.id} });
        </script>
      </c:if>
    </c:if>
    
  </div>
</div>

<%@ include file="adminsub.jsp" %>

<%@ include file="../footer.jsp" %>
