using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary
{
	public partial class SiteMaster : MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				// Not Login
				string role = Session["role"] as string;
				if (string.IsNullOrEmpty(role))
				{
					ShowFreshUserFunction();
				}
				// User Role
				else if (Session["role"].Equals("user"))
				{
					ShowUserSignedInFunction();
				}
				// Admin Role
				else if (Session["role"].Equals("admin"))
				{
					ShowAdminSignedInFunction();
				}
			}
			catch (Exception exception)
			{
				Console.Write(exception);
			}

		}

		protected void ButtonLinkToLogin_Click(object sender, EventArgs e)
		{
			Response.Redirect("UserSignin.aspx");
		}

		protected void ButtonLinkToSignUp_Click(object sender, EventArgs e)
		{
			Response.Redirect("UserSignup.aspx");
		}

		protected void ButtonHelloUser_Click(object sender, EventArgs e)
		{
			Response.Redirect("UserInfo.aspx");
		}

		protected void ButtonLinkToAdminAuthor_Click(object sender, EventArgs e)
		{
			Response.Redirect("AdminLogin.aspx");
		}

		protected void ButtonLinkToAuthorAdmin_Click(object sender, EventArgs e)
		{
			Response.Redirect("UserSignUp.aspx");
		}

		protected void ButtonLinkToAdminBookInventory_Click(object sender, EventArgs e)
		{
			Response.Redirect("AdminBookInventory.aspx");
		}

		protected void ButtonLinkToAdminBookIssue_Click(object sender, EventArgs e)
		{
			Response.Redirect("AdminBookIssue.aspx");
		}

		protected void ButtonLinkToAdminMemberManagement_Click(object sender, EventArgs e)
		{
			Response.Redirect("AdminMemberManagement.aspx");
		}

		protected void ButtonLinkToAdminPublishManagement_Click(object sender, EventArgs e)
		{
			Response.Redirect("AdminPublishManagement.aspx");
		}

		protected void ButtonLogout_Click(object sender, EventArgs eventArgs)
		{
			Session["username"] = "";
			Session["fullname"] = "";
			Session["role"] = "";
			Session["status"] = "";

			ShowFreshUserFunction();
		}

		private void ShowFreshUserFunction()
		{
			LinkUserLoginButton.Visible = true;
			LinkUserSignUpButton.Visible = true;

			LinkLogoutButton.Visible = false;
			LinkCurrentUserButton.Visible = false;

			LinkAdminAuthorButton.Visible = true;
			LinkAuthorAdminButton.Visible = false;
			LinkAdminInventoryButton.Visible = false;
			LinkAdminMemberManagementButton.Visible = false;
			LinkAdminBookIssueButton.Visible = false;
			LinkAdminPublishmentButton.Visible = false;
		}

		private void ShowUserSignedInFunction()
		{
			LinkUserLoginButton.Visible = false;
			LinkUserSignUpButton.Visible = false;

			LinkLogoutButton.Visible = true;
			LinkCurrentUserButton.Visible = true;
			LinkCurrentUserButton.Text = "Hello, " + Session["fullname"];

			LinkAdminAuthorButton.Visible = true;
			LinkAuthorAdminButton.Visible = false;
			LinkAdminInventoryButton.Visible = false;
			LinkAdminMemberManagementButton.Visible = false;
			LinkAdminBookIssueButton.Visible = false;
			LinkAdminPublishmentButton.Visible = false;
		}

		private void ShowAdminSignedInFunction()
		{
			LinkUserLoginButton.Visible = false;
			LinkUserSignUpButton.Visible = false;

			LinkLogoutButton.Visible = true;
			LinkCurrentUserButton.Visible = true;
			LinkCurrentUserButton.Text = "Hello Admin";

			LinkAdminAuthorButton.Visible = false;
			LinkAuthorAdminButton.Visible = true;
			LinkAdminInventoryButton.Visible = true;
			LinkAdminMemberManagementButton.Visible = true;
			LinkAdminBookIssueButton.Visible = true;
			LinkAdminPublishmentButton.Visible = true;
		}
	}
}