﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Drawing;
using System.IO;
using System.Text;

namespace ESPOnline.Direction
{
    public partial class Etat_niveau_langue_2017 : System.Web.UI.Page
    {
        LangueService service = new LangueService();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ID_DECID"] == null)
            {
                Response.Redirect("~/Online/default.aspx");
            }


            if (!IsPostBack)
            {
                lblfr.Visible = false;
                lblang.Visible = false;
                plbtn.Visible = false;
                plbtn1.Visible = false;

            }
        }

        protected void rblangue_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (rblangue.SelectedValue == "FR")
            {
                lblfr.Visible = true;
                bindfr();
                lblang.Visible = false;
                plbtn1.Visible = false;
                plbtn.Visible = true;
            }

            else

                if (rblangue.SelectedValue == "AN")
                {
                    lblang.Visible = true;
                    bindang();
                    lblfr.Visible = false;
                    plbtn1.Visible = true;
                    plbtn.Visible = false;
                }
        }

        public void bindfr()
        {
            Gridtoiec.DataSource = service.Etat_lge_fr(); ;
            Gridtoiec.DataBind();
        }

        public void bindang()
        { 
            GridView1.DataSource=service.Etat_lge_ang();
            GridView1.DataBind();
        }

        protected void Btnprint_Click(object sender, EventArgs e)
        {
            GridView1.AllowPaging = false;
            GridView1.DataSource = service.Etat_lge_ang();
            GridView1.DataBind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'")
                .Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            GridView1.AllowPaging = false;
            GridView1.DataSource = service.Etat_lge_ang();
            GridView1.DataBind();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }


        protected void BuTT2_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Etat_niveau_anglais.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                bindang();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Etat_niveau_français.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                Gridtoiec.AllowPaging = false;
                bindfr();

                Gridtoiec.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in Gridtoiec.HeaderRow.Cells)
                {
                    cell.BackColor = Gridtoiec.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in Gridtoiec.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = Gridtoiec.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = Gridtoiec.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                Gridtoiec.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Gridtoiec.AllowPaging = false;
            Gridtoiec.DataSource = service.Etat_lge_fr();
            Gridtoiec.DataBind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Gridtoiec.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'")
                .Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            Gridtoiec.AllowPaging = false;
            Gridtoiec.DataSource = service.Etat_lge_fr();
            Gridtoiec.DataBind();

        }

        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
        //       server control at run time. */
        //}
         decimal totalPrice = 0M;
        decimal totalStock = 0M;
        decimal totalgc = 0M;
        decimal totaltt = 0M;
        decimal redOUB = 0M;
        decimal PINS = 0M;
        decimal NBS = 0M;
        int totalItems = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblPrice = (Label)e.Row.FindControl("lblPrice");
                Label lblUnitsInStock = (Label)e.Row.FindControl("lblUnitsInStock");
                Label lblUnitsInStockGC = (Label)e.Row.FindControl("lblUnitsInStockGC");
                Label lblUnitsInStockGCTotal = (Label)e.Row.FindControl("lblUnitsInStockGCTotal");

                Label lblUnitsInStockGCTredoub = (Label)e.Row.FindControl("lblUnitsInStockGCTredoub");
               

                decimal price = Decimal.Parse(lblPrice.Text);
                decimal stock = Decimal.Parse(lblUnitsInStock.Text);
                decimal sgc = Decimal.Parse(lblUnitsInStockGC.Text);
                decimal tt = Decimal.Parse(lblUnitsInStockGCTotal.Text);

                decimal tt1 = Decimal.Parse(lblUnitsInStockGCTredoub.Text);
              


                totalPrice += price;
                totalStock += stock;
                totalgc += sgc;
                totaltt += tt;
                redOUB += tt1;
              
                totalItems += 1;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalPrice = (Label)e.Row.FindControl("lblTotalPrice");
                Label lblTotalUnitsInStock = (Label)e.Row.FindControl("lblTotalUnitsInStock");
                Label lblTotalUnitsInStockGC = (Label)e.Row.FindControl("lblTotalUnitsInStockGC");
                Label lblTotalUnitsInStockGCTotal = (Label)e.Row.FindControl("lblTotalUnitsInStockGCTotal");

                Label lblTotalUnitsInStockredoub = (Label)e.Row.FindControl("lblTotalUnitsInStockredoub");

                lblTotalPrice.Text = totalPrice.ToString();
                lblTotalUnitsInStock.Text = totalStock.ToString();
                lblTotalUnitsInStockGC.Text = totalgc.ToString();
                lblTotalUnitsInStockGCTotal.Text = totaltt.ToString();

                lblTotalUnitsInStockredoub.Text = redOUB.ToString();
                // lblAveragePrice.Text = (totalPrice / totalItems).ToString("F");
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblPrice = (Label)e.Row.FindControl("lblPrice");
                Label lblUnitsInStock = (Label)e.Row.FindControl("lblUnitsInStock");
                Label lblUnitsInStockGC = (Label)e.Row.FindControl("lblUnitsInStockGC");
                Label lblUnitsInStockGCTotal = (Label)e.Row.FindControl("lblUnitsInStockGCTotal");

                Label lblUnitsInStockGCTredoub = (Label)e.Row.FindControl("lblUnitsInStockGCTredoub");


                decimal price = Decimal.Parse(lblPrice.Text);
                decimal stock = Decimal.Parse(lblUnitsInStock.Text);
                decimal sgc = Decimal.Parse(lblUnitsInStockGC.Text);
                decimal tt = Decimal.Parse(lblUnitsInStockGCTotal.Text);

                decimal tt1 = Decimal.Parse(lblUnitsInStockGCTredoub.Text);



                totalPrice += price;
                totalStock += stock;
                totalgc += sgc;
                totaltt += tt;
                redOUB += tt1;

                totalItems += 1;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalPrice = (Label)e.Row.FindControl("lblTotalPrice");
                Label lblTotalUnitsInStock = (Label)e.Row.FindControl("lblTotalUnitsInStock");
                Label lblTotalUnitsInStockGC = (Label)e.Row.FindControl("lblTotalUnitsInStockGC");
                Label lblTotalUnitsInStockGCTotal = (Label)e.Row.FindControl("lblTotalUnitsInStockGCTotal");

                Label lblTotalUnitsInStockredoub = (Label)e.Row.FindControl("lblTotalUnitsInStockredoub");

                lblTotalPrice.Text = totalPrice.ToString();
                lblTotalUnitsInStock.Text = totalStock.ToString();
                lblTotalUnitsInStockGC.Text = totalgc.ToString();
                lblTotalUnitsInStockGCTotal.Text = totaltt.ToString();

                lblTotalUnitsInStockredoub.Text = redOUB.ToString();
                // lblAveragePrice.Text = (totalPrice / totalItems).ToString("F");
            }
        }
    }
    }
