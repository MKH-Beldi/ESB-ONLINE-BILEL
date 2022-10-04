﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Configuration;
using Oracle.ManagedDataAccess.Types;
using BLL;
using Oracle.ManagedDataAccess.Client;
using ABSEsprit;
using System.Net;
using System.IO;

namespace ESPOnline.Etudiants
{
    public partial class ResultatRattrapage2021 : System.Web.UI.Page
    {
        public string ID_ET;
        public string TYPE_PV;
        public string CODE_CL;
        public string LIB_DECISION_SESSION_RAT;

        public string CODE_DECISION_SESSION_RAT;

        public string Moy_R;
        public decimal nb;
        public decimal ec;
        decimal total = 0;
        decimal tot = 0;
        string t = "E";

        string sess_covid;string valid_p;
        OrientationDAO orientdao = new OrientationDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("~/Online/default.aspx");
            if (Session["ID_ET"] == null || Session["CIN_PASS"] == null)
            {
                Response.Redirect("~/Online/default.aspx");
            }
            ID_ET = Session["ID_ET"].ToString();
            //if ((int)Session["nbredeconsultationparsession"] == 0)
            //{ Session["nbredeconsultationparsession"] = 3; }
            //else
            //{
            //    Session.Clear();
            //    Response.Redirect("~/Online/default.aspx");
            //}
            //get etat etudiant
            // lbletat.Text = DAL.Admission.Instance.getetatue(ID_ET);

            //Label1.Text = DAL.Admission.Instance.getetat(ID_ET);


            //if (lbletat.Text == ("-1") || Label1.Text == ("-1"))
            //{

            //    Response.Write("<script LANGUAGE='JavaScript'> alert('Problème pédagogique,veuillez contacter votre chef de département')</script>");

            //    DetailsView2.Visible = false;
            //    GridView2.Visible = false;

            //}



            //else 
            //{

            valid_p = "";
            //DAL.ToiecDAO.Instance.getEtat_is_valid_project(ID_ET);
            sess_covid = "";
            //DAL.ToiecDAO.Instance.getEtat_session_covid(ID_ET);

            if(valid_p=="O")
            {


                Response.Write("<script LANGUAGE='JavaScript'> alert('Vous êtes appelé à valider votre projet.Votre département vous contactera ultérieurement')</script>");


                DetailsView2.Visible = false;
                GridView2.Visible = false;

            }


            else
            {

                if(sess_covid=="O")

                {

                    Response.Write("<script LANGUAGE='JavaScript'> alert('En attente du conseil des classes')</script>");

                    DetailsView2.Visible = false;
                    GridView2.Visible = false;

                }

                else
                {

                    if (GridView2.Rows.Count == 0)
                    {
                        Response.Write("<script LANGUAGE='JavaScript'> alert('Problème Administratif, Veuillez contacter le service compétant')</script>");

                        // Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");

                        DetailsView2.Visible = false;
                        GridView2.Visible = false;
                    }
                   
                  //  LIB_DECISION_SESSION_RAT = DAL.OrientationDAO.getDecisionRat(ID_ET, "2021");
                   



                    //nb = DAL.OrientationDAO.getsumnbects(ID_ET, "2015");
                    //ec = DAL.OrientationDAO.getsumnbects2(ID_ET, "2015");
                    if (LIB_DECISION_SESSION_RAT == null)
                    {

                        DetailsView2.Visible = true;
                      //  GridView2.Visible = true;
                        Label18.Visible = true;
                      //  Response.Write("<script LANGUAGE='JavaScript'> alert('Aucune saisie n a été effectuée')</script>");
                    }
                    else if (CODE_DECISION_SESSION_RAT == "03")
                    {
                        Response.Write("<script LANGUAGE='JavaScript'> alert('Veuillez contacter la direction des etudes')</script>");
                        GridView2.Visible = false;
                        Label18.Visible = false;

                        DetailsView2.Visible = false;
                        GridView2.Visible = false;
                    }

                    else if (LIB_DECISION_SESSION_RAT != null && GridView2.Rows.Count != 0)
                    {
                        //Label18.Visible = false;
                       //Response.Write("<script LANGUAGE='JavaScript'> alert('Aucune saisie n a été effectuée')</script>");


                        //DetailsView2.Visible = false;
                        //GridView2.Visible = false;
                        Label18.Visible = true;

                        DetailsView2.Visible = true;
                      //  GridView2.Visible = true;
                        // Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");
                      

                    }

                  
                }
            }

            //if (GridView2.Rows.Count == 0 || lbletat.Text == "" || Label1.Text == "")
          




