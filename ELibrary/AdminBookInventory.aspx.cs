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
	public partial class AdminBookInventory : System.Web.UI.Page
	{
		private readonly string _strConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
		private static string GLOBAL_FILEPATH;
		private static int GLOBAL_ACTUAL_STOCK, GLOBAL_CURRENT_STOCK, GLOBAL_ISSUED_BOOKS;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				FillAuthorPublisherValues();
			}
			GridBookInventoryView.DataBind();
		}

		protected void ButtonGo_Click(object sender, EventArgs e)
		{
			getBookByID();
		}

		protected void ButtonAdd_Click(object sender, EventArgs e)
		{
			if (CheckBookExists())
			{
				Response.Write("<script>alert('Book already existed');</script>");
			}
			else
			{
				AddNewBook();
			}
		}

		protected void ButtonUpdate_Click(object sender, EventArgs e)
		{
			UpdateBookById();
		}

		protected void ButtonDelete_Click(object sender, EventArgs e)
		{
			DeleteBookById();
		}

		private void FillAuthorPublisherValues()
		{
			try
			{
				SqlConnection con = new SqlConnection(_strConnection);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl;", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				DropDownAuthorNameList.DataSource = dt;
				DropDownAuthorNameList.DataValueField = "author_id";
				DropDownAuthorNameList.DataTextField = "author_name";
				DropDownAuthorNameList.DataBind();

				cmd = new SqlCommand("SELECT * from publisher_master_tbl;", con);
				da = new SqlDataAdapter(cmd);
				dt = new DataTable();
				da.Fill(dt);
				DropDownPublisherNameList.DataSource = dt;
				DropDownPublisherNameList.DataValueField = "publisher_id";
				DropDownPublisherNameList.DataTextField = "publisher_name";
				DropDownPublisherNameList.DataBind();

			}
			catch (Exception ex)
			{

			}
		}

		private void AddNewBook()
		{
			try
			{
				var genres = ListGenreBox.GetSelectedIndices().Aggregate("", (current, i) => current + ListGenreBox.Items[i] + ",");
				if (genres.Length > 0)
				{
					genres = genres.Remove(genres.Length - 1);
				}

				// ReSharper disable once RedundantAssignment
				var filePath = "~/book_inventory/book_default.png";
				var fileName = Path.GetFileName(FileUploadImage.PostedFile.FileName);
				FileUploadImage.SaveAs(Server.MapPath("book_inventory/" + fileName));
				filePath = "~/book_inventory/" + fileName;


				SqlConnection sqlConnection = new SqlConnection(_strConnection);
				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				var command = new SqlCommand("INSERT INTO book_master_tbl " +
											 "(book_id, book_name, genre, author_id, publisher_id, publish_date, language," +
											 "edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link)" +
											 "VALUES (@book_id, @book_name, @genre, @author_id, @publisher_id, @publish_date, @language," +
											 "@edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)", sqlConnection);

				command.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());
				command.Parameters.AddWithValue("@book_name", TextBookNameBox.Text.Trim());
				command.Parameters.AddWithValue("@author_id", DropDownAuthorNameList.SelectedItem.Value);
				command.Parameters.AddWithValue("@publisher_id", DropDownPublisherNameList.SelectedItem.Value);
				command.Parameters.AddWithValue("@publish_date", TextPublishDateBox.Text.Trim());
				command.Parameters.AddWithValue("@language", DropDownLanguageList.SelectedItem.Value);
				command.Parameters.AddWithValue("@edition", TextEditionBox.Text.Trim());
				command.Parameters.AddWithValue("@book_cost", TextBookCostBox.Text.Trim());
				command.Parameters.AddWithValue("@no_of_pages", TextPagesBox.Text.Trim());
				command.Parameters.AddWithValue("@book_description", TextBookDescriptionBox.Text.Trim());
				command.Parameters.AddWithValue("@actual_stock", TextActualStockBox.Text.Trim());
				command.Parameters.AddWithValue("@current_stock", TextActualStockBox.Text.Trim());
				command.Parameters.AddWithValue("@genre", genres);
				command.Parameters.AddWithValue("@book_img_link", filePath);

				command.ExecuteNonQuery();
				sqlConnection.Close();
				GridBookInventoryView.DataBind();
				Response.Write("<script>alert('Add book succeed');</script>");
				ClearForm();
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				Response.Write("<script>alert('Failed to add book');</script>");
			}
		}

		private void UpdateBookById()
		{
			if (CheckBookExists())
			{
				try
				{
					var connection = new SqlConnection(_strConnection);
					if (connection.State == ConnectionState.Closed)
					{
						connection.Open();
					}

					var command = new SqlCommand("UPDATE book_master_tbl SET " +
												 "book_name=@book_name, genre=@genre, author_id=@author_id, publisher_id=@publisher_id, " +
												 "publish_date= @publish_date, language=@language, " +
												 "edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, " +
												 "actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link " +
												 "WHERE book_id=@book_id"
												 , connection);

					var genres = ListGenreBox.GetSelectedIndices().Aggregate("", (current, i) => current + ListGenreBox.Items[i] + ",");
					genres = genres.Remove(genres.Length - 1);

					// ReSharper disable once RedundantAssignment
					var filePath = "~/book_inventory/default_book.png";
					var fileName = Path.GetFileName(FileUploadImage.PostedFile.FileName);
					FileUploadImage.SaveAs(Server.MapPath("book_inventory/" + fileName));
					filePath = "~/book_inventory/" + fileName;

					command.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());
					command.Parameters.AddWithValue("@book_name", TextBookNameBox.Text.Trim());
					command.Parameters.AddWithValue("@author_id", DropDownAuthorNameList.SelectedItem.Value);
					command.Parameters.AddWithValue("@publisher_id", DropDownPublisherNameList.SelectedItem.Value);
					command.Parameters.AddWithValue("@publish_date", TextPublishDateBox.Text.Trim());
					command.Parameters.AddWithValue("@language", DropDownLanguageList.SelectedItem.Value);
					command.Parameters.AddWithValue("@edition", TextEditionBox.Text.Trim());
					command.Parameters.AddWithValue("@book_cost", TextBookCostBox.Text.Trim());
					command.Parameters.AddWithValue("@no_of_pages", TextPagesBox.Text.Trim());
					command.Parameters.AddWithValue("@book_description", TextBookDescriptionBox.Text.Trim());
					command.Parameters.AddWithValue("@actual_stock", TextActualStockBox.Text.Trim());
					command.Parameters.AddWithValue("@current_stock", TextActualStockBox.Text.Trim());
					command.Parameters.AddWithValue("@genre", genres);
					command.Parameters.AddWithValue("@book_img_link", filePath);

					command.ExecuteNonQuery();
					connection.Close();
					GridBookInventoryView.DataBind();
					Response.Write("<script>alert('Update book succeed');</script>");

				}
				catch (Exception e)
				{
					Console.WriteLine(e);
					Response.Write("<script>alert('Failed to update book');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Book does not exist');</script>");
			}
		}

		private void DeleteBookById()
		{
			if (CheckBookExists())
			{
				var sqlConnection = new SqlConnection(_strConnection);
				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				var command = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id=@book_id;", sqlConnection);
				command.ExecuteNonQuery();
				sqlConnection.Close();
				GridBookInventoryView.DataBind();
				Response.Write("<script>alert('Delete book succeed');</script>");
			}
			else
			{
				Response.Write("<script>alert('Book does not exist');</script>");
			}
		}

		private bool CheckBookExists()
		{
			try
			{
				var connection = new SqlConnection(_strConnection);
				if (connection.State == ConnectionState.Closed)
				{
					connection.Open();
				}

				var sqlCommand = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@book_id;", connection);
				sqlCommand.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());
				var sqlDataAdapter = new SqlDataAdapter(sqlCommand);

				var data = new DataTable();

				sqlDataAdapter.Fill(data);

				connection.Close();

				return data.Rows.Count >= 1;
			}
			catch (Exception e)
			{

				Console.WriteLine(e);
				return false;

			}
		}

		private void getBookByID()
		{
			try
			{
				SqlConnection con = new SqlConnection(_strConnection);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBookIdBox.Text.Trim() + "';", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				if (dt.Rows.Count >= 1)
				{
					TextBookNameBox.Text = dt.Rows[0]["book_name"].ToString();
					TextPublishDateBox.Text = dt.Rows[0]["publish_date"].ToString();
					TextEditionBox.Text = dt.Rows[0]["edition"].ToString();
					TextBookCostBox.Text = dt.Rows[0]["book_cost"].ToString().Trim();
					TextPagesBox.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
					TextActualStockBox.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
					TextCurrentStockBox.Text = dt.Rows[0]["current_stock"].ToString().Trim();
					TextBookDescriptionBox.Text = dt.Rows[0]["book_description"].ToString();
					TextIssuedBox.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

					DropDownLanguageList.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
					DropDownPublisherNameList.SelectedValue = dt.Rows[0]["publisher_id"].ToString().Trim();
					DropDownAuthorNameList.SelectedValue = dt.Rows[0]["author_id"].ToString().Trim();

					ListGenreBox.ClearSelection();
					string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
					for (int i = 0; i < genre.Length; i++)
					{
						for (int j = 0; j < ListGenreBox.Items.Count; j++)
						{
							if (ListGenreBox.Items[j].ToString() == genre[i])
							{
								ListGenreBox.Items[j].Selected = true;

							}
						}
					}

					GLOBAL_ACTUAL_STOCK = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
					GLOBAL_CURRENT_STOCK = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
					GLOBAL_ISSUED_BOOKS = GLOBAL_ACTUAL_STOCK - GLOBAL_CURRENT_STOCK;
					GLOBAL_FILEPATH = dt.Rows[0]["book_img_link"].ToString();

				}
				else
				{
					Response.Write("<script>alert('Invalid Book ID');</script>");
				}

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('Invalid Book ID');</script>");
			}
		}

		private void ClearForm()
		{
			TextBookIdBox.Text = string.Empty;
			TextBookNameBox.Text = string.Empty;
			DropDownLanguageList.SelectedIndex = 0;
			DropDownAuthorNameList.SelectedIndex = 0;
			DropDownPublisherNameList.SelectedIndex = 0;
			ListGenreBox.SelectedIndex = -1;
			TextPublishDateBox.Text = string.Empty;
			TextEditionBox.Text = string.Empty;
			TextBookCostBox.Text = string.Empty;
			TextPagesBox.Text = string.Empty;
			TextActualStockBox.Text = string.Empty;
			TextBookDescriptionBox.Text = string.Empty;

			TextBookIdBox.Focus();
		}

	}
}