﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fiche_niv_lge_2015.aspx.cs" Inherits="ESPOnline.Enseignants.Fiche_niv_lge_2015"
MasterPageFile="~/Enseignants/Ens.Master" %>
  <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Contents/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../Contents/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Contents/Scripts/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Contents/Scripts/JScript1.js"></script>


        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
            $("[src*=plus]").live("click", function () {
                $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
                $(this).attr("src", "../EnseignantsCUP/Styles/minus.png");
            });
            $("[src*=minus]").live("click", function () {
                $(this).attr("src", "../EnseignantsCUP/Styles/plus.png");
                $(this).closest("tr").next().remove();
            });
        </script>
              
<style type="text/css">
    .style1
    {
        text-align: center;
    }
    .style4
    {
        height: 56px;
    }
    .style6
    {
        height: 55px;
    }
    .style7
    {
        text-align: center;
        height: 73px;
        font-size: x-large;
    }
    .style8
    {
        font-size: x-large;
    }
    </style>

    <style type="text/css">
        .style9
        {
            color: #CC0000;
        }
        </style>

         <style type="text/css">
      
      table.grid tbody tr:hover {background-color:#e5ecf9;}
.GridHeaderStyle{color:#FEF7F7;background-color: #877d7d;font-weight: bold;}
.GridItemStyle{background-color:#eeeeee;color: Black;}
.GridAlternatingStyle{background-color:#dddddd;color: black;}
.GridSelectedStyle{background-color:#d6e6f6;color: black;}


.GridStyle
{
	border-bottom: white 2px ridge; 
	border-left: white 2px ridge; 
	background-color: white; 
	width: 100%; 
	border-top: white 2px ridge; 
	border-right: white 2px ridge; 
}
.ItemStyle {
	BACKGROUND-COLOR: #eeeeee; 
	COLOR: black;
	padding-bottom: 5px;
	padding-right: 3px;
	padding-top: 5px;
	padding-left: 3px;
	height: 25px
}

.ItemStyle td{
	BACKGROUND-COLOR: #eeeeee; 
	COLOR: black;
	padding-bottom: 5px;
	padding-right: 3px;
	padding-top: 5px;
	padding-left: 3px;
	height: 25px
}
.FixedHeaderStyle {
	BACKGROUND-COLOR:  #7591b1; 
	COLOR: #FFFFFF; 
	FONT-WEIGHT: bold;
	position:relative ;   
	top:expression(this.offsetParent.scrollTop);  
	z-index: 10;  
}
.Caption_1_Customer
{
	background-color:#beccda;
	color: #000000;
	width: 30%;
	height: 20px;
}
 #hurfDurf table
 .Gridstudent
    {
      
        margin-right:80px;
    }
      
          </style>

         <%-- style row color chnged--%>
         <style type="text/css">
  .successMerit {
    background-color: #1fa756;
    border: medium none;
    color: White;
  }
    .defaultColor
    {
        background-color: white;
        color: black;
    }
  .dangerFailed {
    background-color: #f2283a;
    color: White;
  }
</style>

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <%--  <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
<script src="../Contents/Scripts/ScrollableGridPlugin_ASP.NetAJAX_2.0.js" type="text/javascript"></script>
     <script type="text/javascript">
    $(document).ready(function () {
        $('#<%=Gridstudent.ClientID %>').Scrollable({
            ScrollHeight: 300,
         
        });
    });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
<center>
<h2 class="style9"> Historique niveaux de langue  </h2>
<br />
 <table>
<tr>
<td>
<asp:Label ID="Label1" runat="server">Choisissez l'année:&nbsp</asp:Label>
<asp:DropDownList ID="ddlannee_debM" runat="server" AppendDataBoundItems="true"  Width="150px"
   Height="30px"   AutoPostBack="true" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
       >
<asp:ListItem Value="0">Veuillez choisir</asp:ListItem>
<asp:ListItem >2014</asp:ListItem>
<asp:ListItem >2015</asp:ListItem>
</asp:DropDownList>

</td>

<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td>
    liste des clases:
<asp:DropDownList ID="ddclasse2" runat="server"  Width="150px"
   Height="30px"
    AutoPostBack="true" onselectedindexchanged="DropDownList2_SelectedIndexChanged1" 
         >

</asp:DropDownList>

</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>
<br />
<table>
<tr>
<td>
<asp:GridView runat="server" ID="Gridstudent" AutoGenerateColumns="False" 
   
                                                         Style="border-bottom: white 2px ridge; border-left: white 2px ridge;
                                                        background-color: white;  border-top: white 2px ridge; border-right: white 2px ridge;"
                                                        BorderWidth="0px" CellSpacing="1" CellPadding="3" CssClass="grid"
                                                        RowStyle-CssClass="ItemStyle" HeaderStyle-CssClass="FixedHeaderStyle"
                                                        GridLines="Both" EmptyDataRowStyle-CssClass="ItemStyle"  BackColor="#0099CC"
                                                  DataKeyNames="ID_ET"
                                                  OnRowDataBound="OnRowDataBound" 

                                                       >
                                                        <EmptyDataTemplate>
                                                            Pas d'enregistrement.
                                                        </EmptyDataTemplate>
                                                        
                                                        <HeaderStyle HorizontalAlign="Center"   BackColor="Red" />
                                                        <RowStyle HorizontalAlign="Center" CssClass="ItemStyle"></RowStyle>
                                                        <FooterStyle CssClass="ItemStyle" />
                                                        <EmptyDataRowStyle CssClass="ItemStyle"></EmptyDataRowStyle>
                                                        <RowStyle CssClass="GridItemStyle" />
                                                        <AlternatingRowStyle CssClass="GridAlternatingStyle" />
                                                        <HeaderStyle CssClass="GridHeaderStyle" />
                                                        <SelectedRowStyle CssClass="GridSelectedStyle" />
                                                        <Columns>    
                                                         <asp:TemplateField HeaderText="Historique" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="150px">
            <ItemTemplate>
                <img alt = "" style="cursor: pointer" src="../EnseignantsCUP/Styles/plus.png" />
                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass = "ChildGrid">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="id_et" HeaderText="Id_etudiant" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Langue" HeaderText="Langue" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="niveau_actuel" HeaderText="niveau actuel" />
                             <asp:BoundField ItemStyle-Width="150px" DataField="Date_niveau" HeaderText="Date"  DataFormatString="{0:d}" />
                              <asp:BoundField ItemStyle-Width="150px" DataField="NOM_ENS" HeaderText="Nom Enseigant" />
                             

                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
<asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="150px" >
  <ItemTemplate>
    <%# Container.DataItemIndex + 1 %>
  </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="Identifiant" ItemStyle-HorizontalAlign  ="Left"  ItemStyle-Width ="10%">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<% # Eval("ID_ET") %>'></asp:Label>
                        </ItemTemplate>
                     </asp:TemplateField>  
                                                            
<asp:TemplateField HeaderText="Nom et Prenom" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("NOM") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblnames2" runat="server" Text='<%# Eval("NOM") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Niveau Français" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="lablNature" runat="server" Text='<%# Eval("niveau_courant_fr") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlniveau_fr" DataTextField="niveau_courant_fr" DataValueField="niveau_courant_fr">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Niveau Anglais" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="labang" runat="server" Text='<%# Eval("niveau_courant_ang") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlniveau_ang" DataTextField="niveau_courant_ang" DataValueField="niveau_courant_ang">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
                                                       </Columns>
                                                      
                                                        <HeaderStyle CssClass="GridHeaderStyle" />
                                                        <RowStyle ForeColor="#000000"  />
                                                        <SelectedRowStyle CssClass="GridSelectedStyle" />
                                                    </asp:GridView>
</td>
</tr>
</table>
<br />
<asp:Button  ID="Button3" runat="server" Text="Exporter en excel" 
Height="50px" ForeColor="Black" BackColor="#CCCCCC"  CssClass="text-info" onclick="Button3_Click"  Visible="false" />
</center>


</asp:Content>
