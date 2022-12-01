﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailPriorite.aspx.cs" Inherits="DetailPriorite" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript">

            function Callprojet() {
                GridPrioritbyRef.PerformCallback();
            }

        </script>

</head>
<body>
    <form id="form1" runat="server">

          


        <div>
            <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="5" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Projet" Width="100%" ColCount="5" ColSpan="5">
                        <Items>
                            <dx:LayoutItem Caption="Type" ShowCaption="False" ColSpan="1" Width="80px">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxComboBox ID="cmbAffaire" ClientInstanceName="cmbAffaire" Width="200px"
                                            TextField="Reference" ValueField="Reference" runat="server" DataSourceID="SqlAffaire">
                                            <ClientSideEvents TextChanged="Callprojet" />
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlAffaire" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                            SelectCommand="GetAffaireByPriority" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>



                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>


            <dx:ASPxGridView ID="GridPrioritbyRef" ClientInstanceName="GridPrioritbyRef" DataSourceID="SqlDataPriority" OnCustomCallback="GridPriority_CustomCallback"
               OnLoad="GridPriority_Load"
                KeyFieldName="id" Width="100%" Theme="Metropolis" runat="server">
                <SettingsText Title="Liste documents" />
                
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>

                   
                    <dx:GridViewDataTextColumn FieldName="Description"  Caption="" GroupIndex="0" SortIndex="0" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="CodeDocument"  Caption="Code"  VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="2" Visible="false" Width="30px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="descp" Caption="Titre du document" Width="100%" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>

                <SettingsPager PageSize="10" EnableAdaptivity="true">
                    <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                    </PageSizeItemSettings>
                </SettingsPager>
                <SettingsBehavior AutoExpandAllGroups="True" AllowFocusedRow="true" />
                <Settings ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" ShowGroupedColumns="false" ShowColumnHeaders="false" ShowTitlePanel="true"
                    VerticalScrollableHeight="300" VerticalScrollBarMode="Visible"></Settings>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataPriority" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                SelectCommand="GetPriorityByReference" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="Reference" />
                </SelectParameters>
            </asp:SqlDataSource>


            <dx:ASPxPopupControl ID="PupImportPriority" ClientInstanceName="PupImportPriority" runat="server" Theme="Glass" Modal="true" ShowShadow="true" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" Width="600px">
              <ClientSideEvents Init="function(s, e) {
	                                                    var popup = window.parent;
	                                                    popup.window['PupImportPriority'] = PupImportPriority;}
" />
    <HeaderStyle>
        <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    </HeaderStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <div>
               
                <table style="width: 100%;">
                
                    <tr style="text-align: center;">
                        <td align="center" colspan="7">
                            <div>
                               
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="B_ImportPCQ" runat="server" ImageUrl="~/image/save.gif" Visible="False"  OnClick="B_ImportPCQP_Click"  />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="B_UploadPCQP" runat="server" ImageUrl="~/image/action_up.gif" OnClick="B_UploadPCQP_Click"  />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <br>
                          </br>
                            </div>
                          
                        </td>
                    </tr>
                </table>

                 <table style="width: 100%; text-align: Left">
                    <tr>
                        <td>
                            <div runat="server" id="lblMessage" style="font-size: 14px;color:Red;">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

        </div>
    </form>
</body>
</html>
