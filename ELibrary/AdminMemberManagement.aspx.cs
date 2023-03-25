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
	public partial class WebForm7 : System.Web.UI.Page
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

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM member_master_tbl" +
													   "WHERE member_id=@member_id;", connection);
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());

				SqlDataReader reader = sqlCommand.ExecuteReader();

				if (reader.HasRows)
				{
					while (reader.Read())
					{
						// Set Text From Database
						TextFullNameBox.Text = reader.GetValue(0).ToString();
						TextDOBBox.Text = reader.GetValue(1).ToString();
						TextContactNoBox.Text = reader.GetValue(2).ToString();
						TextEmailBox.Text = reader.GetValue(3).ToString();
						TextStateBox.Text = reader.GetValue(4).ToString();
						TextCityBox.Text = reader.GetValue(5).ToString();
						TextPinCodeBox.Text = reader.GetValue(6).ToString();
						TextFullAddressBox.Text = reader.GetValue(7).ToString();


					}
				}


			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}

		}

		protected void ButtonDeleteMember_Click(object sender, EventArgs e)
		{
			DeleteMemberById();
		}

		protected void ButtonActiveMember_Click(object sender, EventArgs e)
		{
			UpdateMemberById("active");
		}

		protected void ButtonPendingMember_Click(object sender, EventArgs e)
		{
			UpdateMemberById("pending");
		}

		protected void ButtonDeActiveMember_Click(object sender, EventArgs e)
		{
			UpdateMemberById("deactive");
		}
		private void UpdateMemberById(string status)
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("UPDATE member_master_tbl SET account_status=@account_status" +
													   "WHERE member_id=@member_id;", connection);
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@account_status", status);

				sqlCommand.ExecuteNonQuery();

				Response.Write("<script>alert('UPDATE SUCCESSFUL');</script>");

				GridMemberView.DataBind();

			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}
		}

		private void DeleteMemberById()
		{
			if (!CheckMemberExists())
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

				SqlCommand sqlCommand = new SqlCommand("DELETE FROM member_master_tbl" +
													   "WHERE member_id=@member_id;", connection);
				sqlCommand.Parameters.AddWithValue("@member_id", TextMemberIDBox.Text.Trim());

				sqlCommand.ExecuteNonQuery();

				Response.Write("<script>alert('DELETE SUCCESSFUL');</script>");

				GridMemberView.DataBind();

				ClearForm();

			}
			catch (Exception exception)
			{

				Console.WriteLine(exception);

			}
		}

		private void ClearForm()
		{
			TextMemberIDBox.Text = "";
			TextFullNameBox.Text = "";
			TextDOBBox.Text = "";
			TextContactNoBox.Text = "";
			TextEmailBox.Text = "";
			TextStateBox.Text = "";
			TextCityBox.Text = "";
			TextPinCodeBox.Text = "";
			TextFullAddressBox.Text = "";
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