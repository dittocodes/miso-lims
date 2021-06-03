<%--
  ~ Copyright (c) 2012. The Genome Analysis Centre, Norwich, UK

  ~ MISO project contacts: Robert Davey @ TGAC
  ~ **********************************************************************
  ~
  ~ This file is part of MISO.
  ~
  ~ MISO is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ MISO is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with MISO.  If not, see <http://www.gnu.org/licenses/>.
  ~
  ~ **********************************************************************
  --%>
<%@ include file="../header.jsp" %>

<div id="maincontent">
<div id="contentcolumn">

<h1>
  <c:choose><c:when test="${pageMode eq 'create'}">Create</c:when><c:otherwise>Edit</c:otherwise></c:choose> Array Run
  <button id="save" type="button" class="fg-button ui-state-default ui-corner-all">Save</button>
</h1>

<form:form id="arrayrunForm" data-parsley-validate="" autocomplete="off" acceptCharset="utf-8"></form:form>
<script>
jQuery(document).ready(function() {
  var config = {
    isAdmin: ${miso:isAdmin()}
  };
  <c:if test="${pageMode eq 'create'}">
    config.instruments = ${arrayScanners};
  </c:if>
  FormUtils.createForm('arrayrunForm', 'save', ${pageMode eq 'create' ? '{}' : arrayRunJson}, 'arrayrun', config);
  Utils.ui.updateHelpLink(FormTarget.arrayrun.getUserManualUrl());
});
</script>

<br/>
<h1>Samples</h1>
<table id="listingSamplesTable" class="display"></table>

<c:if test="${pageMode eq 'edit'}">
  <miso:changelog item="${arrayRun}"/>
</c:if>

</div>
</div>

<%@ include file="adminsub.jsp" %>
<%@ include file="../footer.jsp" %>
