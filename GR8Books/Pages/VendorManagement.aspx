﻿<%@ Page Title="Vendor Management" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/Dashboard.Master" CodeBehind="VendorManagement.aspx.vb" Inherits="GR8Books.VendorManagement" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript">                
        $(document).ready(function () {
            $('.txtTINNO').click(
                function () {
                    $(".txtTINNO").mask("000-000-000");
                });
            $('.txtTINNO').keypress(
                function () {
                    $(".txtTINNO").mask("000-000-000");
                });
            $('.txtBranchCode').click(
                function () {
                    $(".txtBranchCode").mask("00000");
                });
            $('.txtBranchCode').keypress(
                function () {
                    $(".txtBranchCode").mask("00000");
                });
            $('.txtTelephone').click(
                function () {
                    $(".txtTelephone").mask("(999)-999-9999");
                });
            $('.txtTelephone').keypress(
                function () {
                    $(".txtTelephone").mask("(999)-999-9999");
                });
            $('.txtCellphone').click(
                function () {
                    $(".txtCellphone").mask("0999-999-9999");
                });
            $('.txtCellphone').keypress(
                function () {
                    $(".txtCellphone").mask("0999-999-9999");
                });
            $(".btnSave").click(function () {
                if (Page_IsValid) {
                    if (confirm("Are you sure you want to save?")) {

                    }
                    else {
                        return false;
                    }
                }
            });

            $('#<%= ddlClassification.ClientID%>').change(function () {
                if ($('#<%=ddlClassification.ClientID%> :selected').text() == "Individual") {
                    $(".txtVendorName").val("N/A");
                    $(".txtFirstName").val("");
                    $(".txtMiddleName").val("");
                    $(".txtLastName").val("");
                    $(".txtSuffixName").val("");
                    $(".txtFirstName").prop("readonly", false);
                    $(".txtMiddleName").prop("readonly", false);
                    $(".txtLastName").prop("readonly", false);
                    $(".txtSuffixName").prop("readonly", false);
                    $(".txtVendorName").prop("readonly", true);
                        return;
                    }
                  else if ($('#<%=ddlClassification.ClientID%> :selected').text() == "Non-Individual") {
                    $(".txtFirstName").prop("readonly", true);
                    $(".txtMiddleName").prop("readonly", true);
                    $(".txtLastName").prop("readonly", true);
                    $(".txtSuffixName").prop("readonly", true);
                    $(".txtVendorName").prop("readonly", false);
                    $(".txtFirstName").val("N/A");
                    $(".txtMiddleName").val("N/A");
                    $(".txtLastName").val("N/A");
                    $(".txtSuffixName").val("N/A");
                    $(".txtVendorName").val("");
                      return;
                  }
                  else {
                      $(".txtFirstName").prop("readonly", true);
                      $(".txtMiddleName").prop("readonly", true);
                      $(".txtLastName").prop("readonly", true);
                      $(".txtSuffixName").prop("readonly", true);
                    $(".txtVendorName").prop("readonly", true);
                      return;
                  }
              });
        });
    </script>


    <%-- Save Position --%>
    <script type="text/javascript">
        $(function () {
            $('[id*=btnSavePosition]').click(function () {
                if (Page_IsValid) {
                    var UserDetail = {};
                    UserDetail.Position = $('[id*=txtModalPosition]').val();
                    $.ajax({
                        type: "POST",
                        url: "VendorManagement.aspx/SavePosition",
                        data: '{Position :' + JSON.stringify(UserDetail) + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            alert(response.d);
                            $('.modalPosition').modal('hide')
                            return false;
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        },
                        error: function (response) {
                            alert(response.responseText);
                        }
                    });
                }
            });
        });
    </script>

    <asp:Panel runat="server" ID="panelVendor">
        <div class="row mb-2">
             <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Classification:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList ID="ddlClassification" runat="server" EnableViewState="true" AppendDataBoundItems="true" class="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Small" Display="Dynamic" ID="RequiredFieldValidator20" runat="Server" ControlToValidate="ddlClassification" InitialValue="--Select Classification--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Vendor Code:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtVendorCode" runat="server" class="form-control" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator1" runat="Server" ControlToValidate="txtVendorCode" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Vendor name:" runat="server" Style="color: #000000" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtVendorName" runat="server" class="txtVendorName form-control" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator3" runat="Server" ControlToValidate="txtVendorName" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Last Name:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtLastName" runat="server" class="txtLastName form-control"  autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"   ID="RequiredFieldValidator21" runat="Server" ControlToValidate="txtLastName" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

         <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="First Name:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtFirstName" runat="server" class="txtFirstName form-control"  autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"   ID="RequiredFieldValidator22" runat="Server" ControlToValidate="txtFirstName" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Middle Name:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtMiddleName" runat="server" class="txtMiddleName form-control"  autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"   ID="RequiredFieldValidator23" runat="Server" ControlToValidate="txtMiddleName" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Suffix Name:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtSuffixName" runat="server" class="txtSuffixName form-control"  autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="TIN:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtTINNO" class="txtTINNO form-control" autocomplete="off" runat="server" Placeholder="000-000-000" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator2" runat="Server" ControlToValidate="txtTINNO" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Branch Code:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtBranchCode" class="txtBranchCode form-control" autocomplete="off" runat="server" Placeholder="00000" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Terms:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlTerms" class="form-control" AppendDataBoundItems="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator4" runat="Server" ControlToValidate="ddlTerms" InitialValue="--Select Terms--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>     
        </div>

       <div class="row mb-2">
          <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Cut off (days):" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtCutOff" runat="server" class="form-control" TextMode="Number" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator6" runat="Server" ControlToValidate="txtCutOff" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
              <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="VAT type:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList ID="ddlVAT_Type" runat="server" EnableViewState="true" AppendDataBoundItems="true" class="form-control"></asp:DropDownList>
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator5" runat="Server" ControlToValidate="ddlVAT_Type" InitialValue="--Select VAT Type--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
              <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Account No:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtAccountNo" runat="server" class="form-control" TextMode="Number"  autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">

            </div>
        </div>


        <%--Address--%>
        <div class="row mt-4">
            <div class="col">
                <h6>
                    <asp:Label Text="Address" runat="server" Style="color: #808080" /></h6>
                <hr />
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Lot/Unit:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtLot_Unit" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Blk/Bldg:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtBlk_Bldg" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Street:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtStreet" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Subdivision:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtSubd" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Region:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlRegion" class="form-control" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Region_Changed">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator8" runat="Server" ControlToValidate="ddlRegion" InitialValue="--Select Region--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Province:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlProvince" class="form-control" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="Province_Changed">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator9" runat="Server" ControlToValidate="ddlProvince" InitialValue="--Select Province--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="City/Municipality:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlCityMun" class="form-control" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="CityMun_Changed">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator10" runat="Server" ControlToValidate="ddlCityMun" InitialValue="--Select City/Municipality--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Barangay:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:DropDownList runat="server" ID="ddlBarangay" class="form-control" AppendDataBoundItems="true" AutoPostBack="true" EnableViewState="true">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator11" runat="Server" ControlToValidate="ddlBarangay" InitialValue="--Select Barangay--" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="ZipCode:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtZipCode" runat="server" class="form-control" TextMode="Number" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator7" runat="Server" ControlToValidate="txtZipCode" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <%-- Contact --%>
        <div class="row mt-4">
            <div class="col">
                <h6>
                    <asp:Label Text="Contact Details" runat="server" Style="color: #808080" /></h6>
                <hr />
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Contact person:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator12" runat="Server" ControlToValidate="txtContactPerson" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Position:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtPosition" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Telephone no.:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtTelephone" runat="server" class="form-control txtTelephone" autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Cellphone no.:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtCellphone" runat="server" class="form-control txtCellphone" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator13" runat="Server" ControlToValidate="txtCellphone" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Fax:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtFax" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Email Address:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" autocomplete="off" />
                         <asp:RequiredFieldValidator Forecolor="Red" Font-size="Small"    Display="Dynamic"  ID="RequiredFieldValidator14" runat="Server" ControlToValidate="txtEmail" ErrorMessage="Field is required." ValidationGroup="g"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-3 my-auto">
                        <asp:Label Text="Website:" runat="server" />
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtWebsite" runat="server" class="form-control" autocomplete="off" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-end mb-4">
            <div class="col-2">
                <asp:Button Text="Save" ID="btnSave" class="btnSave btn btn-primary btn-block" runat="server" ValidationGroup="g" />
            </div>
            <div class="col-2">
                <asp:Button Text="Cancel" ID="btnCancel" class="btnCancel btn btn-primary btn-block" runat="server" />
            </div>
        </div>
    </asp:Panel>

</asp:Content>
