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
	public partial class AdminPublishManagement : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ButtonAdd_Click(object sender, EventArgs e)
		{
			if (CheckPublisherExists())
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

					SqlCommand command = new SqlCommand("INSERT INTO publisher_master_tbl" +
														"(publisher_id, publisher_name) VALUES" +
														"(@publisher_id, @publisher_name)", sqlConnection);

					command.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());
					command.Parameters.AddWithValue("@publisher_name", TextPublisherName.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Publisher added successfully');</script>");

					ClearForm();
					GridViewPublisher.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to add publisher');</script>");
				}
			}
		}

		protected void ButtonUpdate_Click(object sender, EventArgs e)
		{
			if (CheckPublisherExists())
			{
				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@publisher_name WHERE publisher_id=@publisher_id", sqlConnection);
					command.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());
					command.Parameters.AddWithValue("@publisher_name", TextPublisherName.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Publisher update successfully');</script>");

					ClearForm();
					GridViewPublisher.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to update publisher');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Publisher does not exists. Please try again');</script>");
			}
		}

		protected void ButtonDelete_Click(object sender, EventArgs e)
		{
			if (CheckPublisherExists())
			{
				try
				{
					SqlConnection sqlConnection = new SqlConnection(_strConnection);

					if (sqlConnection.State == ConnectionState.Closed)
					{
						sqlConnection.Open();
					}

					SqlCommand command = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id=@publisher_id", sqlConnection);
					command.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());

					command.ExecuteNonQuery();
					sqlConnection.Close();

					Response.Write("<script>alert('Publisher delete successfully');</script>");

					ClearForm();
					GridViewPublisher.DataBind();
				}
				catch (Exception exception)
				{
					Console.WriteLine(exception);
					Response.Write("<script>alert('Failed to delete publisher');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Publisher does not exists. Please try again');</script>");
			}
		}

		protected void ButtonGo_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id=@publisher_id;", connection);
				sqlCommand.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());

				SqlDataReader reader = sqlCommand.ExecuteReader();

				if (reader.HasRows)
				{
					while (reader.Read())
					{
						// Set Text From Database
						TextPublisherID.Text = reader.GetValue(0).ToString();
						TextPublisherName.Text = reader.GetValue(1).ToString();
					}
				}


			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}

		}

		protected void ButtonDeletePublisher_Click(object sender, EventArgs e)
		{
			DeletePublisherById();
		}

		private void DeletePublisherById()
		{
			if (!CheckPublisherExists())
			{
				Response.Write("<script>alert('MEMBER NOT EXIST');</script>");
				return;
			}
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id=@publisher_id;", connection);
				sqlCommand.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());

				sqlCommand.ExecuteNonQuery();

				Response.Write("<script>alert('Delete successfully');</script>");

				GridViewPublisher.DataBind();

				ClearForm();

			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}
		}

		private void ClearForm()
		{
			TextPublisherID.Text = "";
			TextPublisherName.Text = "";
		}

		private bool CheckPublisherExists()
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id=@publisher_id;", connection);

				sqlCommand.Parameters.AddWithValue("@publisher_id", TextPublisherID.Text.Trim());
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
	}
}