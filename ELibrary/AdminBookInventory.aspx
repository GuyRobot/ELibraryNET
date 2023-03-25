<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="ELibrary.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        $(document).ready(function () {
            // ReSharper disable UseOfImplicitGlobalInFunctionScope
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    // ReSharper disable once UseOfImplicitGlobalInFunctionScope
                    $('#imgPreview').setAttribute("src", e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-full px-8 py-4">
        <div class="flex space-x-6">
            <%-- Left Panel --%>
            <div class="w-5/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-8 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4>Book Detail</h4>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img id="imgPreview" src="Assets/Images/book.png" alt="Book Image" width="64" />
                            </div>
                        </div>

                        <div class="flex mt-4">
                            <div class="w-full">
                                <label class="block text-sm font-medium text-gray-700">Book Cover</label>
                                <div class="mt-1">
                                    <asp:FileUpload onchange="readURL(this)" ID="FileUploadImage" runat="server"></asp:FileUpload>
                                </div>
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex space-x-3 mt-3">
                            <div class="w-3/12">
                                <label class="block text-sm font-medium text-gray-700">Book ID</label>

                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookIdBox" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                        <asp:Button ID="GoButton" CssClass="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonGo_Click" runat="server" Text="Go" />

                                    </div>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-9/12">
                                <label class="block text-sm font-medium text-gray-700">Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookNameBox" runat="server"
                                        placeholder="Book Name" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--  --%>

                        <div class="flex space-x-3 mt-3">
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Language</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" runat="server" ID="DropDownLanguageList">
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                        <asp:ListItem Text="Marathi" Value="Marathi"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                        <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="block text-sm font-medium text-gray-700">Publish Name</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" runat="server" ID="DropDownPublisherNameList">
                                        <asp:ListItem Text="Publisher ." Value="Publisher ."></asp:ListItem>
                                        <asp:ListItem Text="Publisher .." Value="Publisher .."></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" runat="server" ID="DropDownAuthorNameList">
                                        <asp:ListItem Text="User 1" Value="User 1"></asp:ListItem>
                                        <asp:ListItem Text="User 2" Value="User 2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label class="block text-sm font-medium text-gray-700">Publish Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPublishDateBox" runat="server" TextMode="Date" placeholder="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--  --%>
                            <%--      <div class="col-md-4">
                                
                            </div>--%>

                            <%-- Genre --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Genre</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="ListGenreBox" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>

                            <%--  --%>
                        </div>

                        <%-- State and Date and --%>

                        <div class="flex space-x-3 mt-3">
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Edition</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextEditionBox" runat="server"
                                            placeholder="State">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Book Cost(per unit)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookCostBox" runat="server"
                                        placeholder="Cost">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Pages</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPagesBox" runat="server"
                                        placeholder="Pages">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="flex space-x-3 mt-3">
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Actual Stock</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextActualStockBox" runat="server"
                                            placeholder="Actual Stock">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ReadOnly="True" ID="TextCurrentStockBox" runat="server"
                                        placeholder="Current Stock">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ReadOnly="True" ID="TextIssuedBox" runat="server"
                                        placeholder="Issued Books">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--  --%>

                        <div class="flex mt-3">
                            <%--  --%>
                            <div class="w-full">
                                <label class="block text-sm font-medium text-gray-700">Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookDescriptionBox" runat="server"
                                        placeholder="Full Postal Address" TextMode="MultiLine" Rows="2">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Button Control --%>

                        <div class="flex space-x-3 mt-3">
                            <div class="w-4/12">
                                <asp:Button class="px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="AddButton" OnClick="ButtonAdd_Click" runat="server" Text="Add" />
                            </div>
                            <div class="w-4/12">
                                <asp:Button class="px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="UpdateButton" OnClick="ButtonUpdate_Click" runat="server" Text="Update" />
                            </div>
                            <div class="w-4/12">
                                <asp:Button class="px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="DeleteButton" OnClick="ButtonDelete_Click" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>

                <a href="Homepage.aspx" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
            </div>

            <%-- Right Panel --%>
            <div class="w-7/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-8 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4>Book Inventory</h4>
                                </div>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <hr />
                                </div>
                            </div>
                        </div>

                        <div class="flex">
                            <asp:SqlDataSource ID="SqlBookInventoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="table-bordered table table-striped" ID="GridBookInventoryView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlBookInventoryDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" SortExpression="book_id" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="w-full">
                                                    <div class="flex">
                                                        <div class="w-10/12">
                                                            <div class="flex">
                                                                <div class="w-full">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>'
                                                                        Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="flex">
                                                                <div class="w-full">
                                                                    <span>Author - </span>
                                                                    <asp:Label runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    <span><span>&nbsp;</span>Genre - </span>
                                                                    <asp:Label runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>
                                                                    <span>&nbsp;</span>
                                                                    <span>Language - </span>
                                                                    <asp:Label runat="server" Text='<%# Eval("language") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="flex">
                                                                <div class="w-full">
                                                                </div>
                                                            </div>

                                                            <div class="flex">
                                                                <div class="w-full">
                                                                </div>
                                                            </div>

                                                            <div class="flex">
                                                                <div class="w-full">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="w-2/12">
                                                            <asp:Image class="img-fluid p-2" ID="ImageBook" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
