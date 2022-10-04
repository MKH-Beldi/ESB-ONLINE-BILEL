﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plan_Etude.aspx.cs" Inherits="ESPOnline.EmploiEsp.Plan_Etude"
MasterPageFile="~/Direction/Site2.Master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
       <script type="text/javascript" src="../Css-Template/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Css-Template/js/image_slide.js"></script>
     <script type="text/javascript" src="../Css-Template/js/modernizr-1.5.min.js"></script>

      <link href="../Media/layout.css" rel="stylesheet" type="text/css" />
    <link href="../DayPilotProJavaScriptTrial_7.9.1418/demo/themes/areas.css" rel="stylesheet" type="text/css" />
    <link href="../DayPilotProJavaScriptTrial_7.9.1418/demo/themes/calendar_green.css" rel="stylesheet" type="text/css" />
    <link href='../DayPilotProJavaScriptTrial_7.9.1418/demo/themes/navigator_green.css' rel="stylesheet" type="text/css" />
    <link href='../DayPilotProJavaScriptTrial_7.9.1418/demo/themes/menu_default.css' rel="stylesheet" type="text/css" />
    <link href='../DayPilotProJavaScriptTrial_7.9.1418/demo/themes/bubble_default.css' rel="stylesheet" type="text/css" />
    <script src="../Scripts/DayPilot/modal.js" type="text/javascript"></script>
    <script src="../Scripts/DayPilot/event_handling.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript" ></script>


    <style type="text/css">
    
    .container { 
 width:100%; }

.align-left { 
 float: left;
 width:50%; 
 height:20%;
 } 

 .align-right{
 float: right; 
 height:20%;
 width:50%
 }
    
    </style>
    <script language='JavaScript' type='text/JavaScript'>

        function OpenPopWindow() {
            var url = "PopUpAjoutEmploi.aspx";

            window.open(url, "popUp", "width=480, height=500, top=0, left=0, menubar=no, resizable=no, " +
                        "scrollbars=yes, status=no", '');
        }
 
    </script>
    <style type="text/css">
        .style1
        {
            font-size: large;
            font-weight: bold;
            color: #800000;
        }
        .style3
        {
            font-size: large;
            color: #FFFFFF;
            height: 34px;
        }
        .style4
        {
            height: 34px;
        }
        .style5
        {
            font-size: medium;
            font-weight: bold;
            color: #800000;
            height: 34px;
        }
        .style7
        {
            font-size: large;
            font-weight: normal;
            color: #FF0000;
            height: 34px;
        }
        .style8
        {
            font-size: medium;
            color: #800000;
            height: 34px;
            font-family: "Times New Roman", Times, serif;
        }
        .style9
        {
            font-size: medium;
            font-weight: normal;
            color: #800000;
            height: 34px;
            font-family: "Times New Roman", Times, serif;
        }
        .style10
        {
            font-size: medium;
            font-weight: bold;
            color: #800000;
            height: 34px;
            font-family: "Times New Roman", Times, serif;
        }
        .style11
        {
            font-size: medium;
            font-weight: bold;
            color: #000000;
            height: 34px;
        }
        .style12
        {
            font-family: "Times New Roman", Times, serif;
        }
        .style13
        {
            color: black;
            font-family: "Times New Roman", Times, serif;
        }
        .style16
        {
            font-size: medium;
            height: 34px;
            font-family: "Times New Roman", Times, serif;
        }
        .style18
        {
            color: #FFFFFF;
        }
        .style19
        {
            font-size: large;
            color: #FFFFFF;
        }
    </style>
  <%--script of changing place in  calendar--%>
    <script type="text/javascript">
        var globalMouseX = 0;
        var globalMouseY = 0;
        var detectedMouseUp = false;
        var detectedSelectionChanged = false
        ASPxClientUtils.AttachEventToElement(document, "mousemove", createEventHandler("OnMouseMove"));
        ASPxClientUtils.AttachEventToElement(document, "mouseup", createEventHandler("OnMouseUp"));
        function OnMouseMove(evt) {
            globalMouseX = ASPxClientUtils.GetEventX(evt);
            globalMouseY = ASPxClientUtils.GetEventY(evt);
            detectedSelectionChanged = false;
            detectedMouseUp = false;
        }
        function OnMouseUp(evt) {
            detectedMouseUp = true;
            ShowToolTip();
        }
        function createEventHandler(funcName) {
            return new Function("event", funcName + "(event);");
        }
        function OnSelectionChanged(s, e) {
            if (!scheduler.isAllowEvent)
                return;
            detectedSelectionChanged = true;
            ShowToolTip();
        }
        function ShowToolTip() {
            if (detectedSelectionChanged && detectedMouseUp) {
                scheduler.ShowSelectionToolTip(globalMouseX, globalMouseY);
                detectedSelectionChanged = false;
                detectedMouseUp = false;
            }
        }
        function OnBeginCallback() {
            delete scheduler.isAllowEvent;
        }
        function OnEndCallback() {
            scheduler.isAllowEvent = true;
        }
        function OnControlInitialized() {
            scheduler.isAllowEvent = true;
        }
    </script>
  <%--<link rel="stylesheet" type="text/css" href="../Stylesmaha/style.css" />--%>
     <style type="text/css">
    

