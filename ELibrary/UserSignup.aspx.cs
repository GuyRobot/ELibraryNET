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
	public partial class UserSignup : System.Web.UI.Page
	{
		private readonly string _strConnection = "";
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		// Sign up Submit
		protected void ButtonSignUp_Click(object sender, EventArgs e)
		{
			if (CheckMemberExists())
			{
				Response.Write("<script>alert('Member ID already exists. Please choose another one.');</script>");
			}
			else
			{
				SubmitSignUpNewUser();
			}
		}

		// Submit user data to database
		private void SubmitSignUpNewUser()
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);

				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand cmd = new SqlCommand(
					"INSERT INTO member_master_tbl (full_name, dob, " +
					"contact_no, email, state, city, pincode, full_address, member_id, " +
					"password, account_status) VALUES (@full_name, @dob, @contact_no, " +
					"@email, @state, @city, @pincode, @full_address, @member_id, " +
					"@password, @account_status);", connection);

				cmd.Parameters.AddWithValue("@full_name", TextFullNameBox.Text.Trim());
				cmd.Parameters.AddWithValue("@dob", TextDateOfBirthBox.Text.Trim());
				cmd.Parameters.AddWithValue("@contact_no", TextContactNoBox.Text.Trim());
				cmd.Parameters.AddWithValue("@email", TextEmailBox.Text.Trim());
				cmd.Parameters.AddWithValue("@state", DropDownStateList.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@city", TextCityBox.Text.Trim());
				cmd.Parameters.AddWithValue("@pincode", TextPinCodeBox.Text.Trim());
				cmd.Parameters.AddWithValue("@full_address", TextFullAddressBox.Text.Trim());
				cmd.Parameters.AddWithValue("@member_id", TextMemberIdBox.Text.Trim());
				cmd.Parameters.AddWithValue("@password", TextPasswordBox.Text.Trim());
				cmd.Parameters.AddWithValue("@account_status", "pending");

				cmd.ExecuteNonQuery();
				connection.Close();

				Response.Write("<script>alert('Sign Up Successful. Now You Can Login In User Login');</script>");

			}
			catch (Exception exception)
			{
				Console.WriteLine("<script>alert('" + exception.Message + "');</script>");

			}

		}

		bool CheckMemberExists()
		{
			try
			{
				SqlConnection connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				SqlCommand sqlCommand = new SqlCommand("SELECT * FROM member_master_tbl" +
													   "WHERE member_id='" + TextMemberIdBox.Text.Trim() + "';", connection);
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