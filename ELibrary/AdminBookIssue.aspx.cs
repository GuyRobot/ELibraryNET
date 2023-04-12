using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
	public partial class AdminBookIssue : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
			// Not admin
			if (!Session["role"]?.Equals("admin") ?? true)
			{
				Response.Redirect("AdminLogin.aspx");
				return;
			}

			GridBookIssueView.DataBind();
		}

		protected void ButtonGo_Click(object sender, EventArgs e)
		{
			GetNames();
		}

		protected void ButtonIssue_Click(object sender, EventArgs e)
		{
			if (CheckBookValid() && !CheckIssueBookExist())
			{
				IssueBook();
			}
		}

		protected void ButtonReturn_Click(object sender, EventArgs e)
		{
			ReturnBook();
		}

		private void GetNames()
		{
			var sqlConnection = new SqlConnection(_strConnection);

			if (sqlConnection.State == ConnectionState.Closed)
			{
				sqlConnection.Open();
			}

			var command = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id=@book_id", sqlConnection);
			command.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());
			var dataAdapter = new SqlDataAdapter(command);
			var dataTable = new DataTable();
			dataAdapter.Fill(dataTable);
			if (dataTable.Rows.Count > 0)
			{
				TextBookNameBox.Text = dataTable.Rows[0]["book_name"].ToString();
			}
			else
			{
			}

			command = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id=@member_id", sqlConnection);
			command.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
			dataAdapter = new SqlDataAdapter(command);
			dataTable = new DataTable();
			dataAdapter.Fill(dataTable);
			if (dataTable.Rows.Count > 0)
			{
				TextMemberNameBox.Text = dataTable.Rows[0]["full_name"].ToString();
			}
			else
			{
			}
		}

		protected void GridBookIssueView_OnRowBound(object sender, GridViewRowEventArgs eventArgs)
		{
			try
			{
				if (eventArgs.Row.RowType == DataControlRowType.DataRow)
				{
					var date = Convert.ToDateTime(eventArgs.Row.Cells[5].Text);
					var today = DateTime.Today;
					if (today > date)
					{
						eventArgs.Row.BackColor = Color.PaleVioletRed;
					}
				}
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
			}
		}

		private void IssueBook()
		{
			try
			{
				SqlConnection sqlConnection = new SqlConnection(_strConnection);

				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				SqlCommand command = new SqlCommand("INSERT INTO book_issue_tbl" +
													"(member_id, book_id, issue_date, due_date) VALUES" +
													"(@member_id, @book_id, @issue_date, @due_date)", sqlConnection);

				command.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
				command.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());
				command.Parameters.AddWithValue("@issue_date", TextIssueDateBox.Text.Trim());
				command.Parameters.AddWithValue("@due_date", TextDueDateBox.Text.Trim());

				command.ExecuteNonQuery();

				command = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id=@book_id", sqlConnection);
				command.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());

				command.ExecuteNonQuery();
				sqlConnection.Close();

				Response.Write("<script>alert('Issued book successfully');</script>");

				GridBookIssueView.DataBind();
			}
			catch (Exception exception)
			{
				Console.WriteLine(exception);
				Response.Write("<script>alert('Failed to issue book');</script>");
			}
		}

		private bool CheckBookValid()
		{
			try
			{
				var connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				var sqlCommand = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@book_id AND current_stock > 0;", connection);
				sqlCommand.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());

				var sqlDataAdapter = new SqlDataAdapter(sqlCommand);

				var data = new DataTable();

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

		private bool CheckIssueBookExist()
		{
			try
			{
				var connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				var sqlCommand = new SqlCommand("SELECT * FROM book_issue_tbl WHERE book_id=@book_id AND member_id=@member_id;", connection);

				sqlCommand.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());

				var sqlDataAdapter = new SqlDataAdapter(sqlCommand);

				var data = new DataTable();

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

		private void ReturnBook()
		{
			try
			{
				SqlConnection sqlConnection = new SqlConnection(_strConnection);

				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				SqlCommand command = new SqlCommand("DELETE FROM book_issue_tbl WHERE book_id=@book_id AND member_id=@member_id", sqlConnection);

				command.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());
				command.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());

				int result = command.ExecuteNonQuery();

				if (result > 0)
				{
					command = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id=@book_id", sqlConnection);
					command.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());

					command.ExecuteNonQuery();
				}

				sqlConnection.Close();

				Response.Write("<script>alert('Return book successfully');</script>");

				GridBookIssueView.DataBind();
			}
			catch (Exception exception)
			{
				Console.WriteLine(exception);
				Response.Write("<script>alert('Failed to return book');</script>");
			}
		}
	}
}