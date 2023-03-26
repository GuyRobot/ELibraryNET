<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminBookIssue.aspx.cs" Inherits="ELibrary.AdminBookIssue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        $(document).ready(function () {
            // ReSharper disable UseOfImplicitGlobalInFunctionScope
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-full px-8 py-4">
        <div class="flex space-x-6">
            <%-- Left Panel --%>
            <div class="w-5/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4>Book Issue</h4>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img src="Assets/Images/book.png" alt="Author Image" width="100" />
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIDBox" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Book ID</label>
                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookIDBox" runat="server"
                                            placeholder="Book ID">
                                        </asp:TextBox>
                                        <asp:Button class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" ID="GoButton" OnClick="ButtonGo_Click" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="flex space-x-3 mt-3">
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Member Name</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberNameBox" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookNameBox" runat="server"
                                        placeholder="Book Name">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Date --%>
                        <div class="flex space-x-3 mt-3">
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Issue Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" TextMode="Date" ID="TextIssueDateBox" runat="server"
                                        placeholder="Issue Date">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Due Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" TextMode="Date" ID="TextDueDateBox" runat="server"
                                        placeholder="Due Date">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Button Control --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-6/12">
                                <asp:Button class="px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="IssueButton" OnClick="ButtonIssue_Click" runat="server" Text="Add" />
                            </div>
                            <div class="w-6/12">
                                <asp:Button class="px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="ReturnButton" OnClick="ButtonReturn_Click" runat="server" Text="Update" />
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
                <br />
            </div>

            <%-- Right Panel --%>
            <div class="w-6/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4>Issued Book List</h4>
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
                            <asp:SqlDataSource ID="SqlBookIssueDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString %>' SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="table-bordered table table-striped" OnRowDataBound="GridBookIssueView_OnRowBound" ID="GridBookIssueView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlBookIssueDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id"></asp:BoundField>
                                        <asp:BoundField DataField="member_name" HeaderText="Name" SortExpression="member_name"></asp:BoundField>
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id"></asp:BoundField>
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name"></asp:BoundField>
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date"></asp:BoundField>
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
