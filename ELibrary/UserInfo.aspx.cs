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
	public partial class UserInfo : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (Session["username"].ToString() == "" || Session["username"] == null)
				{
					Response.Write("<script>alert('Session expired. Please login again');</script>");
					Response.Redirect("UserSignin.aspx");
				}
				else
				{
					GetUserBookData();

					if (!Page.IsPostBack)
					{
						GetUserPersonalDetails();
					}

				}
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('Session Expired Login Again');</script>");
				Response.Redirect("UserSignin.aspx");
			}
		}

		// update button click
		protected void ButtonUpdate_Click(object sender, EventArgs e)
		{
			if (Session["username"].ToString() == "" || Session["username"] == null)
			{
				Response.Write("<script>alert('Session expired. Please login again');</script>");
				Response.Redirect("UserSignin.aspx");
			}
			else
			{
				UpdateUserPersonalDetails();
			}
		}



		// user defined function
		void UpdateUserPersonalDetails()
		{
			string password = "";
			if (TextPasswordBox.Text.Trim() == "")
			{
				password = TextOldPasswordBox.Text.Trim();
			}
			else
			{
				password = TextPasswordBox.Text.Trim();
			}
			try
			{
				SqlConnection con = new SqlConnection(_strConnection);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}


				SqlCommand cmd = new SqlCommand("update member_master_tbl set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE member_id=@member_id", con);

				cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
				cmd.Parameters.AddWithValue("@full_name", TextFullNameBox.Text.Trim());
				cmd.Parameters.AddWithValue("@dob", TextDateOfBirthBox.Text.Trim());
				cmd.Parameters.AddWithValue("@contact_no", TextContactNoBox.Text.Trim());
				cmd.Parameters.AddWithValue("@email", TextEmailBox.Text.Trim());
				cmd.Parameters.AddWithValue("@state", DropDownStateList.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@city", TextCityBox.Text.Trim());
				cmd.Parameters.AddWithValue("@pincode", TextPinCodeBox.Text.Trim());
				cmd.Parameters.AddWithValue("@full_address", TextFullAddressBox.Text.Trim());
				cmd.Parameters.AddWithValue("@password", password);
				cmd.Parameters.AddWithValue("@account_status", "pending");

				int result = cmd.ExecuteNonQuery();
				con.Close();
				if (result > 0)
				{
					Response.Write("<script>alert('Your details updated successfully');</script>");
					GetUserPersonalDetails();
					GetUserBookData();
				}
				else
				{
					Response.Write("<script>alert('Invaid entry');</script>");
				}

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}


		void GetUserPersonalDetails()
		{
			try
			{
				SqlConnection con = new SqlConnection(_strConnection);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + Session["username"].ToString() + "';", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);

				TextFullNameBox.Text = dt.Rows[0]["full_name"].ToString();
				TextDateOfBirthBox.Text = dt.Rows[0]["dob"].ToString();
				TextContactNoBox.Text = dt.Rows[0]["contact_no"].ToString();
				TextEmailBox.Text = dt.Rows[0]["email"].ToString();
				DropDownStateList.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
				TextCityBox.Text = dt.Rows[0]["city"].ToString();
				TextPinCodeBox.Text = dt.Rows[0]["pincode"].ToString();
				TextFullAddressBox.Text = dt.Rows[0]["full_address"].ToString();
				TextMemberIdBox.Text = dt.Rows[0]["member_id"].ToString();
				TextOldPasswordBox.Text = dt.Rows[0]["password"].ToString();

				LabelStatus.Text = dt.Rows[0]["account_status"].ToString().Trim();

				if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
				{
					LabelStatus.Attributes.Add("class", "bg-green-600 text-white rounded-3xl px-3 py-1 text-xs capitalize");
				}
				else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
				{
					LabelStatus.Attributes.Add("class", "bg-yellow-600 text-white rounded-3xl px-3 py-1 text-xs capitalize");
				}
				else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
				{
					LabelStatus.Attributes.Add("class", "bg-red-600 text-white rounded-3xl px-3 py-1 text-xs capitalize");
				}
				else
				{
					LabelStatus.Attributes.Add("class", "bg-blue-600 text-white rounded-3xl px-3 py-1 text-xs capitalize");
				}


			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");

			}
		}

		void GetUserBookData()
		{
			try
			{
				SqlConnection con = new SqlConnection(_strConnection);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id=@member_id;", con);
				cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);

				GridViewIssuedBook.DataSource = dt;
				GridViewIssuedBook.DataBind();

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}

		protected void GridViewIssuedBook_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			try
			{
				if (e.Row.RowType == DataControlRowType.DataRow)
				{
					//Check your condition here
					DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
					DateTime today = DateTime.Today;
					if (today > dt)
					{
						e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
					}
				}
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}
	}
}