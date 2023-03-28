using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
	public partial class ViewBooks : System.Web.UI.Page
	{

		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				GridBookInventoryView.DataBind();
			}
		}

		protected void GridBookInventoryView_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "Issue")
			{
				// Convert the row index stored in the CommandArgument
				// property to an Integer.
				string bookId = (string)(e.CommandArgument);

				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("INSERT INTO book_issue_request_tbl" +
														"(member_id, book_id) VALUES" +
														"(@member_id, @book_id)", sqlConnection);

					command.Parameters.AddWithValue("@member_id", Session["username"].ToString().Trim());
					command.Parameters.AddWithValue("@book_id", bookId.Trim());
					command.ExecuteNonQuery();

					sqlConnection.Close();

					Response.Write("<script>alert('Issued book request successfully');</script>");

					GridBookInventoryView.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to issue request book');</script>");
				}
			}
		}
	}
}