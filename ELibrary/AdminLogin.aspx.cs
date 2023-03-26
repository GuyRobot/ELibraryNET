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
	public partial class AdminLogin : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ButtonAdminLogin_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection sqlConnection = new SqlConnection(_strConnection);

				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				SqlCommand command = new SqlCommand(
					"SELECT * FROM admin_login_tbl WHERE " +
					"username=@username " +
					"AND password= @password;", sqlConnection);

				command.Parameters.AddWithValue("@username", TextAdminIDBox.Text.Trim());
				command.Parameters.AddWithValue("@password", TextAdminPasswordBox.Text.Trim());

				SqlDataReader dataReader = command.ExecuteReader();
				if (dataReader.HasRows)
				{
					while (dataReader.Read())
					{
						Session["username"] = dataReader.GetValue(0);
						Session["fullname"] = dataReader.GetValue(2);
						Session["role"] = "admin";
					}

					Response.Redirect("/");
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