            /* else if (GridView2.Rows.Count == 0)
            {

                Response.Write("<script LANGUAGE='JavaScript'> alert('Problème Administratif, Veuillez contacter le service compétant')</script>");
                // GridView2.Visible = false;
                // Label18.Visible = false;

                // DetailsView2.Visible = false;


             else if (GridView2.Rows.Count != 0)
            {
                string recouvrement = "";
                var compt = DAL.Admission.Instance.GetCompt(ID_ET);
                try
                {
                    recouvrement = DAL.Admission.Instance.getRecouvrement(ID_ET);
                }
                catch
                { }
                var url = "http://41.226.11.244:81/webService/web/montant/" + compt;
                var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(url);
                string soldEtudiant;
                using (var response = webrequest.GetResponse())
                using (var reader = new StreamReader(response.GetResponseStream()))
                {
                    var result = reader.ReadToEnd();
                    //  Response.Write("<script LANGUAGE='JavaScript'> alert('" + Convert.ToString(result) + "')</script>");

                    soldEtudiant = Convert.ToString(result);
                    int index = soldEtudiant.IndexOf(".");
                    if (index >= 0)
                    {
                        soldEtudiant = soldEtudiant.Remove(index);
                    }
                    Label1.Text = Convert.ToString(result);
                }

                if (Convert.ToDouble(soldEtudiant) > 100)
                {
                    if (recouvrement == "99")
                    {

                        //GridView1.DataSource = SqlDataSource1;
                        //GridView1.DataBind();
                        //Déroulement des conseils de classe
                        //Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");



                    }
                    else
                    {
                        Response.Write("<script LANGUAGE='JavaScript'> alert('Problème Administratif, Veuillez contacter le service compétant')</script>");

                        //Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");




                    }
                }
                else
                {

                    //GridView1.DataSource = SqlDataSource1;
                    //GridView1.DataBind();
                    //Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");


                }

            }

            }*/



            //}

            //if (TYPE_PV.ToString() == "O")
            //{
            //    Response.Redirect("~/Etudiants/CharguiaRattrapage.aspx");
            //    //  GridView1.Visible = true;
            //    GridView2.Visible = false;
            //    //GridView3.Visible = true;
            //}

            //    else
            //    {
            //        if (GridView2.Rows.Count == 0)
            //        {
            //           // Response.Write("<script LANGUAGE='JavaScript'> alert('Problème Administratif, Veuillez contacter le service compétant')</script>");
            //            Label16.Text = TYPE_PV;  
            //        }
            //        //GridView1.Visible = false;

            //        //GridView3.Visible = true;
            //    }
            //} 
         //   Response.Write("<script LANGUAGE='JavaScript'> alert('L Accès est provisoirement suspendu suite au déroulement des conseils de classe')</script>");

        }



