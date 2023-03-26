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
	public partial class AdminAuthor : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void ButtonAdd_Click(object sender, EventArgs e)
		{
			if (CheckMemberExists())
			{
			}
			else
			{
				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("INSERT INTO author_master_tbl" +
														"(author_id, author_name) VALUES" +
														"(@author_id, @author_name)", sqlConnection);

					command.Parameters.AddWithValue("@author_id", TextAuthorIDBox.Text.Trim());
					command.Parameters.AddWithValue("@author_name", TextAdminNameBox.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Author added successfully');</script>");

					ClearForm();
					GridAdminAuthorDataView.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to add author');</script>");
				}
			}
		}

		protected void ButtonUpdate_Click(object sender, EventArgs e)
		{
			if (CheckMemberExists())
			{
				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id=@author_id", sqlConnection);
					command.Parameters.AddWithValue("@author_id", TextAuthorIDBox.Text.Trim());
					command.Parameters.AddWithValue("@author_name", TextAdminNameBox.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Author update successfully');</script>");

					ClearForm();
					GridAdminAuthorDataView.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to update author');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Author does not exists. Please try again');</script>");
			}
		}

		protected void ButtonDelete_Click(object sender, EventArgs e)
		{
			if (CheckMemberExists())
			{
				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id=@author_id", sqlConnection);
					command.Parameters.AddWithValue("@author_id", TextAuthorIDBox.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Author delete successfully');</script>");

					ClearForm();
					GridAdminAuthorDataView.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to delete author');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Author does not exists. Please try again');</script>");
			}
		}

		protected void ButtonGo_Click(object sender, EventArgs eventArgs)
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id=@author_id;", connection);
				sqlCommand.Parameters.AddWithValue("@author_id", TextAuthorIDBox.Text.Trim());
				SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);

				DataTable data = new DataTable();

				sqlDataAdapter.Fill(data);

				connection.Close();

				if (data.Rows.Count >= 1)
				{
					TextAdminNameBox.Text = data.Rows[0][1].ToString();
				}
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}
		}

		private bool CheckMemberExists()
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id=@author_id;", connection);
				sqlCommand.Parameters.AddWithValue("@author_id", TextAuthorIDBox.Text.Trim());
				SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);

				DataTable data = new DataTable();

				sqlDataAdapter.Fill(data);

				connection.Close();

				if (data.Rows.Count >= 1)
				{
					return true;
				}

				return false;
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				return false;
			}
		}

		private void ClearForm()
		{
			TextAuthorIDBox.Text = "";
			TextAdminNameBox.Text = "";
		}
	}
}