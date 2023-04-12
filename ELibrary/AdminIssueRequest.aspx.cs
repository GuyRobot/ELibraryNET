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
	public partial class AdminIssueRequest : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{

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

				SqlCommand sqlCommand = new SqlCommand("SELECT b.book_id, m.member_id, b.book_name, m.full_name FROM book_issue_request_tbl i inner join book_master_tbl b on i.book_id=b.book_id inner join member_master_tbl m on m.member_id=i.member_id WHERE m.member_id=@member_id AND b.book_id=@book_id;", connection);
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());

				SqlDataReader reader = sqlCommand.ExecuteReader();

				if (reader.HasRows)
				{
					while (reader.Read())
					{
						// Set Text From Database
						TextBookIDBox.Text = reader.GetValue(0).ToString();
						TextMemberIDBox.Text = reader.GetValue(1).ToString();
						TextBookNameBox.Text = reader.GetValue(2).ToString();
						TextMemberNameBox.Text = reader.GetValue(3).ToString();
					}
				}


			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}

		}

		protected void ButtonApproveIssue_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("approve_issue_request", connection);
				sqlCommand.CommandType = CommandType.StoredProcedure;
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@book_id", TextBookIDBox.Text.Trim());

				sqlCommand.ExecuteNonQuery();

				Response.Write("<script>alert('Approve succeed!');</script>");

				GridMemberView.DataBind();

			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}
		}

		protected void ButtonDeleteIssue_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("DELETE FROM book_issue_request_tbl WHERE member_id=@member_id, @book_id=@book_id;", connection);
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@bookid", TextBookIDBox.Text.Trim());
				sqlCommand.CommandType = CommandType.StoredProcedure;

				sqlCommand.ExecuteNonQuery();

				Response.Write("<script>alert('Delete succeed!');</script>");

				GridMemberView.DataBind();

			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}
		}
		private void ClearForm()
		{
			TextMemberIDBox.Text = "";
			TextBookIDBox.Text = "";
			TextBookNameBox.Text = "";
			TextMemberNameBox.Text = "";
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

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM member_master_tbl" +
													   "WHERE member_id=@member_id;", connection);

				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
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