table.grid tbody tr:hover {background-color:#e5ecf9;}
.GridHeaderStyle{color:#FEF7F7;background-color: #E80707;font-weight: bold;}
.GridItemStyle{background-color:#eeeeee;color: black;}
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

     
     </style>

</asp:Content>
    
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    <h1><span class="navigator_green_day">ENREGISTRER UN EMPLOI DU TEMPS</h1>
        <h1>
 </span>
        </h1>
        
    <h1><span class="style13">ANNEE UNIVERSITAIRE </span><span class="style12">:  <asp:Label ID="lblanneedeb" runat="server" CssClass="style7"></asp:Label>/<asp:Label 
            ID="lblanneefin" runat="server" CssClass="style7"></asp:Label></span></h1>
            <h1>
                <strong>
            <span class="style16">SEMESTRE : </span>
            <span class="style8"> <asp:Label ID="lblsemestre" runat="server" 
                    style="font-size: large"></asp:Label>
                </span>
        </strong>
        </h1>
        <hr />
        
        <table >
        
     <td class="navigator_green_day"> <h1 class="navigator_green_day">Veuillez choisir la classe :</h1></td>   
         <td>
         <asp:DropDownList runat="server" ID="ddlcodclasse" 
         
          AutoPostBack="true"  AppendDataBoundItems="True" 
                            onselectedindexchanged="DdlPromotion_SelectedIndexChanged">
          <asp:ListItem>--Veuillez choisir la classe-- </asp:ListItem>
                    </asp:DropDownList></td>
        </table>
        
        </center>
       
        <table><tr>
       <td><h3><asp:Label ID="Label5" runat="server" CssClass="navigator_green_day"></asp:Label>
        <asp:Label ID="lblcodecl" runat="server" CssClass="navigator_green_day"></asp:Label></h3></td></tr>
       <tr>
        <td><asp:GridView runat="server" ID="Gridemp" AutoGenerateColumns="False"  AutoGenerateSelectButton="True"
                                                         OnPageIndexChanging="gridView_PageIndexChanging" 
                                                        Style="border-bottom: white 2px ridge; border-left: white 2px ridge;
                                                        background-color: white; width: 100%; border-top: white 2px ridge; border-right: white 2px ridge;"
                                                        BorderWidth="0px" BorderColor="Red" CellSpacing="1" CellPadding="3" CssClass="grid"
                                                        RowStyle-CssClass="ItemStyle" HeaderStyle-CssClass="FixedHeaderStyle" Width="100%"
                                                        GridLines="Both" EmptyDataRowStyle-CssClass="ItemStyle"  DataKeyNames="ID_ENS" BackColor="#0099CC" 
                                                       onrowupdating ="GrdEmpData_RowUpdating"
                                                       OnSelectedIndexChanged="Gridview1_SelectedIndexChanged"
                                                       OnRowDataBound="GridView1_RowDataBound"
                                                      
                                                       >
                                                        
 
                                                        <HeaderStyle HorizontalAlign="Center" Height="20" />
                                                        <RowStyle HorizontalAlign="Center" CssClass="ItemStyle"></RowStyle>
                                                        <FooterStyle CssClass="ItemStyle" />
                                                        <EmptyDataRowStyle CssClass="ItemStyle"></EmptyDataRowStyle>
                                                        <RowStyle CssClass="GridItemStyle" />
                                                        <AlternatingRowStyle CssClass="GridAlternatingStyle" />
                                                        <HeaderStyle CssClass="GridHeaderStyle" />
                                                        <SelectedRowStyle CssClass="GridSelectedStyle" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:ImageButton runat="server" ID="imgAddNew" ImageUrl="~/Css-Template/listimage/images/add.png" alt="" CausesValidation="false"
                                                                        Style="cursor: hand;" ImageAlign="Middle"   ToolTip="add"
                                                                        />
                                                                </HeaderTemplate>
                                                               <%-- <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ID="IbDelete" ImageUrl="~/Css-Template/listimage/images/delete.png" CausesValidation="false"
                                                                        ImageAlign="Middle" CommandName="Delete" 
                                                                        CommandArgument='<%# Eval("ID_ENS")%>' ToolTip="Delete this row"  />
                                                                </ItemTemplate>--%>
                                                            </asp:TemplateField>
                                                           <%-- <asp:TemplateField HeaderStyle-Width="20px" ControlStyle-Width="20px" FooterStyle-Width="20px">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" ID="imgEdit" ImageUrl="~/Css-Template/listimage/images/edit.png" 
                                                                        Style="cursor: hand;" ImageAlign="Middle"  Enabled="true"  Text="Edit"   CommandName="Edit"  ToolTip="Edit"/>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                            <%-- <asp:TemplateField HeaderStyle-Width="20px" ControlStyle-Width="20px" FooterStyle-Width="20px">
                                                             
                                                            <EditItemTemplate>   
                                <asp:ImageButton ID="btnUpdate" runat="server" Text="Update"  CausesValidation="false"  CommandName="Update" ImageUrl="~/Css-Template/listimage/images/save.png" ToolTip="Update"
                                 OnClientClick = "return confirm('Ëtes-vous sûr de vouloir modifier cette ligne?')"></asp:ImageButton>
                                  <asp:ImageButton runat="server" ID="BtnCancelUpdateCrewSalaryPayment" ImageAlign="Middle"
                                      CausesValidation="false" ImageUrl="~/Css-Template/listimage/images/redo.png" />
                                                            
</EditItemTemplate>    
</asp:TemplateField> 
--%>

  <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign  ="Left"  ItemStyle-Width ="10%" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblIDabonne" runat="server" Text='<% # Eval("ID_ENS") %>'></asp:Label>
                            <EditItemTemplate>
                     <asp:TextBox ID="txtiDens" runat="server" Text='<%# Eval("ID_ENS")%>'></asp:TextBox>
                </EditItemTemplate>
                        </ItemTemplate>
                     </asp:TemplateField>   

<asp:TemplateField HeaderText="Annee deb" ItemStyle-HorizontalAlign  ="center"  ItemStyle-Width ="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbid" runat="server" Text='<% # Eval("ANNEE_DEB") %>'></asp:Label>
                        </ItemTemplate>
                     </asp:TemplateField>     
                     
           
          
           <asp:TemplateField HeaderText="Nom Ens">
                <ItemTemplate>
                    <asp:Label ID="lblnomEns" runat="server" Text='<%# Eval("NOM_ENS") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtnumbs" runat="server" Text='<%# Eval("NOM_ENS")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
              
      <asp:TemplateField HeaderText="Designation">
                <ItemTemplate>
                    <asp:Label ID="lbldesign" runat="server" Text='<%# Eval("DESIGNATION") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtnumbs" runat="server" Text='<%# Eval("DESIGNATION")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

<asp:TemplateField HeaderText="Classe">
                <ItemTemplate>
                    <asp:Label ID="lblclasse" runat="server" Text='<%# Eval("CODE_CL") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtnumbs" runat="server" Text='<%# Eval("CODE_CL")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

          <asp:TemplateField HeaderText="Charge P1">
                <ItemTemplate>
                    <asp:Label ID="lblchargep1" runat="server" Text='<%# Eval("CHARGE_ENS1_P1") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtchargeP1" runat="server" Text='<%# Eval("CHARGE_ENS1_P1")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Charge P2">
                <ItemTemplate>
                    <asp:Label ID="lblchargep2" runat="server" Text='<%# Eval("CHARGE_ENS1_P2") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="TxtCHArgeP2" runat="server" Text='<%# Eval("CHARGE_ENS1_P2")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Nbr Heures">
                <ItemTemplate>
                    <asp:Label ID="lblnumheures" runat="server" Text='<%# Eval("NB_HEURES") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtnumbheures" runat="server" Text='<%# Eval("NB_HEURES")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

  <asp:TemplateField HeaderText="Num Semestre">
                <ItemTemplate>
                    <asp:Label ID="lblnmsemetre" runat="server" Text='<%# Eval("NUM_SEMESTRE") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtnumsemestre" runat="server" Text='<%# Eval("NUM_SEMESTRE")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
   </Columns>
 <HeaderStyle CssClass="GridHeaderStyle" />
                                                        <RowStyle CssClass="GridItemStyle" />
                                                        <SelectedRowStyle CssClass="GridSelectedStyle" />
                                                    </asp:GridView></td>
                                                   <%-- <asp:Label ID="lblens"  runat="server" ></asp:Label>--%>
        <td><h3><asp:Label ID="lblaffect" runat="server"></asp:Label></h3>
 <asp:Panel ID="Panel2" runat="server" BackColor="Red"
                                                Width="520px">
                                                <center>

<table style="background-color: #800000" width="500px"  align="center">

     
     <tr>
            <td class="style4">
                <asp:Label ID="Labelens" runat="server" Text="Enseignant" 
                    CssClass="style10" style="color: #CCCCCC"></asp:Label>
                &nbsp;<span class="style18">(*)</span></td>
            <td>
                <asp:DropDownList runat="server" ID="ddlnomenseig" Height="30px" Width="170px"
                    AutoPostBack="true" onselectedindexchanged="ddlnomenseig_SelectedIndexChanged"
                
                    >
                    </asp:DropDownList>
            </td>
        </tr>
        <tr>
        <td class="style5">
       <asp:Label ID="lblClasse" Text="Classe" runat="server" CssClass="style10" 
                width="100px" style="color: #CCCCCC"></asp:Label>
                &nbsp;<span class="style18">(*)</span></td>
                 </td>
                 <td>
                  <asp:DropDownList runat="server" ID="Dropcodecl" 
                          AutoPostBack="true"
                       Height="30px" Width="170px"
                         onselectedindexchanged="ddlcodclasse_SelectedIndexChanged">
                      
                    </asp:DropDownList>
                 </td>
                 </tr>
        
        <tr>
            <td class="style4">
                <asp:Label ID="lblMatiere" Text="Matiere" runat="server" CssClass="style10" 
                    style="color: #FFFFFF"> </asp:Label>
                    &nbsp;<span class="style18">(*)</span></td>

                        <td>
                            <asp:DropDownList ID="ddlmodule" runat="server" AutoPostBack="true" 
                                Height="30px" onselectedindexchanged="ddlmodule_SelectedIndexChanged" 
                                Width="170px">
                            </asp:DropDownList>
                        </td>
                    </tr>
            </caption>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="lblSalle" runat="server" Text="Salle" 
                    CssClass="style10" style="color: #FFFFFF"></asp:Label>
                     <span class="style1">*</span></td>
            <td>
                <asp:DropDownList ID="ddlSalle" runat="server" Height="30px" Width="170px" 
                   AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Labl3" runat="server" Text="Jours" 
                    CssClass="style10" style="color: #FFFFFF"></asp:Label>
                <span class="style1">*</span></td>
            <%--<td>--%>
                <%--<asp:DropDownList runat="server" ID="ddljours" 
                    AutoPostBack="true"
                    >
                    <asp:ListItem>Veuillez choisir le jours de la séance</asp:ListItem>
                    <asp:ListItem>Lundi</asp:ListItem>
                     <asp:ListItem>Mardi</asp:ListItem>
                      <asp:ListItem>Mercredi</asp:ListItem>
                       <asp:ListItem>Jeudi</asp:ListItem>
                        <asp:ListItem>vendredi</asp:ListItem>
                         <asp:ListItem>Samedi</asp:ListItem>
                    </asp:DropDownList>--%>
           <%-- </td>--%>

           <td>
           
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <br class="style1" />
                <asp:TextBox ID="txtdebutDate" runat="server" Height="25px" Width="165px" placeholder="jour "
              ></asp:TextBox>

                <asp:PopupControlExtender ID="txtdebutDate_PopupControlExtender1" runat="server"
                    Enabled="true" TargetControlID="txtdebutDate" DynamicServicePath="" PopupControlID="Panel1"
                    Position="Bottom">
                </asp:PopupControlExtender>
                <br class="style1" />
                <asp:Panel ID="Panel1" runat="server" Width="200px" CssClass="style1">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" 
                                ondayrender="calDT_DayRender"
                                Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px"
                                BorderWidth="1px" NextPrevFormat="FullMonth" 
                                onselectionchanged="Calendar1_SelectionChanged1" >
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" Font-Bold="True" BorderColor="Black" BorderWidth="4px"
                                    Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Text="NB Heure" 
                    CssClass="style10" style="color: #FFFFFF"></asp:Label>
                <span class="style1">*</span></td>
            <td>
              <asp:TextBox  ID="txtbnheures"  runat="server" Height="30px" Width="170px"></asp:TextBox> 
                   
            </td>
        </tr>
        <tr>
            <td class="style19">
                De:</td>
            <td class="style9">
                <asp:DropDownList ID="DdlNumSeance1" runat="server" 
                    onselectedindexchanged="DdlNumSeance1_SelectedIndexChanged" Height="30px" Width="170px"
                    CssClass="form-control">
                    <asp:ListItem Value="0">Choisir une séance</asp:ListItem>
                    <asp:ListItem Value="9">1: 9h:00 à 10h:30</asp:ListItem>
                    <asp:ListItem Value="12">2: 10h:45 à 12h:15</asp:ListItem>
                    <asp:ListItem Value="14">3: 14h:00 à 15h:30</asp:ListItem>
                    <asp:ListItem Value="17">4: 15h:45 à 17h:15</asp:ListItem>
                </asp:DropDownList>
            </td>
             <td class="style10">
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
            
            <td class="style13">
                &nbsp;</td>
            <td class="style11">
                &nbsp;&nbsp;
                &nbsp;</td>
            <td>
                &nbsp;</td>

        </tr>
        <tr>
            <td class="style3">
                À:</td>
            <td class="style4">
                <asp:DropDownList ID="DdlNumSeance2" runat="server" 
                    onselectedindexchanged="DdlNumSeance2_SelectedIndexChanged" Height="30px" Width="170px"
                    CssClass="form-control">
                    <asp:ListItem Value="0">Choisir une séance</asp:ListItem>
                    <asp:ListItem Value="9">1: 9h:00 à 10h:30</asp:ListItem>
                    <asp:ListItem Value="12">2: 10h:45 à 12h:15</asp:ListItem>
                    <asp:ListItem Value="14">3: 14h:00 à 15h:30</asp:ListItem>
                    <asp:ListItem Value="17">4: 15h:45 à 17h:15</asp:ListItem>
                </asp:DropDownList>
            </td>
             <td class="style4">
               <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
            <td class="style4">
            <td class="style4">
                </td>
            <td class="style4">
                &nbsp;&nbsp;
                &nbsp;</td>
            <td class="style4">
                </td>
        </tr>
       
    
    
    
  <tr>
  <td></td>
  <td></td>
  <td align="center">
  <asp:Button  runat="server"  ID="btnaddEMP" Text="Enregistrer" BackColor="Maroon" 
                ForeColor="#CCCCCC" Height="40px" Width="150px" 
            onclick="btnaddEMP_Click" 
          style="font-weight: 100;  background-color: #333333;"/>
  
  </td>
  </tr>
  </table>

  </center>
  </asp:Panel>  
    </td>
        </tr></table>

 



<%--affectation des enseignants--%>



<hr />
  

<div class='container'>
<div class="align-left">
<h1><asp:Label ID="lblempcl" runat="server"></asp:Label> <asp:Label ID="lblcodeclasss" runat="server"></asp:Label></h1>
<DayPilot:DayPilotCalendar
        ID="DayPilotCalendar1" 
        BusinessEndsHour="21"
        BusinessBeginsHour="8"
        ShowNonBusiness="false"
        StartDate=" " 
        Scale="Day"
  
        runat="server" 
        ClientObjectName="dp"
        CssOnly="true"
        CssClassPrefix="calendar_green"
        HeaderHeight="40"
        HeaderDateFormat="D"
        CellDuration="30"
        CellHeight="30"
        DayBeginsHour="0"
        DayEndsHour="5"
        HourWidth="100"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="create(start, end, resource);"
        EventMoveHandling="CallBack"
        EventResizeHandling="CallBack"
         
        EventClickHandling="JavaScript"
        EventClickJavaScript="edit(e)"
        ColumnMarginRight="0" 
        MoveBy="Top" 
        TimeFormat="Clock24Hours" HourHalfBorderColor="Red" 
        HourNameBorderColor="Maroon" HoverColor="#CC0000" 
        NonBusinessBackColor="#33CCCC" Days="6"
        DataStartField="start"  DataEndField="end"
         DataTextField="DESIGNATION" DataValueField="DESIGNATION" 
          EventDeleteJavaScript="if (confirm('Delete?')) { dpc.eventDeleteCallBack(e); }" 
        OnEventDelete="DayPilotCalendar1_EventDelete" 
         EventDeleteHandling="CallBack"

       />

    
       </div>
   

   
  <div class="align-right">
   <h1><asp:Label ID="lblenseign" runat="server"></asp:Label><asp:Label ID="lblNomEEnsss" runat="server"> </asp:Label></h1>
<DayPilot:DayPilotCalendar

        ID="DayPilotCalendar2" 
        BusinessEndsHour="21"
        BusinessBeginsHour="8"
        ShowNonBusiness="false"
        runat="server" 
        ClientObjectName="dp"
        StartDate=" " 
        CssOnly="true"
        CssClassPrefix="calendar_green"
        HeaderHeight="40"

        HeaderDateFormat="D"
        CellDuration="30"
        CellHeight="30"
        DayBeginsHour="0"
        DayEndsHour="5"
        HourWidth="100"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="create(start, end, resource);"
        EventMoveHandling="CallBack"
        EventResizeHandling="CallBack"

        EventClickHandling="JavaScript"
        EventClickJavaScript="edit(e)"
        ColumnMarginRight="0" 
        MoveBy="Top" 
        TimeFormat="Clock24Hours" HourHalfBorderColor="Red" 
        HourNameBorderColor="Maroon" HoverColor="#CC0000" 
        NonBusinessBackColor="#33CCCC" Days="6"
        DataStartField="start"  DataEndField="end"

         DataTextField="DESIGNATION" DataValueField="DESIGNATION" 
          EventDeleteJavaScript="if (confirm('Delete?')) { dpc.eventDeleteCallBack(e); }" 
        OnEventDelete="DayPilotCalendar1_EventDelete" 
         EventDeleteHandling="CallBack"

       />
       </div>
   </div>
   <hr />
</asp:Content>
