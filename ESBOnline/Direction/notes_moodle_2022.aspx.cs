﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace ESPOnline.Direction
{
    public partial class notes_moodle_2022 : System.Web.UI.Page
    {

        private MySqlCommand cmd;
        private MySqlDataReader reader;
        private DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            cmd = new MySqlCommand("select quiz as id_test ,name as name_test ,substr(email, 1, 4) as user, a.sumgrades as note_candidat from mdl_quiz_attempts a, mdl_user, mdl_quiz where mdl_user.id = a.userid and a.quiz = mdl_quiz.id and quiz in (2465, 2466, 2467, 2468)", moodle_test.getconnection());
            reader = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(reader);
            gridmoodle.DataSource = dt;
        }
    }
}