        public string FormatNullValue(object objPrice)
        {

          
            Decimal price = Convert.ToDecimal(objPrice);
            string tt = Convert.ToString(price);
            if (objPrice==null)
            {
                return "hhh";

            }

            return objPrice.ToString();

        } 
        protected void grdView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        protected void GridView1_test(object sender, GridViewRowEventArgs e)
        {
           // nb = DAL.OrientationDAO.getsumnbects(ID_ET, "2015");
          //  ec = DAL.OrientationDAO.getsumnbects2(ID_ET, "2015");
          //  if (e.Row.RowType == DataControlRowType.Header)
          //  {
          //      GridView grid = sender as GridView;
          //      GridViewRow row = new GridViewRow(0, -1,
          //  DataControlRowType.Header, DataControlRowState.Normal);
          //      GridViewRow row2 = new GridViewRow(5, -1,
          //DataControlRowType.Header, DataControlRowState.Normal);
          //      TableCell left = new TableHeaderCell();
                

                     
                
          //      left.ColumnSpan = 2;
             
          //      row.Cells.Add(left);
          //      left.BackColor = System.Drawing.Color.Gray;
          //      TableCell totals = new TableHeaderCell();
          //      totals.ColumnSpan = grid.Columns.Count - 8;
          //      totals.Text = "Session Principale";
          //      totals.ForeColor = System.Drawing.Color.White;
          //      totals.BackColor = System.Drawing.Color.FromName("#0000A0");
          //      totals.Attributes.CssStyle["text-align"] = "center";
          //      row.Cells.Add(totals);
          //      TableCell lef = new TableHeaderCell();
          //      lef.Attributes.CssStyle["text-align"] = "center";
          //      lef.ColumnSpan = grid.Columns.Count - 8;
          //      lef.Text = "Rattrapage";
                
          //      row.Cells.Add(lef);
                
          //      lef.ForeColor = System.Drawing.Color.Black;
          //      lef.BackColor = System.Drawing.Color.BlueViolet;
          //      TableCell ratue = new TableHeaderCell();
          //      ratue.ColumnSpan = grid.Columns.Count - 8;
              
          //      row.Cells.Add(ratue);
          //      ratue.BackColor = System.Drawing.Color.Gray;
          //      TableCell modp = new TableHeaderCell();
          //      modp.ColumnSpan = grid.Columns.Count - 9;
          //      modp.Text = "Principale";
          //      modp.ForeColor = System.Drawing.Color.White;
          //      modp.BackColor = System.Drawing.Color.FromName("#0000A0");
          //      modp.Attributes.CssStyle["text-align"] = "center";
          //      row.Cells.Add(modp );
          //      TableCell modr = new TableHeaderCell();
          //      modr.ColumnSpan = grid.Columns.Count - 9;
          //      modr.Text = "Rattrapage";
          //      modr.Attributes.CssStyle["text-align"] = "center";
          //      modr.ForeColor = System.Drawing.Color.Black;
          //      modr.BackColor = System.Drawing.Color.BlueViolet;
          //      row.Cells.Add(modr);
          //      Table t = grid.Controls[0] as Table;



          //      if (t != null)
          //      {
          //          t.Rows.AddAt(0, row);
          //      }

          //  }
              
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label Label7 = (Label)e.Row.FindControl("Label7");
                
                Label7.ForeColor = System.Drawing.Color.Purple;
                //Label Label10 = (Label)e.Row.FindControl("Label10");

                //Label10.ForeColor = System.Drawing.Color.Purple;
                //Label DECISIONR = (Label)e.Row.FindControl("DECISIONR");

                //DECISIONR.ForeColor = System.Drawing.Color.Purple;
                if (Convert.ToDecimal(Moy_R) >= 10)
                {
                    Label Label12 = (Label)e.Row.FindControl("Label12");
                    Label12.Text = nb.ToString();
                    Label12.ForeColor = System.Drawing.Color.Purple;
                }
                else if (Convert.ToDecimal(Moy_R) < 10)
                {
                    Label Label12 = (Label)e.Row.FindControl("Label12");
                    Label12.Text = ec.ToString();
                    Label12.ForeColor = System.Drawing.Color.Purple;
                }
                
                //Label Label13 = (Label)e.Row.FindControl("Label13");
                //Label13.Text = Moy_R;
                //Label13.ForeColor = System.Drawing.Color.Purple;
                //Label Label17 = (Label)e.Row.FindControl("Label17");
                //Label17.ForeColor = System.Drawing.Color.Purple;
                //Label17.Text = LIB_DECISION_SESSION_RAT;
                TableCell tableCell = new TableCell();
                tableCell.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Font.Bold = true;
                //Label Label2 = (Label)e.Row.FindControl("Label2");
                //Label2.Text = Label9.Text;
                using (OracleConnection con = new OracleConnection(AppConfiguration.ConnectionString))
                {
                    con.Open();
                    string t = Session["ID_ET"].ToString().Trim();
                    string numc = Session["CIN_PASS"].ToString().Trim();
                    OracleCommand cmd = new OracleCommand("SELECT sum(nb_ects) FROM ESP_MOY_UE_ETUDIANT where type_moy='P' and moyenne>=10 and id_et='" + t + "'  ");

                    cmd.Connection = con;
                    Label Label2 = (Label)e.Row.FindControl("Label2");
                    Label2.Text = cmd.ExecuteScalar().ToString();
                    con.Close();
                }
                //using (OracleConnection con = new OracleConnection(AppConfiguration.ConnectionString))
                //{
                //    con.Open();
                //    string t = Session["ID_ET"].ToString().Trim();
                //    string numc = Session["CIN_PASS"].ToString().Trim();
                //    OracleCommand cmd = new OracleCommand("SELECT MOY_GENERAL FROM ESP_INSCRIPTION where ANNEE_DEB=2015 and id_et='" + t + "'  ");

                //    cmd.Connection = con;
                //    Label Label3 = (Label)e.Row.FindControl("Label3");
                //    Label3.Text = cmd.ExecuteScalar().ToString();
                //    con.Close();
                //}
                //using (OracleConnection con = new OracleConnection(AppConfiguration.ConnectionString))
                //{
                //    con.Open();
                //    string t = Session["ID_ET"].ToString().Trim();
                //    string numc = Session["CIN_PASS"].ToString().Trim();
                //    OracleCommand cmd = new OracleCommand("SELECT LIB_DECISION_SESSION_P FROM ESP_INSCRIPTION where ANNEE_DEB=2015 and id_et='" + t + "'  ");

                //    cmd.Connection = con;
                //    Label Label4 = (Label)e.Row.FindControl("Label4");
                //    Label4.Text = cmd.ExecuteScalar().ToString();
                //    con.Close();
                //}
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToDecimal(Moy_R) >= 10)
                {
                    if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE_RATT")) < 8)
                    {
                        for (int i = 1; i < GridView2.Rows.Count + 2; i++)
                        {

                            e.Row.Cells[5].Text = "0";
                            e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;

                        }
                    }
                    else if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE_RATT")) >= 8)
                    {
                        for (int i = 1; i < GridView2.Rows.Count + 2; i++)
                        {


                            e.Row.Cells[5].ForeColor = System.Drawing.Color.Green;

                        }
                    }
                }
                else if (Convert.ToDecimal(Moy_R) < 10)
                {
                    if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE_RATT")) < 10)
                    {
                        for (int i = 1; i < GridView2.Rows.Count + 2; i++)
                        {

                            e.Row.Cells[5].Text = "0";
                            e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;

                        }
                    }
                    else if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE_RATT")) >= 10)
                    {
                        for (int i = 1; i < GridView2.Rows.Count + 2; i++)
                        {


                            e.Row.Cells[5].ForeColor = System.Drawing.Color.Green;

                        }
                    }


                }

                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE")) >= 10)
                {

                    decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "NB_ECTS"));

                    total = total + rowTotal;


                }
                else if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE")) < 10)
                {
                    for (int i = 1; i < GridView2.Rows.Count + 2; i++)
                    {

                        e.Row.Cells[3].Text = "0";
                        e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;

                    }

                    decimal rowTo = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "NB_ECTS"));
                    tot = tot + rowTo;

                }
    }
            foreach (TableCell cell in e.Row.Cells)
            {

                cell.Attributes.CssStyle["text-align"] = "center";

                if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE")) >= 10)
                {

                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Green;
                    e.Row.BorderWidth = 5;


                }
                else if (Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MOY_UE")) < 10)
                {
                    e.Row.BorderWidth = 5;
                    //e.Row.Cells[0].ForeColor = System.Drawing.Color.White;
                    // cell.ForeColor = System.Drawing.Color.Red;

                    e.Row.BorderColor = System.Drawing.Color.FromName("#A8A8A8");



                }




            }

        }
        protected void OnDataBound(object sender, EventArgs e)
        {
           
            for (int i = GridView2.Rows.Count - 1; i > 0; i--)
            {
                GridViewRow row = GridView2.Rows[i];
                GridViewRow previousRow = GridView2.Rows[i - 1];
                for (int j = 0; j < 3; j++)
                {
                    if (row.Cells[j].Text == previousRow.Cells[j].Text && row.Cells[0].Text == previousRow.Cells[0].Text)
                    {
                        if (previousRow.Cells[j].RowSpan == 0)
                        {
                            if (row.Cells[j].RowSpan == 0)
                            {
                                previousRow.Cells[j].RowSpan += 2;

                            }
                            else
                            {
                                previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                            }
                            row.Cells[j].Visible = false;
                        }
                    }
                }
                int k = 6;
                if (row.Cells[4].Text == previousRow.Cells[4].Text && row.Cells[0].Text == previousRow.Cells[0].Text)
                {
                    if (previousRow.Cells[4].RowSpan == 0)
                    {
                        if (row.Cells[4].RowSpan == 0)
                        {
                            previousRow.Cells[4].RowSpan += 2;
                        }
                        else
                        {
                            previousRow.Cells[4].RowSpan = row.Cells[4].RowSpan + 1;
                        }
                        row.Cells[4].Visible = false;
                    }
                }
                if (row.Cells[5].Text == previousRow.Cells[5].Text && row.Cells[0].Text == previousRow.Cells[0].Text)
                {
                    if (previousRow.Cells[5].RowSpan == 0)
                    {
                        if (row.Cells[5].RowSpan == 0)
                        {
                            previousRow.Cells[5].RowSpan += 2;
                        }
                        else
                        {
                            previousRow.Cells[5].RowSpan = row.Cells[5].RowSpan + 1;
                        }
                        row.Cells[5].Visible = false;
                    }
                }

                //if (row.Cells[6].Text == previousRow.Cells[6].Text && row.Cells[0].Text == previousRow.Cells[0].Text)
                //{
                //    if (previousRow.Cells[6].RowSpan == 0)
                //    {
                //        if (row.Cells[6].RowSpan == 0)
                //        {
                //            previousRow.Cells[6].RowSpan += 2;
                //        }
                //        else
                //        {
                //            previousRow.Cells[6].RowSpan = row.Cells[6].RowSpan + 1;
                //        }
                //        row.Cells[6].Visible = false;
                //    }
                //}

                if (row.Cells[3].Text == previousRow.Cells[3].Text && row.Cells[0].Text == previousRow.Cells[0].Text)
                {
                    if (previousRow.Cells[3].RowSpan == 0)
                    {
                        if (row.Cells[3].RowSpan == 0)
                        {
                            previousRow.Cells[3].RowSpan += 2;
                        }
                        else
                        {
                            previousRow.Cells[3].RowSpan = row.Cells[3].RowSpan + 1;
                        }
                        row.Cells[3].Visible = false;
                    }
                }
            }
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }
    }
}