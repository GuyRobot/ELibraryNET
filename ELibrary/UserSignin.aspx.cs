using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
	public partial class UserSignin : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ButtonMemberLogin_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection sqlConnection = new SqlConnection(_strConnection);

				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				SqlCommand command = new SqlCommand(
					"SELECT * FROM member_master_tbl WHERE " +
					"member_id= @ID;", sqlConnection);

				command.Parameters.AddWithValue("ID", TextMemberIdBox.Text.Trim());

				SqlDataReader dataReader = command.ExecuteReader();

				if (dataReader.HasRows)
				{
					while (dataReader.Read())
					{
						if (dataReader.GetValue(10).ToString() == "deactive")
						{
							Response.Write("<script>alert('Account has been deactived');</script>");
							return;
						}
						Session["username"] = dataReader.GetValue(0);
						Session["fullname"] = dataReader.GetValue(1);
						Session["role"] = "user";
						Session["status"] = dataReader.GetValue(10).ToString();
					}

					Response.Redirect("HomePage.aspx");

				}
				else
				{
					Response.Write("<script>alert('Wrong Password or Member ID.');</script>");
				}

			}
			catch (Exception exception)
			{
				Console.Write(exception);
			}
		}
	}
}