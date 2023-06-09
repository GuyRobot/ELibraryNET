﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminIssueRequest.aspx.cs" Inherits="ELibrary.AdminIssueRequest" %>

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
        <div class="flex flex-col">
            <%-- Left Panel --%>
            <div class="w-11/12 mx-auto">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4 class="text-3xl font-extrabold">Member Detail</h4>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img src="Assets/Images/book.png" alt="User Image" width="64" />
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Member ID</label>

                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberIDBox" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Book ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookIDBox" runat="server"
                                        placeholder="Book ID">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Action</label>
                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:Button ID="GoButton" CssClass="cursor-pointer mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonGo_Click" runat="server" Text="Go" />
                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonApproveIssue_Click" runat="server" Text="A">
                                            <span class="material-icons text-sm">check_circle</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton class="mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonDeleteIssue_Click" runat="server" Text="P">
                                            <span class="material-icons-outlined material-icons text-sm">delete</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Member Name</label>

                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextMemberNameBox" ReadOnly="true" runat="server"
                                            placeholder="Member Name">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--  --%>
                            <div class="w-6/12">
                                <label class="block text-sm font-medium text-gray-700">Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextBookNameBox" runat="server"
                                        placeholder="Book Name" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <%-- Button Control --%>
                    </div>
                </div>

                <br />
            </div>

            <%-- Right Panel --%>
            <div class="w-11/12 mx-auto">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 w-full py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4 class="text-3xl font-extrabold">Request List</h4>
                                </div>
                            </div>
                        </div>

                        <div class="flex mt-3">
                            <asp:SqlDataSource ID="SqlDataMemberSource" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_request_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="w-full text-center table-bordered table table-striped mx-auto" DataSourceID="SqlDataMemberSource" ID="GridMemberView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                    </Columns>

                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

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
