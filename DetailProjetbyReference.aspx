﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailProjetbyReference.aspx.cs" Inherits="DetailProjetbyReference" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <dx:ASPxFormLayout ID="FormLayoutTypeProjet" ClientInstanceName="FormLayoutTypeProjet" runat="server" ColCount="6" Width="100%">
                                                <Items>
                                                    <dx:LayoutGroup Caption="Détails projet" Width="100%" ColCount="4" ColSpan="6">
                                                        <Items>
                                                            <dx:LayoutItem Caption="Reference" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxTextBox ID="TxtRef" Height="25px" Theme="Office365" ClientEnabled="false" ClientInstanceName="TxtRef" runat="server" Width="100%"></dx:ASPxTextBox>

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Description" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxTextBox ID="TxtDescription" Height="25px" Theme="Office365" ClientInstanceName="TxtDescription" runat="server" Width="100%"></dx:ASPxTextBox>

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Phase du projet" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <dx:ASPxComboBox ID="TxttypePhase" TextField="description" ValueField="id" Height="25px" Theme="Office365" DataSourceID="SqlDataPhase" runat="server" Width="100%">
                                                                        </dx:ASPxComboBox>

                                                                        <asp:SqlDataSource ID="SqlDataPhase" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="GetPhase" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Type du projet" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDropDownEdit ID="DropDownTypeProjet" ClientInstanceName="DropDownTypeProjet" runat="server" Theme="Office365" Height="25px" Width="230px">
                                                                            <DropDownWindowTemplate>
                                                                                <dx:ASPxTreeList ID="treeListType" ClientInstanceName="treeListType" OnCustomJSProperties="DropDownTypeProjet_CustomJSProperties"
                                                                                    runat="server" Theme="Office365" AutoGenerateColumns="False" DataSourceID="SqlDataTypeProjet" KeyFieldName="id"
                                                                                    ParentFieldName="id_Parent" Height="140px" Width="100%">
                                                                                    <Columns>
                                                                                        <dx:TreeListTextColumn FieldName="id" Visible="false" VisibleIndex="0" />
                                                                                        <dx:TreeListTextColumn FieldName="Type" VisibleIndex="1" />

                                                                                    </Columns>
                                                                                    <SettingsBehavior AllowFocusedNode="true" AutoExpandAllNodes="true" />
                                                                                    <Settings ShowColumnHeaders="false" />
                                                                                    <ClientSideEvents NodeClick="function(s, e) 
                                  {
                                    if (e.nodeKey != null) 
                                     {
                                         DropDownTypeProjet.SetKeyValue(e.nodeKey);
                                         DropDownTypeProjet.SetText(treeListType.cpDepName[e.nodeKey]);
                                         DropDownTypeProjet.HideDropDown();
                                         
                                     }
                               }" />
                                                                                </dx:ASPxTreeList>

                                                                            </DropDownWindowTemplate>
                                                                        </dx:ASPxDropDownEdit>
                                                                        <asp:SqlDataSource ID="SqlDataTypeProjet" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="TypeProjet" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Client" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxComboBox ID="cmbClient" runat="server" ValueField="id" TextField="Client" Theme="Office365" Height="25px" DataSourceID="SqlDataClient" Width="100%">
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="SqlDataClient" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="GetClient" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Task force" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxComboBox ID="cmbTackForce" runat="server" Theme="Office365" Height="25px" Width="230px">
                                                                            <Items>
                                                                                <dx:ListEditItem Value="0" Text="Oui" />
                                                                                <dx:ListEditItem Value="1" Text="Non" />
                                                                            </Items>
                                                                        </dx:ASPxComboBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Classe du projet" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <dx:ASPxComboBox ID="cmbClasse" Height="25px" runat="server" Theme="Office365" Width="230px" ValueField="id" TextField="Classe" DataSourceID="SqlDataClasse">
                                                                        </dx:ASPxComboBox>

                                                                        <asp:SqlDataSource ID="SqlDataClasse" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="GetClasse" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="Type révision" ColSpan="3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxGridLookup ID="GridLookup" runat="server" SelectionMode="Multiple" DataSourceID="SqlDataTypeClasse" ClientInstanceName="gridLookup"
                                                                            KeyFieldName="id" TextFormatString="{0}" MultiTextSeparator=", " Theme="Office365" Height="25px" Width="230px">
                                                                            <Columns>
                                                                                <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                                                                                <dx:GridViewDataColumn FieldName="TypeClasse" />
                                                                                <dx:GridViewDataColumn FieldName="Description" Settings-AllowAutoFilter="False" />
                                                                            </Columns>
                                                                            <GridViewProperties>
                                                                                <Templates>
                                                                                    <StatusBar>
                                                                                        <table class="OptionsTable" style="float: right">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </StatusBar>
                                                                                </Templates>
                                                                                <Settings ShowColumnHeaders="false" ShowFilterRow="false" ShowStatusBar="Hidden" />
                                                                                <SettingsPager PageSize="7" EnableAdaptivity="true" />
                                                                            </GridViewProperties>
                                                                        </dx:ASPxGridLookup>

                                                                        <asp:SqlDataSource ID="SqlDataTypeClasse" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="GetTypeClasse" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Période projet" Width="100%" ColCount="4" ColSpan="6">
                                                        <Items>
                                                            <dx:LayoutItem Caption="Date début" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDateEdit ID="txtDateDebut" ClientInstanceName="txtDateDebut" Height="25px" runat="server" Width="100%" Theme="Office365">


                                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                                <ErrorFrameStyle ImageSpacing="4px">
                                                                                    <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                                                                                </ErrorFrameStyle>
                                                                            </ValidationSettings>

                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>

                                                            <dx:LayoutItem Caption="Date Fin" ColSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxDateEdit ID="TxtDateFin" ClientInstanceName="TxtDateFin" Height="25px" runat="server" Width="100%" Theme="Office365">
                                                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                                <ErrorFrameStyle ImageSpacing="4px">
                                                                                    <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                                                                                </ErrorFrameStyle>
                                                                            </ValidationSettings>

                                                                        </dx:ASPxDateEdit>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>

                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Discipline projet" Width="33%" ColCount="4" ColSpan="2">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="4">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer >

                                                                        <dx:ASPxGridView ID="GridDiscipline" runat="server" Width="100%" Theme="Office365" 
                                                                            KeyFieldName="Abreviation"
                                                                            DataSourceID="SqlDataDiscipline" AutoGenerateColumns="False">
                                                                            <Columns>
                                                                                <dx:GridViewDataTextColumn FieldName="Abreviation" Width="50px" VisibleIndex="1">
                                                                                </dx:GridViewDataTextColumn>
                                                                                <dx:GridViewDataTextColumn FieldName="Designation" Width="100%" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                </dx:GridViewDataTextColumn>
                                                                            </Columns>

                                                                            <SettingsPager PageSize="10" Visible="false"  >
                                                                                <PageSizeItemSettings Visible="false" Position="Right" >
                                                                                    
                                                                                </PageSizeItemSettings>
                                                                                
                                                                            </SettingsPager>
                                                                            <SettingsBehavior AllowFocusedRow="true" />
                                                                            <Settings ShowColumnHeaders="false" ShowFooter="true" VerticalScrollBarMode="Visible" VerticalScrollableHeight="160"></Settings>

                                                                        </dx:ASPxGridView>
                                                                        <asp:SqlDataSource ID="SqlDataDiscipline" runat="server" ConnectionString="<%$ ConnectionStrings:erpExperienceConnectionString %>"
                                                                            SelectCommand="GetDisciplineByProjet" SelectCommandType="StoredProcedure">
                                                                            <SelectParameters >
                                                                                <asp:Parameter Name="Reference" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>


                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>




                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Remarque de client" Width="33%" ColCount="4" ColSpan="2">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="4">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer >

                                                                          <dx:ASPxMemo ID="MemoClient" runat="server"  Height="200px" Width="100%"></dx:ASPxMemo>

                                                                        

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Remarque à projet" Width="33%" ColCount="4" ColSpan="2">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" ColSpan="4">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer >
                                                                        <dx:ASPxMemo ID="MemoRemarqProjet" runat="server"  Height="200px" Width="100%"></dx:ASPxMemo>


                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup Caption="Filter" ShowCaption="False" Width="100%" ColSpan="6" SettingsItems-HorizontalAlign="Right">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>

                                                                        <dx:ASPxButton ID="btnConfirmer" ClientInstanceName="btnConfirmer" runat="server"
                                                                            AutoPostBack="False" Text="Fermer" Width="130px" Theme="Glass">
                                                                            <ClientSideEvents Click="function(s, e) {
                                                                       parent.window.popupWind.Hide();
                                                                    }
                                                                    
                                                                    " />
                                                                            <Image Height="18px" Width="18px" Url="~/Image/save.gif">
                                                                            </Image>
                                                                        </dx:ASPxButton>

                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>



                                                        </Items>

                                                        <SettingsItems HorizontalAlign="Right"></SettingsItems>
                                                    </dx:LayoutGroup>
                                                </Items>
                                            </dx:ASPxFormLayout>
    </div>
    </form>
</body>
</html>
