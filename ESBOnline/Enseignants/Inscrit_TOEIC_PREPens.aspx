﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscrit_TOEIC_PREPens.aspx.cs" Inherits="ESPOnline.Enseignants.Inscrit_TOEIC_PREPens"

MasterPageFile="~/Enseignants/Ens.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Contents/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/Css/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="../Contents/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Contents/Scripts/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Contents/Scripts/JScript1.js"></script>
      
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

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
<br />
   <br />

    <br />
<center>
<asp:Panel ID="Panelfrang" runat="server"  BackColor="#CC0000" Height="500px" 
        Width="1150px">
       
<center>
<table><tr><td class="style13"><h2 class="style1" style="color: #CCCCCC">
    <span class="style7">INSCRIPTION 
    AU CERTIFICATION TOEIC POUR L'ANNEE UNIVERSITAIRE:</span><span class="style14">
    <asp:Label ID="lblanneedeb" runat="server" CssClass="style7"></asp:Label>
    /<asp:Label ID="lblanneefin" runat="server" CssClass="style7"></asp:Label>
    </span></h2></td></tr>
       </table>
       
       
     
      
    <%--<table bgcolor="#999999" style="background-color: #CCCCCC; width: 749px;">
 <tr><td height="30px">
  <asp:Label ID="lblnb" runat="server" CssClass="style7"></asp:Label>
 </td></tr>

 


 <tr>
 
<td ><h4>Choisissez le test que vous voulez le passer puis valider votre choix:</h4></td> </tr>
<tr><td height="30px"></td></tr>
<asp:Panel ID="paneltoiec" runat="server">
 <tr><td height="30px"><asp:CheckBox  ID="chkTOIEC" runat="server" Text="TEST TOIEC" 
         AutoPostBack="true" 
         /></td></tr><tr><td height="30px"></td>
         <td>
         Nombre des inscrits au test TOIEC:<asp:Label ID="lblcounttoiec" runat="server" 
                 CssClass="style2" ForeColor="Black"></asp:Label>
         </td>
         
         </tr>


</asp:Panel>





<asp:Panel ID="panelprep" runat="server">


<tr> <td height="30px"><asp:CheckBox  ID="chkprepTOIEC" runat="server" 
         Text="TEST PREPARATION TOIEC"  AutoPostBack="true" 
         /></td>
         <td>
          Nombre condidats pour passer le test PRESP TOIEC<asp:Label ID="lblcountprep" 
                 runat="server" CssClass="style2" ForeColor="Black"></asp:Label>
         </td>
 </tr>
</asp:Panel>
 
 <tr><td class="style8"></td></tr>
 
 <tr>
 <td align="center" height="30px" class="style9">
     <asp:Button ID="Button1" runat="server" Font-Bold="True" 
            Height="41px"  Text="Valider votre choix" Width="200px" 
         onclick="Button1_Click" /></td>
 </tr>
 </table>--%>
 
 <br />
 <asp:Label ID="lblchoix" runat="server" Text="Certification TOEIC:Choisissez Toeic si vous voulez passer:" 
        ForeColor="White"></asp:Label>
 <br />
 
 <asp:Label ID="lblprep" runat="server" Text="Prep TOEIC:Si vous voulez préparer la certification Toeic,choisissez:" 
        ForeColor="White"></asp:Label>

        <br />
 <asp:Panel ID="panelddr" runat="server">
 <center>
 <asp:Panel ID="paneltoiec" runat="server" Width="550px" Height="20px">
 <table bgcolor="#999999" style="background-color: #CCCCCC">


 <tr>
        <td width="30px"></td>
         <td> <asp:Label ID="Label6" runat="server" Text="Nombre d'Inscription au certification TOEIC:"></asp:Label>
                                    <asp:Label ID="lblcounttoiec" runat="server" ForeColor="Red"></asp:Label><asp:Label ID="lbl" runat="server" Text=" Candidats"></asp:Label></td>
         
         </tr>
          </table></asp:Panel>

 <br />
 
  <asp:Panel ID="panelprep" runat="server" Width="550px" Height="20px">
  
  <table bgcolor="#999999" style="background-color: #CCCCCC">

          <tr>
              <td>
                  <asp:Label ID="Label3" runat="server" Text="Nombre d'Inscription au preparation certification TOEIC:"></asp:Label>
                  <asp:Label ID="lblcountpreptoiec" runat="server" ForeColor="Red"></asp:Label>
                  <asp:Label ID="Label5" runat="server" Text=" Candidats"></asp:Label>
              </td>
          </tr>
    
 
 </table>
  
  </asp:Panel>
  <center>
    
     <asp:Panel ID="plrst" runat="server" BackColor="#999999" Width="500px" Height="30px">
    <asp:Label ID="lbltpd" runat="server"></asp:Label>
    </asp:Panel>
    
    </center>
    <br />
   
    <%--<center>
    
     <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" Width="500px" 
            Height="60px">
    <asp:Label ID="Label1" runat="server" ForeColor="#003399"></asp:Label>
    </asp:Panel>
    
    </center>--%>
  <br />
 <%-- <asp:DropDownList ID="ddlchoix" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
         >
  <asp:ListItem Value="">choisissez le test que vous voulez passer</asp:ListItem>
  <asp:ListItem Value="1">Toeic</asp:ListItem>
<asp:ListItem Value="2">Prep toeic</asp:ListItem>
  <asp:ListItem Value="3">Toeic et Prep Toeic</asp:ListItem>
  </asp:DropDownList>--%>
  <br />
  
  <%--<asp:DropDownList ID="ddlchoix" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
         >
  <asp:ListItem Value="">choisissez le test que vous voulez passer</asp:ListItem>
  <asp:ListItem Value="1">Passez Toeic</asp:ListItem>
  </asp:DropDownList>--%>

  
  <asp:DropDownList ID="ddlchoix" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
         >
  <asp:ListItem Value="">choisissez le test que vous voulez passer</asp:ListItem>
  <asp:ListItem Value="2">Passez Prep Toeic</asp:ListItem>
  </asp:DropDownList>
  <br />
  <br />
 
 <center>
     <asp:Button ID="Button1" runat="server" 
            Height="41px"  Text="Valider votre choix" Width="235px" 
         onclick="Button1_Click" /></center>
 </center>
  
 </asp:Panel>
            </center>
            </asp:Panel>

            </center>
            <br />
<center>
<asp:HyperLink ID="HyperLink1" NavigateUrl="~/Etudiants/Accueil.aspx" Text="Créer un compte" runat="server" ForeColor="#0033CC" > Retour à la page d'Accueil</asp:HyperLink>

</center>

</asp:Content>