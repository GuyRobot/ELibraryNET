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
			FillAuthorPublisherValues();
		}

		protected void ButtonAdd_Click(object sender, EventArgs e)
		{
			if (CheckBookExists())
			{

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
				var sqlConnection = new SqlConnection(_strConnection);
				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				var command = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@book_id;", sqlConnection);
				var data = new SqlDataAdapter(command);
				var dataTable = new DataTable();
				data.Fill(dataTable);
				command.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());

				if (dataTable.Rows.Count > 0)
				{
					TextBookNameBox.Text = dataTable.Rows[0]["book_name"].ToString();
					TextPublishDateBox.Text = dataTable.Rows[0]["publish_date"].ToString();
					TextEditionBox.Text = dataTable.Rows[0]["edition"].ToString();
					TextBookCostBox.Text = dataTable.Rows[0]["book_cost"].ToString().Trim();
					TextPagesBox.Text = dataTable.Rows[0]["no_of_page"].ToString().Trim();
					TextActualStockBox.Text = dataTable.Rows[0]["actual_stock"].ToString().Trim();
					TextCurrentStockBox.Text = dataTable.Rows[0]["current_stock"].ToString().Trim();
					TextIssuedBox.Text = (Convert.ToInt32(dataTable.Rows[0]["actual_stock"].ToString())
										  - Convert.ToInt32(dataTable.Rows[0]["current_stock"].ToString())).ToString();
					TextBookDescriptionBox.Text = dataTable.Rows[0]["book_description"].ToString();

					DropDownLanguageList.SelectedValue = dataTable.Rows[0]["language"].ToString();
					DropDownAuthorNameList.SelectedValue = dataTable.Rows[0]["author_name"].ToString();
					DropDownPublisherNameList.SelectedValue = dataTable.Rows[0]["publisher_name"].ToString();



					// Genre List Box 
					var genres = dataTable.Rows[0]["genre"].ToString().Trim().Split(',');
					foreach (var genre in genres)
					{
						foreach (ListItem listItem in ListGenreBox.Items)
						{
							if (listItem.ToString() == genre)
							{
								listItem.Selected = true;
							}
						}
					}

				}
				else
				{

				}
				DropDownAuthorNameList.DataSource = dataTable;
				DropDownAuthorNameList.DataValueField = "author_name";
				DropDownAuthorNameList.DataBind();
			}
			catch (Exception e)
			{
				Console.WriteLine(e);

			}
		}

		private void AddNewBook()
		{
			try
			{
				var genres = ListGenreBox.GetSelectedIndices().Aggregate("", (current, i) => current + ListGenreBox.Items[i] + ",");
				genres = genres.Remove(genres.Length - 1);

				// ReSharper disable once RedundantAssignment
				var filePath = "~/book_inventory/book1.png";
				var fileName = Path.GetFileName(FileUploadImage.PostedFile.FileName);
				FileUploadImage.SaveAs(Server.MapPath("book_inventory/" + fileName));
				filePath = "~/book_inventory/" + fileName;


				SqlConnection sqlConnection = new SqlConnection(_strConnection);
				if (sqlConnection.State == ConnectionState.Closed)
				{
					sqlConnection.Open();
				}

				var command = new SqlCommand("INSERT INTO book_master_tbl " +
											 "(book_id, book_name, genre, author_name, publisher_name, publish_date, language," +
											 "edition, book_cost, no_of_page, book_description, actual_stock, current_stock, book_img_link)" +
											 "VALUES (@book_id, @book_name, @genre, @author_name, @publisher_name, @publish_date, @language," +
											 "@edition, @book_cost, @no_of_page, @book_description, @actual_stock, @current_stock, @book_img_link)", sqlConnection);

				command.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());
				command.Parameters.AddWithValue("@book_name", TextBookNameBox.Text.Trim());
				command.Parameters.AddWithValue("@author_name", DropDownAuthorNameList.SelectedItem.Value);
				command.Parameters.AddWithValue("@publisher_name", DropDownPublisherNameList.SelectedItem.Value);
				command.Parameters.AddWithValue("@language", DropDownLanguageList.SelectedItem.Value);
				command.Parameters.AddWithValue("@edition", TextEditionBox.Text.Trim());
				command.Parameters.AddWithValue("@book_cost", TextBookCostBox.Text.Trim());
				command.Parameters.AddWithValue("@no_of_page", TextPagesBox.Text.Trim());
				command.Parameters.AddWithValue("@book_description", TextBookDescriptionBox.Text.Trim());
				command.Parameters.AddWithValue("@actual_stock", TextActualStockBox.Text.Trim());
				command.Parameters.AddWithValue("@current_stock", TextActualStockBox.Text.Trim());
				command.Parameters.AddWithValue("@genre", genres);
				command.Parameters.AddWithValue("@book_img_link", filePath);

				command.ExecuteNonQuery();
				sqlConnection.Close();
				GridBookInventoryView.DataBind();

			}
			catch (Exception e)
			{
				Console.WriteLine(e);

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
												 "book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, " +
												 "publish_date= @publish_date, language=@language," +
												 "edition=@edition, book_cost=@book_cost, no_of_page=@no_of_page, book_description=@book_description, " +
												 "actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link" +
												 "WHERE book_id=@book_id"
												 , connection);

					var genres = ListGenreBox.GetSelectedIndices().Aggregate("", (current, i) => current + ListGenreBox.Items[i] + ",");
					genres = genres.Remove(genres.Length - 1);

					// ReSharper disable once RedundantAssignment
					var filePath = "~/book_inventory/book1.png";
					var fileName = Path.GetFileName(FileUploadImage.PostedFile.FileName);
					FileUploadImage.SaveAs(Server.MapPath("book_inventory/" + fileName));
					filePath = "~/book_inventory/" + fileName;

					command.Parameters.AddWithValue("@book_id", TextBookIdBox.Text.Trim());
					command.Parameters.AddWithValue("@book_name", TextBookNameBox.Text.Trim());
					command.Parameters.AddWithValue("@author_name", DropDownAuthorNameList.SelectedItem.Value);
					command.Parameters.AddWithValue("@publisher_name", DropDownPublisherNameList.SelectedItem.Value);
					command.Parameters.AddWithValue("@language", DropDownLanguageList.SelectedItem.Value);
					command.Parameters.AddWithValue("@edition", TextEditionBox.Text.Trim());
					command.Parameters.AddWithValue("@book_cost", TextBookCostBox.Text.Trim());
					command.Parameters.AddWithValue("@no_of_page", TextPagesBox.Text.Trim());
					command.Parameters.AddWithValue("@book_description", TextBookDescriptionBox.Text.Trim());
					command.Parameters.AddWithValue("@actual_stock", TextActualStockBox.Text.Trim());
					command.Parameters.AddWithValue("@current_stock", TextActualStockBox.Text.Trim());
					command.Parameters.AddWithValue("@genre", genres);
					command.Parameters.AddWithValue("@book_img_link", filePath);

					command.ExecuteNonQuery();
					connection.Close();
					GridBookInventoryView.DataBind();


				}
				catch (Exception e)
				{
					Console.WriteLine(e);
					throw;
				}
			}
			else
			{

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

				var sqlCommand = new SqlCommand("SELECT * FROM book_master_tbl" +
													   "WHERE book_id=@book_id;", connection);
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
	}
}